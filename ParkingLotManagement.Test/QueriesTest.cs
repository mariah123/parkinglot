using Microsoft.AspNetCore.Mvc.Testing;

namespace ParkingLotManagement.Test;

public class QueriesTest: IClassFixture<WebApplicationFactory<Program>>
{
    private readonly WebApplicationFactory<Program> _applicationFactory;
    public QueriesTest(WebApplicationFactory<Program> applicationFactory)
    {
        _applicationFactory = applicationFactory;
    }

    [Theory]
    [InlineData("/Home/GetParkedCarsData")]
    [InlineData("/Home/GetStatistics")]
    public async void LoadsParkingLotData_returnsTrue(string Url)
    {
        var client = _applicationFactory.CreateClient();

        var response = await client.GetAsync(Url);

        bool success = response.IsSuccessStatusCode;

        Assert.True(success);
    }

    [Theory]
    [InlineData("hello123")]
    public async void CheckCarExistsInParkinglot_returnsTrue(string TagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var response = await client.GetAsync("/Home/GetParkedCarsData");

        string content = await response.Content.ReadAsStringAsync();

        Assert.Contains(TagNumber, content);
    }

    [Theory]
    [InlineData("abc123")]
    public async void CheckCarNotExistsInParkinglot_returnsTrue(string TagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var response = await client.GetAsync("/Home/GetParkedCarsData");

        string content = await response.Content.ReadAsStringAsync();

        Assert.DoesNotContain(TagNumber, content);
    }
}