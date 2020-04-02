
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
    public partial class PrintSafetyReport : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT  Stores.StoreName, Materials.MaterialName, Materials.MaterialNo, Supplier.Name AS Supplier," +
                            " SubCategories.SubCategoryName, MaterialInStock.StockOnHand, MaterialInStock.SafetyStock, " +
                            "  MaterialInStock.Location, MaterialInStock.ReservedStock " +
                            " FROM            MaterialInStock INNER JOIN " +
                            "  Materials ON MaterialInStock.MaterialID = Materials.ID INNER JOIN " +
                            " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN " +
                            " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                            " Supplier ON MaterialInStock.Supplier = Supplier.SupplierID AND Materials.SupplierID = Supplier.SupplierID " +
                            " Where MaterialInStock.StockOnHand < MaterialInStock.SafetyStock Order By Materials.MaterialName Desc";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/SafetyStock.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("SafetyStock", dt));
            ReportViewer1.LocalReport.Refresh();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}