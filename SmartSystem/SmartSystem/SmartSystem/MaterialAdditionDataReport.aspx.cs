using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class MaterialAdditionDataReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetContainerData_Click(object sender, EventArgs e)
        {
            if(dsContainers.SelectedIndex == 0)
            {
                lblOrderErr.Text = "Please Select a Container ";
                lblOrderErr.Visible = true;
                lblOrderErr.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int ContainerID = Convert.ToInt32(dsContainers.SelectedValue);
                Response.Redirect("PrintMaterialAddition.aspx?ID="+ ContainerID.ToString());
            }
        }
    }
}