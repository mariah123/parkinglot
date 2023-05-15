CREATE TABLE SystemUser
(
  Id                UNIQUEIDENTIFIER PRIMARY KEY, 
  Username          VARCHAR(50) NOT NULL,
  Role              VARCHAR(20) NOT NULL,
  CreatedById       UNIQUEIDENTIFIER NULL,
  CreatedDate       DATETIMEOFFSET NOT NULL,
  UpdatedDate       DATETIMEOFFSET NULL,
  UpdatedById       UNIQUEIDENTIFIER NULL
);
GO

CREATE TABLE ParkingLot
(
  Id                UNIQUEIDENTIFIER PRIMARY KEY,   
  HourlyFee         INT NOT NULL,
  TotalSpots        INT NOT NULL,
  CreatedById       UNIQUEIDENTIFIER NOT NULL,
  CreatedDate       DATETIMEOFFSET NOT NULL,
  UpdatedDate       DATETIMEOFFSET NULL,
  UpdatedById       UNIQUEIDENTIFIER NULL
);
GO

CREATE TABLE Vehical
(
  Id                UNIQUEIDENTIFIER PRIMARY KEY,  
  ParkingLotId      UNIQUEIDENTIFIER NOT NULL,
  VehicalTagNumber  NVARCHAR(20) NOT NULL,
  CheckInTime       DATETIMEOFFSET NOT NULL,
  CheckOutTime      DATETIMEOFFSET NULL,
  HourlyFee         INT NOT NULL,
  FeeCharged        INT NULL,
  CreatedById       UNIQUEIDENTIFIER NOT NULL,
  CreatedDate       DATETIMEOFFSET NOT NULL,
  UpdatedDate       DATETIMEOFFSET NULL,
  UpdatedById       UNIQUEIDENTIFIER NULL,
  CONSTRAINT FK_ParkingLotVehical
  FOREIGN KEY (ParkingLotId) REFERENCES ParkingLot(Id)

);
GO

INSERT INTO SystemUser(Id, Username, Role, CreatedDate)
Values('8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', 'Mariah', 'admin', SYSDATETIMEOFFSET());

INSERT INTO ParkingLot(Id, HourlyFee, TotalSpots, CreatedById, CreatedDate)
Values('25673774-79C4-4930-B321-42E2FB77FEE5', 15, 15, '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET());

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

DECLARE @CheckinTime DATETIMEOFFSET = DATEADD(day, (1- (FLOOR(RAND() * (10-5 + 1)) + 5)), SYSDATETIMEOFFSET()), @CheckOutTime DATETIMEOFFSET, @FeeCharged INT;
SET @CheckOutTime = DATEADD(HOUR, (FLOOR(RAND() * (10-5 + 1)) + 5), @CheckinTime);
SET @FeeCharged = DATEDIFF(HOUR, @CheckinTime, @CheckOutTime) * 15;

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, CheckOutTime, HourlyFee, FeeCharged, CreatedById, CreatedDate, UpdatedById, UpdatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), @CheckinTime, @CheckOutTime, 15, @FeeCharged,
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET(), '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, HourlyFee, CreatedById, CreatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), SYSDATETIMEOFFSET(), 15, 
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, HourlyFee, CreatedById, CreatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), SYSDATETIMEOFFSET(), 15, 
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, HourlyFee, CreatedById, CreatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), SYSDATETIMEOFFSET(), 15, 
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO

INSERT INTO Vehical (Id, ParkingLotId, VehicalTagNumber, CheckInTime, HourlyFee, CreatedById, CreatedDate)
     VALUES (NEWID(), '25673774-79C4-4930-B321-42E2FB77FEE5', 'adf'+ Convert(varchar,(FLOOR(RAND() * (100-50 + 1)) + 50)), SYSDATETIMEOFFSET(), 15, 
	 '8C435E08-5B9A-4B8C-B1E0-72D87B6A35AA', SYSDATETIMEOFFSET()); 
GO