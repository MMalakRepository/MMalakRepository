using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Web.Security;


namespace SmartSystem.Login
{
    public partial class RegisterNewUser : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!User.IsInRole("Management"))
            //{

            //    Logger log = new Logger();
            //    log.ActionDate = DateTime.Now;
            //    log.ActionType = "Authorization";
            //    log.UserName = User.Identity.Name;
            //    log.Action = "User tried to access User Registration Page";
            //    db.Loggers.Add(log);
            //    db.SaveChanges();
            //    Response.Redirect("Unauthorized.aspx");
            //}
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var userstore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userstore);

            var user = new IdentityUser() { UserName = username.Value };
            IdentityResult result = manager.Create(user, password.Value);
            if(UserRoles.SelectedIndex != 0)
            {
                var use = manager.FindByName(username.Value);
                var roleresult = manager.AddToRole(use.Id, UserRoles.SelectedItem.ToString());
            }

            if (result.Succeeded)
            {
                lblError.Visible = true;
                lblError.Text = "New User has been created Successfully ";
                lblError.ForeColor = System.Drawing.Color.Green;

                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
                Response.Redirect("~/Default.aspx");

            }
            else
            {
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = result.Errors.FirstOrDefault();
            }



        }

        
    }
}