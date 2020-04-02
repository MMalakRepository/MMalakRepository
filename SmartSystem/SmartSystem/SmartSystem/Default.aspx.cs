using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using SmartSystem;

namespace SmartShutter.Login
{
    public partial class Login : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var userstore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userstore);
            var user = userManager.Find(txtUserName.Value, txtpassword.Value);

            if(user != null) {

                var authenticatedMaanger = HttpContext.Current.GetOwinContext().Authentication;
                var useridentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                // sign In 
                authenticatedMaanger.SignIn(new AuthenticationProperties() { IsPersistent = false }, useridentity);
                Session["UserName"] = txtUserName.Value;
                Response.Redirect("~/Home.aspx");

            }
            else
            {
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
                LblError.Text = "Invalid UserName or Password";
            }
             

        }
    }
}