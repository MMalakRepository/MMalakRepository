
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
    public partial class PrintMaterialsOut : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            int StoreID =  int.Parse(Request.QueryString["ID"]);
            
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Customers.CustomerName, Materials.MaterialNo, Materials.MaterialName, OrderDetails.Notes, " + 
                " Orders.ID As OrderNo, Stores.StoreName, OrderDetails.MaterialType, OrderDetails.Quantity, OrderDetails.Height, "+
                     "    OrderDetails.Width FROM            OrderDetails INNER JOIN " +
                        " Materials ON OrderDetails.MaterialID = Materials.ID INNER JOIN "+
                        " Orders ON OrderDetails.OrderID = Orders.ID INNER JOIN " +
                        " Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN " +
                       "  Stores ON OrderDetails.StoreID = Stores.ID where OrderDetails.Notes !='' and OrderDetails.IsActive = 1 and  Stores.ID = " + StoreID.ToString();

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsOut.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("MaterialsOut", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }

     
}