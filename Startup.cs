using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(UzimaRX.Startup))]
namespace UzimaRX
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
