using MediatR;

namespace ParkingLotManagement.Application.Dtos;

public record CheckInCommandRequest: IRequest<CheckInCommandResponse>
{
    public string TagNumber { get; set; }
}

public class CheckInCommandResponse : BaseResponse
{

}
