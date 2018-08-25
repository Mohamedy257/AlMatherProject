using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace MZ.ComplaintsSystems
{
    public partial class _Default : Page
    {
        public string CurrentRole { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
          //  if (User.Identity.GetUserId() == null) Response.Redirect("~/Account/Login");
        }
    }
}