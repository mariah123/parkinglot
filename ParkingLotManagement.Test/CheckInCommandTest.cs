using Microsoft.AspNetCore.Mvc.Testing;
using System.Text;

namespace ParkingLotManagement.Test;

public class CheckInCommandTest: IClassFixture<WebApplicationFactory<Program>>
{
    private readonly WebApplicationFactory<Program> _applicationFactory;
    public CheckInCommandTest(WebApplicationFactory<Program> applicationFactory)
    {
        _applicationFactory = applicationFactory;
    }

    [Theory]
    [InlineData(" ")]
    public async void Checkin_WhiteSpaceCarTag_ReturnFailerMessage(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckIn";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("Tag Number cannot be null", responseString);
    }

    [Theory]
    [InlineData("yuo989")]
    public async void Checkin_WithValidTagNumber_ReturnSuccess(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckIn";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("CheckIn Successful", responseString);
    }

    [Theory]
    [InlineData("hello123")]
    public async void Checkin_WithAlreadyExistingCarTag_ReturnFailerMessage(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckIn";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("Car already in the parking lot", responseString);
    }

    [Theory]
    [InlineData("hello123")]
    [InlineData("hello124")]
    [InlineData("hello125")]
    [InlineData("hello126")]
    [InlineData("hello127")]
    [InlineData("hello128")]
    [InlineData("hello129")]
    [InlineData("hello120")]
    [InlineData("hello143")]
    [InlineData("hello153")]
    [InlineData("hello163")]
    [InlineData("hello173")]
    [InlineData("hello183")]
    [InlineData("hello193")]
    [InlineData("hello223")]
    [InlineData("hello323")]
    public async void Checkin_WhenNotEnoughSpace_ReturnFailerMessage(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckIn";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("Car already in the parking lot", responseString);
    }
}