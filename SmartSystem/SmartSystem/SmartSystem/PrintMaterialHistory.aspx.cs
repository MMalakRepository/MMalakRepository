
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
    public partial class PrintMaterialHistory : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            int MID =   int.Parse(Request.QueryString["MID"]);
            int SID =   int.Parse(Request.QueryString["SID"]);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = " SELECT  Stores.StoreName, Materials.MaterialName, Materials.Description, " + 
                            " MaterialHistory.ActionDate, MaterialHistory.UserName, " +
                            " MaterialHistory.TransactionName, MaterialHistory.OldStock, MaterialHistory.NewStock, "+
                            " MaterialHistory.Note " +
                            " FROM            MaterialHistory INNER JOIN " +
                            " Materials ON MaterialHistory.MaterialID = Materials.ID INNER JOIN " +
                            " Stores ON MaterialHistory.StoreID = Stores.ID Where MaterialID = " + MID.ToString() + " And Stores.ID = " + SID.ToString();
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialHistory.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("MaterialHistoryData", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }

     
}