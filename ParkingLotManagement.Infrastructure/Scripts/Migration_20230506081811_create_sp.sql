CREATE OR ALTER PROCEDURE CheckIn                                
@TagNumber  NVARCHAR(20),
@ParkingLotId UNIQUEIDENTIFIER = '25673774-79C4-4930-B321-42E2FB77FEE5',
@CurrentUserId UNIQUEIDENTIFIER = '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA'
AS
BEGIN
  	DECLARE @AlreadyExists BIT = 0, @SpotAvailable BIT = 0, @TotalSpots INT, @HourlyFee INT = 0, @Success BIT = 0;
	
	SELECT @TotalSpots = TotalSpots, @HourlyFee = HourlyFee FROM ParkingLot;


    SELECT @AlreadyExists = 1
    FROM Vehical v 
	INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
    WHERE v.VehicalTagNumber = @TagNumber AND v.ParkingLotId = @ParkingLotId
	AND v.CheckOutTime is null;

		
	SELECT @SpotAvailable = CASE WHEN (@TotalSpots - (SELECT Count(v.VehicalTagNumber)
	FROM Vehical v 
	INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
	WHERE v.CheckOutTime is null AND v.ParkingLotId = @ParkingLotId)) > 0 THEN 1 ELSE 0 END;

	IF(@AlreadyExists = 0 AND @SpotAvailable = 1)
	BEGIN
		INSERT INTO Vehical (Id, VehicalTagNumber, ParkingLotId, CheckInTime, HourlyFee, CreatedById, CreatedDate)
		VALUES (NEWID(), @TagNumber, @ParkingLotId, SYSDATETIMEOFFSET(), @HourlyFee, @CurrentUserId , SYSDATETIMEOFFSET());
		SET @Success = 1;
	END
		
	SELECT @AlreadyExists as AlreadyExists, @SpotAvailable as Available, @Success as OperationSuccess;
END;
GO

CREATE OR ALTER PROCEDURE CheckOut                                 
@TagNumber  NVARCHAR(20),
@ParkingLotId UNIQUEIDENTIFIER = '25673774-79C4-4930-B321-42E2FB77FEE5',
@CurrentUserId UNIQUEIDENTIFIER = '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA'
AS
BEGIN
  	DECLARE @Registered BIT = 0, @Success BIT = 0, @FeeCharged INT = 0, @HourlyFee INT = 0;

	Select @HourlyFee = HourlyFee 
	FROM ParkingLot 
	WHERE Id = @ParkingLotId;


    SELECT @Registered = 1
    FROM Vehical v 
	INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
    WHERE v.VehicalTagNumber = @TagNumber
	AND v.CheckOutTime is null AND v.ParkingLotId = @ParkingLotId;

	IF(@Registered = 1)
	BEGIN

	UPDATE Vehical 
	SET CheckOutTime = SYSDATETIMEOFFSET(), 
		UpdatedById = @CurrentUserId,
		UpdatedDate = SYSDATETIMEOFFSET(),
		FeeCharged = DATEDIFF(HOUR, CheckinTime, SYSDATETIMEOFFSET()) * @HourlyFee,
		@FeeCharged = CASE WHEN (DATEDIFF(HOUR, CheckinTime, SYSDATETIMEOFFSET()) * @HourlyFee) > 0 
		THEN DATEDIFF(HOUR, CheckinTime, SYSDATETIMEOFFSET()) * @HourlyFee ELSE @HourlyFee END
	WHERE VehicalTagNumber = @TagNumber AND CheckoutTime is null AND ParkingLotId = @ParkingLotId;
	SET @Success = 1;

	END
		
	SELECT @FeeCharged as FeeCharged, @Registered as Registered, @Success as OperationSuccess; 
END;
GO



CREATE OR ALTER PROCEDURE GetParkingLotDetail  
@ParkingLotId UNIQUEIDENTIFIER = '25673774-79C4-4930-B321-42E2FB77FEE5'
AS
BEGIN
  	SELECT v.VehicalTagNumber AS TagNumber, format(v.CheckInTime,'h:mm tt') AS CheckInTime, DATEDIFF(HOUR, v.CheckinTime, SYSDATETIMEOFFSET()) AS ElapsedTime 
	FROM Vehical v 
	INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
	WHERE v.CheckOutTime is null AND v.ParkingLotId = @ParkingLotId
	ORDER BY CheckinTime DESC;

	SELECT HourlyFee, TotalSpots 
	FROM ParkingLot
	WHERE Id = @ParkingLotId;
END;
GO

CREATE OR ALTER PROCEDURE GetStatistics  
@ParkingLotId UNIQUEIDENTIFIER = '25673774-79C4-4930-B321-42E2FB77FEE5'
AS
BEGIN
  	DECLARE @TotalSpots INT = 0, @AvailableSpots INT = 0, @TodaysRevenue INT = 0, @AverageMonthlyRevenue INT = 0, @AverageMonthlyCheckIns INT = 0,
	@HourlyFee INT = 0;

	SELECT @HourlyFee = HourlyFee, @TotalSpots = TotalSpots 
	FROM ParkingLot 
	WHERE Id = @ParkingLotId;

	SELECT @AverageMonthlyCheckIns = sum(num) / 30
	FROM (
			SELECT Count(CAST(v.CheckInTime AS date)) as num
			FROM Vehical v 
			INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
			WHERE v.CheckInTime >= DATEADD(day, -30, CAST(SYSDATETIMEOFFSET() AS date)) 
			AND v.ParkingLotId = @ParkingLotId
			Group by CAST(v.CheckInTime AS date)
		 ) c;

		 
	SELECT @AvailableSpots = (@TotalSpots - (SELECT Count(v.VehicalTagNumber)
			FROM Vehical v 
			INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
			WHERE v.CheckOutTime is null AND v.ParkingLotId = @ParkingLotId));

	SELECT @TodaysRevenue = Sum(DATEDIFF(HOUR, v.CheckinTime, v.CheckOutTime))* @HourlyFee
	FROM Vehical v 
	INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
	WHERE CAST(v.CheckOutTime AS date) = CAST(SYSDATETIMEOFFSET() AS date)
	AND v.ParkingLotId = @ParkingLotId; 

	SELECT @AverageMonthlyRevenue = SUM(DATEDIFF(HOUR, v.CheckinTime, v.CheckOutTime)) * @HourlyFee 
	FROM Vehical v 
	INNER JOIN ParkingLot p on p.Id = v.ParkingLotId
	WHERE CAST(v.CheckOutTime AS date) >  DATEADD(day, -30, CAST(SYSDATETIMEOFFSET() AS date))
	AND v.ParkingLotId = @ParkingLotId;

	SELECT @AvailableSpots AS SpotsAvailable, @TodaysRevenue AS TodaysRevenue, 
	@AverageMonthlyCheckIns AS AverageDailyCheckInForMonth, @AverageMonthlyRevenue AS AverageDailyRevenueForMonth;
    
END;
GO


