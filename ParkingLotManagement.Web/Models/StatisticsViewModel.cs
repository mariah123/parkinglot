namespace ParkingLotManagement.Web.Models;

public record StatisticsViewModel
{
    public int SpotsAvailable { get; set; }
    public int TodaysRevenue { get; set; }
    public int AverageDailyCheckInForMonth { get; set; }
    public int AverageDailyRevenueForMonth { get; set; }

}