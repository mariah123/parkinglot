using System.ComponentModel;

namespace ParkingLotManagement.Domain.Entities;
public class ParkingLot
{
    public int HourlyFee { get; set; } = 0;

    public int TotalSpots { get; set; } = 0;

}
