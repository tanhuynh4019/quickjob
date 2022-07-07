using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickJob.Hubs
{
    public class CvHub : Hub
    {
        public static void ShowSubmitCvsCandidate()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<CvHub>();
            context.Clients.All.displaySubmitCandidate();
        }
        public static void ShowSubmitCvsEmployer()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<CvHub>();
            context.Clients.All.displaySubmitEmployer();
        }
        public static void ShowEmployerViewCV()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<CvHub>();
            context.Clients.All.displayEmployerViewCV();
        }
        public static void ShowAttentionEmployer()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<CvHub>();
            context.Clients.All.displayAttentionEmployer();
        }
    }
}