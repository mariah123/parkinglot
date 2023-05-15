using AutoMapper;
using MediatR;
using ParkingLotManagement.Domain.Entities;
using ParkingLotManagement.Infrastructure.Repository;

namespace ParkingLotManagement.Application.Handlers.Queries;
public class GetParkingLotDetailQueryHandler : IRequestHandler<GetParkingLotDetailQueryRequest, GetParkingLotDetailQueryResponse>
{
    private readonly IParkingLotRepository _parkingLotRepository;
    private readonly IMapper _mapper;

    public GetParkingLotDetailQueryHandler(IParkingLotRepository repo,
        IMapper mapper)
    {
        _parkingLotRepository = repo;
        _mapper = mapper;
    }

    public async Task<GetParkingLotDetailQueryResponse> Handle(GetParkingLotDetailQueryRequest request, CancellationToken cancellationToken)
    {
        try
        {
            var result = await _parkingLotRepository.GetParkingLotDetail();

            var queryResponse = new GetParkingLotDetailQueryResponse
            {
                ParkingLot = _mapper.Map<ParkingLot>(result.Set2.FirstOrDefault()),
                Vehicals = _mapper.Map<List<Vehical>>(result.Set1)
            };

            return queryResponse;

        }
        catch(Exception e)
        {
            throw new ApplicationException(e.Message, e);
        }
       
    }
}
