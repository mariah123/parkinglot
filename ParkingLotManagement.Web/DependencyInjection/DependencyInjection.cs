using AspNetCoreHero.ToastNotification;
using Microsoft.Extensions.DependencyInjection;
using ParkingLotManagement.Application;
using ParkingLotManagement.Infrastructure;
using ParkingLotManagement.Web.Filters;

namespace ParkingLotManagement.Web;
public static class DependencyInjection
{
    public static IServiceCollection AddServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddControllersWithViews(options => options.Filters.Add<ErrorHandlingFilter>());
        services.AddApplication();
        services.AddInfrastructure(configuration);
        services.AddNotyf(config => { config.DurationInSeconds = 10; config.IsDismissable = true; config.Position = NotyfPosition.TopCenter; });
        return services;
    }
}
