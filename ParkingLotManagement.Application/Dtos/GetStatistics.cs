using MediatR;

namespace ParkingLotManagement.Application.Dtos;

public record GetStatisticsQueryRequest: IRequest<GetStatisticsQueryResponse>
{
}

public class GetStatisticsQueryResponse 
{
    public int SpotsAvailable { get; set; }
    public int TodaysRevenue { get; set; }
    public int AverageDailyCheckInForMonth { get; set; }
    public int AverageDailyRevenueForMonth { get; set; }
}
