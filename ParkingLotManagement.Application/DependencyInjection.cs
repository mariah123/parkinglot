using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using ParkingLotManagement.Application.Automapper;
using System.Reflection;

namespace ParkingLotManagement.Application;
public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        services.AddMediatR(cfg => cfg.RegisterServicesFromAssembly(Assembly.GetExecutingAssembly()));
        var mappingConfig = new MapperConfiguration(mc =>
        {
            mc.AddProfile(new ParkingLotProfile());
        });

        IMapper mapper = mappingConfig.CreateMapper();
        services.AddSingleton(mapper);
        return services;
    }
}
