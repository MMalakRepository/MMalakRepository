using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class MaterialHistoryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetHistoryData_Click(object sender, EventArgs e)
        {
                int mID = Convert.ToInt32(dsMaterials.SelectedValue);
                int sID = Convert.ToInt32(dsStore.SelectedValue);
                Response.Redirect("~/PrintMaterialHistory.aspx?MID=" + mID.ToString() + "&SID=" + sID.ToString());
        }
    }
}