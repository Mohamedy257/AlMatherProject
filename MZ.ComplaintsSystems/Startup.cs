using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MZ.ComplaintsSystems.Startup))]
namespace MZ.ComplaintsSystems
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
