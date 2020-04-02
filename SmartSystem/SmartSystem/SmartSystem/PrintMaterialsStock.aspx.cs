
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
    public partial class PrintMaterialsStock : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            int StoreID =  int.Parse(Request.QueryString["ID"]);
            
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT Stores.StoreName, Materials.MaterialNo, Materials.MaterialName, MaterialsForOrder.Stock, MaterialsForOrder.Height, "+
                " MaterialsForOrder.Width, MaterialsForOrder.Notes, MaterialsForOrder.MaterialType, SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                " FROM Materials INNER JOIN SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN Supplier ON Materials.SupplierID = Supplier.SupplierID "+ 
                " INNER JOIN MaterialsForOrder ON Materials.ID = MaterialsForOrder.MaterialID INNER JOIN Stores ON MaterialsForOrder.StoreID = Stores.ID Where Stores.ID = " + StoreID.ToString();

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/AvailableStock.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("MaterialsStock", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }

     
}