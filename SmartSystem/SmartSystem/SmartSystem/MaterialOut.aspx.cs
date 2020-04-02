using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class MaterialOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetStoreReport_Click(object sender, EventArgs e)
        {
            if (Store.SelectedIndex == 0)
            {
                lblOrderErr.Text = "Please Select a Store ";
                lblOrderErr.Visible = true;
                lblOrderErr.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int Storeid = Convert.ToInt32(Store.SelectedValue);
                Response.Redirect("PrintMaterialsOut.aspx?ID=" + Storeid.ToString());
            }
        }
    }
}