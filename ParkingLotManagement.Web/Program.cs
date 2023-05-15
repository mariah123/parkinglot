using AspNetCoreHero.ToastNotification.Extensions;
using FluentMigrator.Runner;
using ParkingLotManagement.Web;
using ParkingLotManagement.Web.Middlewares;

var builder = WebApplication.CreateBuilder(args);
{
    builder.Services.AddServices(builder.Configuration);
}

var app = builder.Build();
{
    if (!app.Environment.IsDevelopment())
    {
        app.UseExceptionHandler("/Home/Error");
        app.UseHsts();
    }

    app.UseMiddleware<ErrorHandlingMiddleware>();
    app.UseHttpsRedirection();
    app.UseStaticFiles();
    app.UseNotyf();
    app.UseRouting();

    app.UseAuthorization();

    app.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");

    using (var scope = app.Services.CreateScope())
    {
        var migrator = scope.ServiceProvider.GetService<IMigrationRunner>();
        migrator.MigrateUp();
    };

    app.Run();
}

public partial class Program { }
