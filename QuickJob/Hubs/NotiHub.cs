using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickJob.Hubs
{
    public class NotiHub : Hub
    {
        public static void ShowMess()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<NotiHub>();
            context.Clients.All.displayShowMess();
        }
    }
}