using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class StockReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetStoreReport_Click(object sender, EventArgs e)
        {
            int Storeid = Convert.ToInt32(Store.SelectedValue);
            int Mid = Convert.ToInt32(dsMaterials.SelectedValue);
            Response.Redirect("PrintMaterialsStock.aspx?SID=" + Storeid.ToString() + "&MID=" + Mid.ToString());
        }
    }
}