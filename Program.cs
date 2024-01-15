using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

class Program
{
    static void Main()
    {
        BuildWebHost().Run();
    }

    public static IWebHost BuildWebHost() =>
        WebHost.CreateDefaultBuilder()
            .Configure(app =>
            {
                app.Run(context =>
                {
                    return context.Response.WriteAsync("Hello, Docker! This is a web application.");
                });
            })
            .Build();
}

