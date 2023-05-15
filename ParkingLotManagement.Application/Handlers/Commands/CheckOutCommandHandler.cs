using AutoMapper;
using MediatR;
using ParkingLotManagement.Application.Dtos;
using ParkingLotManagement.Infrastructure.Repository;

namespace ParkingLotManagement.Application.Handlers.Commands;
public class CheckOutCommandHandler : IRequestHandler<CheckOutCommandRequest, CheckOutCommandResponse>
{
    private readonly IParkingLotRepository _parkingLotRepository;
    private readonly IMapper _mapper;
    public CheckOutCommandHandler(IParkingLotRepository repo,
        IMapper mapper)
    {
        _parkingLotRepository = repo;
        _mapper = mapper;
    }
    public async Task<CheckOutCommandResponse> Handle(CheckOutCommandRequest request, CancellationToken cancellationToken)
    {
        try
        {
            var result = await _parkingLotRepository.CheckOut(request.TagNumber);

            var commandResponse = new CheckOutCommandResponse
            {
                Success = result.OperationSuccess,
                Message = !result.Registered ? "The car is not registered with us." : "Checkout successful",
                FeeCharged = result.FeeCharged
                
            };

            return commandResponse;

        }
        catch (Exception e)
        {
            throw new ApplicationException(e.Message, e);
        }
    }
}
