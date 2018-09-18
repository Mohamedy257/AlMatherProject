using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using MZ.ComplaintsSystems.Models;
using System.Web.Security;
using System.Web.UI;

namespace MZ.ComplaintsSystems.Account
{

    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

        }

        protected void LogIn(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    var manager = new UserManager();
                    ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                    if (user != null)
                    {
                        Roles.GetRolesForUser();
                        Session["UserId"] = user.Id;
                        IdentityHelper.SignIn(manager, user, isPersistent: false);
                        string [] ro=Roles.GetRolesForUser();
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    }
                    else
                    {
                        FailureText.Text = "خطاء في اسم المستخدم او كلمة المرور";
                        ErrorMessage.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                FailureText.Text = "خطاء في اسم المستخدم او كلمة المرور";
                ErrorMessage.Visible = true;
            }
        }
    }
}