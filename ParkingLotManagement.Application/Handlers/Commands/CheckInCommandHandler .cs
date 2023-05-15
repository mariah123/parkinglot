using AutoMapper;
using MediatR;
using ParkingLotManagement.Application.Dtos;
using ParkingLotManagement.Domain.Entities;
using ParkingLotManagement.Infrastructure.Repository;

namespace ParkingLotManagement.Application.Handlers.Commands;
public class CheckInCommandHandler : IRequestHandler<CheckInCommandRequest, CheckInCommandResponse>
{
    private readonly IParkingLotRepository _parkingLotRepository;
    public CheckInCommandHandler(IParkingLotRepository repo)
    {
        _parkingLotRepository = repo;
    }
    public async Task<CheckInCommandResponse> Handle(CheckInCommandRequest request, CancellationToken cancellationToken)
    {
        try
        {
            var result = await _parkingLotRepository.CheckIn(request.TagNumber);

            var queryResponse = new CheckInCommandResponse
            {
                Success = result.OperationSuccess,
                Message = result.AlreadyExists ? "Car already in the parking lot" :
                            !result.Available ? "Parking space not available": "Checkin successful"
            };

            return queryResponse;

        }
        catch (Exception e)
        {
            throw new ApplicationException(e.Message, e);
        }
    }
}
