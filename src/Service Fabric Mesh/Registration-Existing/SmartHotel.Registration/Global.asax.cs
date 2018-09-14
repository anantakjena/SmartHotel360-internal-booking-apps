using Microsoft.ApplicationInsights.Extensibility;
using System;
using System.Diagnostics;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace SmartHotel.Registration
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Set App Insights Instrumentation Key
            string appInsightsInstrumentationKey = Environment.GetEnvironmentVariable("AppInsightsKey");

            if (!String.IsNullOrEmpty(appInsightsInstrumentationKey))
            {
                TelemetryConfiguration.Active.InstrumentationKey = appInsightsInstrumentationKey;
            }

            Trace.TraceInformation($"AI Key: {appInsightsInstrumentationKey}");
        }
    }
}