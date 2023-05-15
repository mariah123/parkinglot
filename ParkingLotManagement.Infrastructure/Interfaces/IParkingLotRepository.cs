using Insight.Database;
using ParkingLotManagement.Infrastructure.Dtos;

namespace ParkingLotManagement.Infrastructure.Repository;
public interface IParkingLotRepository
{
    Task<CheckInResponse> CheckIn(string tagNumber);
    Task<CheckOutResponse> CheckOut(string tagNumber);
    Task<Results<VehicalResponse,ParkingLotDetail>> GetParkingLotDetail();
    Task<GetStatisticsResponse> GetStatistics();
}
