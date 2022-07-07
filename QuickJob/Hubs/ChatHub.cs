using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickJob.Hubs
{
    public class ChatHub : Hub
    {
        public static void ShowEmployer()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
            context.Clients.All.displayChatEmployer();
        }
        public static void ShowChatCandidate()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
            context.Clients.All.displayShowChatCandidate();
        }
        public static void ShowChatEmployer()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
            context.Clients.All.displayShowChatEmployer();
        }
    }
}