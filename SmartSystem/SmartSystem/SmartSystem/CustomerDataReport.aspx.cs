using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class CustomerDataReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetCustomerOrders_Click(object sender, EventArgs e)
        {
            if(Customer.SelectedIndex == 0)
            {
                lblOrderErr.Text = "Please Select a Customer ";
                lblOrderErr.Visible = true;
                lblOrderErr.ForeColor = System.Drawing.Color.Red;
            }
            else if(adate.Value == null || adate.Value == String.Empty)
            {
                lblOrderErr.Text = "Please Select a Date ";
                lblOrderErr.Visible = true;
                lblOrderErr.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                DateTime dt = Convert.ToDateTime(adate.Value);
                int Customerid = Convert.ToInt32(Customer.SelectedValue);
                Response.Redirect("PrintCustomers.aspx?ID="+ Customerid.ToString() +"&Date="+ dt.ToLongDateString());
            }
        }
    }
}