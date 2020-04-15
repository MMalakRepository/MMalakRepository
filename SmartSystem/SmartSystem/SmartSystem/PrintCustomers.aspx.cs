
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;
using System.Data.SqlClient;
//using System.Drawing;

namespace SmartSystem
{
    public partial class PrintCustomers : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            int CustomerID =   int.Parse(Request.QueryString["ID"]);
            DateTime adate = Convert.ToDateTime(Request.QueryString["Date"]);
            
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Customers.CustomerName, Stores.StoreName, Materials.MaterialNo, " +
                       " Materials.MaterialName, Orders.ID AS orderNo, Orders.OrderDate, Orders.UserName, OrderDetails.Quantity, OrderDetails.Height, "+
                       "  OrderDetails.Width, OrderDetails.MaterialType, OrderDetails.Notes"+
                       "  FROM    OrderDetails INNER JOIN " +
                       "  Materials ON OrderDetails.MaterialID = Materials.ID INNER JOIN "+
                       "  Orders ON OrderDetails.OrderID = Orders.ID INNER JOIN "+
                       "  Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN "+
                       "  Stores ON OrderDetails.StoreID = Stores.ID Where OrderDetails.IsActive = 1 and "+
                       " Orders.CustomerID = " + CustomerID + " and CAST(Orders.OrderDate as Date) = '" + adate.ToShortDateString() + "' ";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/Customers.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("CustomersDataSet", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }

     
}