namespace ParkingLotManagement.Infrastructure.Dtos;
public class VehicalResponse
{
    public string TagNumber { get; set; }
    public string CheckInTime { get; set; }
    public int ElapsedTime { get; set; }
}


public class ParkingLotDetail
{
    public int HourlyFee { get; set; }
    public int TotalSpots { get; set; }
}
