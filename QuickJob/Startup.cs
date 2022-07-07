using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QuickJob.Startup))]
namespace QuickJob
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
