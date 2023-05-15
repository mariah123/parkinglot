namespace ParkingLotManagement.Infrastructure.Dtos;

public record CheckInResponse 
{
    public bool AlreadyExists { get; set; }

    public bool Available { get; set; }

    public bool OperationSuccess { get; set; }
}
