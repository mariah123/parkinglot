using ParkingLotManagement.Domain.Entities;

namespace ParkingLotManagement.Web.Models;

public class ParkingLotViewModel
{
    public ParkingLot ParkingLot { get; set; } 

    public List<Vehical> Vehicals { get; set; }

}