namespace ParkingLotManagement.Infrastructure.Dtos;

public record CheckOutResponse
{
    public int FeeCharged { get; set; }

    public bool Registered { get; set; }

    public bool OperationSuccess { get; set; }
}
