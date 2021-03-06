﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class CustomerOrdersReport : System.Web.UI.Page
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
            else
            {

                int Customerid = Convert.ToInt32(Customer.SelectedValue);
                Response.Redirect("PrintCustomerOrders.aspx?ID="+ Customerid.ToString());
            }
        }
    }
}