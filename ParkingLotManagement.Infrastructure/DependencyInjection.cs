using FluentMigrator.Runner;
using Insight.Database;
using Insight.Database.Reliable;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ParkingLotManagement.Infrastructure.Repository;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

namespace ParkingLotManagement.Infrastructure;
public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddScoped<IDbConnection>(x => new ReliableConnection<SqlConnection>(configuration.GetConnectionString("default").ToString()));
        services.AddScoped(typeof(IParkingLotRepository), x =>
        {
            var connection = x.GetRequiredService<IDbConnection>();
            return connection.AsParallel(typeof(IParkingLotRepository));
        });
       
        services.AddFluentMigratorCore()
            .ConfigureRunner(config => config.AddSqlServer()
            .WithGlobalConnectionString(configuration.GetConnectionString("default").ToString())
            .ScanIn(Assembly.GetExecutingAssembly()).For.All())
            .AddLogging(log => log.AddFluentMigratorConsole());
        
        return services;
    }
}
