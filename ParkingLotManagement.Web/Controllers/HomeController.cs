using Insight.Database.MissingExtensions;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ParkingLotManagement.Application.Dtos;
using ParkingLotManagement.Web.Models;

namespace ParkingLotManagement.Web.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly IMediator _mediator;

    public HomeController(ILogger<HomeController> logger,
        IMediator mediator)
    {
        _logger = logger;
        _mediator = mediator;
    }

    public IActionResult Index()
    {
        return View();
    }

    [HttpGet]
    public async Task<JsonResult> GetParkedCarsData()
    {
        ParkingLotViewModel vmParkingLot = new();
        var result = await _mediator.Send(new GetParkingLotDetailQueryRequest());
        if (result is not null)
        {
            vmParkingLot.ParkingLot = result.ParkingLot;
            vmParkingLot.Vehicals = result.Vehicals;
        }
        
        string json = JsonConvert.SerializeObject(vmParkingLot);
        return Json(json); 
    }

    [HttpPost]
    public async Task<JsonResult> CheckIn([FromBody] CheckInCheckOutRequestModel model)
    {
        if (model.TagNumber.IsNullOrWhiteSpace())
        {
            return Json(JsonConvert.SerializeObject(new { Success = false, Message = "Tag Number cannot be null" }));
        }
       
        var result = await _mediator.Send(new CheckInCommandRequest() { TagNumber = model.TagNumber });

        return Json(JsonConvert.SerializeObject(result));
    }

    [HttpPost]
    public async Task<JsonResult> CheckOut([FromBody] CheckInCheckOutRequestModel model)
    {
        if (model.TagNumber.IsNullOrWhiteSpace())
        {
            return Json(JsonConvert.SerializeObject(new { Success = false, Message = "Tag Number cannot be null" }));
        }

        var result = await _mediator.Send(new CheckOutCommandRequest() { TagNumber = model.TagNumber});

        return Json(JsonConvert.SerializeObject(result));
    }

    [HttpGet]
    public async Task<IActionResult> GetStatistics()
    {
        StatisticsViewModel vmStats = new();
        var result = await _mediator.Send(new GetStatisticsQueryRequest());
        if (result is not null)
        {
            vmStats.AverageDailyRevenueForMonth = result.AverageDailyRevenueForMonth;
            vmStats.AverageDailyCheckInForMonth = result.AverageDailyCheckInForMonth;
            vmStats.TodaysRevenue = result.TodaysRevenue;
            vmStats.SpotsAvailable = result.SpotsAvailable;
        }

        return PartialView("_StatsReport", vmStats);
    }

}
