using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Diagnostics;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Net;
using System.Text.Json;

namespace ParkingLotManagement.Web.Filters;

public class ErrorHandlingFilter : ExceptionFilterAttribute
{
    private readonly INotyfService _notyf;
    public ErrorHandlingFilter(INotyfService notyf) {
        _notyf = notyf;
    }
    public override void OnException(ExceptionContext context)
    {
        int statusCode = (int)HttpStatusCode.InternalServerError; 

        switch (context.Exception)
        {
            case ApplicationException e:
                statusCode = (int)HttpStatusCode.BadRequest;
                break;
            case KeyNotFoundException e:
                statusCode = (int)HttpStatusCode.NotFound;
                break;
            default:
                statusCode = (int)HttpStatusCode.InternalServerError;
                break;
        }

        var result = new ObjectResult(new
        {
            context.Exception.Message,
            context.Exception.Source,
            ExceptionType = context.Exception.GetType().FullName,
        })
        {
            StatusCode = statusCode

        };

        context.ExceptionHandled = true;
       // context.Result = _notyf.Error(context.Exception.Message);

        _notyf.Error(context.Exception.Message);

    }
}
