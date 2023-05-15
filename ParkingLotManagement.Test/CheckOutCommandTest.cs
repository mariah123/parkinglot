using Microsoft.AspNetCore.Mvc.Testing;
using Newtonsoft.Json;
using System.Net.Http.Json;
using System.Text;

namespace ParkingLotManagement.Test;

public class CheckOutCommandsTest : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly WebApplicationFactory<Program> _applicationFactory;
    public CheckOutCommandsTest(WebApplicationFactory<Program> applicationFactory)
    {
        _applicationFactory = applicationFactory;
    }

    [Theory]
    [InlineData(" ")]
    public async void CheckOut_WhiteSpaceCarTag_ReturnFailerMessage(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckOut";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("Tag Number cannot be null", responseString);
    }

    [Theory]
    [InlineData("kkiio00")]
    public async void Checkout_WithValidTagNumber_ReturnSuccess(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckOut";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("Checkout successful", responseString);
    }

    [Theory]
    [InlineData("kion23")]
    public async void Checkout_WithNotRegisteredCarTag_ReturnFailerMessage(string tagNumber)
    {
        var client = _applicationFactory.CreateClient();

        var url = "/Home/CheckOut";
        var input = new { TagNumber = tagNumber };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(input);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);

        string responseString = await response.Content.ReadAsStringAsync();

        Assert.Contains("The car is not registered with us.", responseString);
    }

}