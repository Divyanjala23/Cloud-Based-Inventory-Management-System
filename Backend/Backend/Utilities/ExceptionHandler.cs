using Microsoft.AspNetCore.Http;
using System;
using System.Threading.Tasks;

namespace Backend.Utilities
{
    public static class ExceptionHandler
    {
        public static async Task HandleExceptionAsync(HttpContext context, Exception ex)
        {
            context.Response.StatusCode = StatusCodes.Status500InternalServerError;
            context.Response.ContentType = "application/json";

            await context.Response.WriteAsync(new
            {
                StatusCode = context.Response.StatusCode,
                Message = "An error occurred while processing your request.",
                DetailedMessage = ex.Message
            }.ToString());
        }
    }
}