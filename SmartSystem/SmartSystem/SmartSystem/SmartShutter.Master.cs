using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using SmartSystem;
 

namespace SmartShutter
{
    public partial class SmartShutter : System.Web.UI.MasterPage
    {
        Entities db = new Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserName.Text = Session["UserName"].ToString().ToUpper();
        }
    }
}