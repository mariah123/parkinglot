using FluentMigrator;

namespace ParkingLotManagement.Infrastructure.Migrations;

[Migration(20230506064700)]
public class Migration_20230506064700_create_schema : ForwardOnlyMigration
{
    public override void Up()
    {
        Execute.EmbeddedScript("Migration_20230506064700_create_schema.sql");
    }
}
