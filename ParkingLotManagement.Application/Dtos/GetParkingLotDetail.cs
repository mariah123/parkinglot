using MediatR;
using ParkingLotManagement.Domain.Entities;

public record GetParkingLotDetailQueryRequest :IRequest<GetParkingLotDetailQueryResponse>
{
}

public class GetParkingLotDetailQueryResponse
{
    public GetParkingLotDetailQueryResponse()
    {
        Vehicals = new List<Vehical>();
    }

    public ParkingLot ParkingLot { get; set; }
   public List<Vehical> Vehicals { get; set; } 
}
