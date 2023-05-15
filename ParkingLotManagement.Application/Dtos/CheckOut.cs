using MediatR;

namespace ParkingLotManagement.Application.Dtos;

public record CheckOutCommandRequest : IRequest<CheckOutCommandResponse>
{
    public string TagNumber { get; set; }
}

public class CheckOutCommandResponse : BaseResponse
{
    public int FeeCharged { get; set; }
}
