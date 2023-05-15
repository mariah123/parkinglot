using AutoMapper;
using MediatR;
using ParkingLotManagement.Application.Dtos;
using ParkingLotManagement.Infrastructure.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParkingLotManagement.Application.Handlers.Queries;
public class GetStatisticsQueryHandler : IRequestHandler<GetStatisticsQueryRequest, GetStatisticsQueryResponse>
{
    private readonly IParkingLotRepository _parkingLotRepository;
    private readonly IMapper _mapper;

    public GetStatisticsQueryHandler(IParkingLotRepository repo,
        IMapper mapper)
    {
        _parkingLotRepository = repo;
        _mapper = mapper;
    }

    public async Task<GetStatisticsQueryResponse> Handle(GetStatisticsQueryRequest request, CancellationToken cancellationToken)
    {
        try
        {
            var result = await _parkingLotRepository.GetStatistics();
           
            return _mapper.Map<GetStatisticsQueryResponse>(result);

        }
        catch (Exception e)
        {
            throw new ApplicationException(e.Message, e);
        }
    }
}
