using FluentMigrator;

namespace ParkingLotManagement.Infrastructure.Migrations;

[Migration(20230506081811)]
public class Migration_20230506081811_create_sp : ForwardOnlyMigration
{
    public override void Up()
    {
        Execute.EmbeddedScript("Migration_20230506081811_create_sp.sql");
    }
}
