
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
    public partial class PrintMaterialAddition : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            int ContainerID =  int.Parse(Request.QueryString["ID"]);
            
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = " SELECT        Container.CNumber, Container.CDescription, Container.CDate, Container.CUser, "+
                            " Container.Notes, ContainerData.Quantity, ContainerData.Notes AS ItemNote, Materials.MaterialName, Stores.StoreName "+
                            " FROM Container INNER JOIN ContainerData ON Container.ID = ContainerData.ContainerID INNER JOIN " +
                            " Materials ON ContainerData.MaterialID = Materials.ID INNER JOIN "+
                            " Stores ON ContainerData.StoreID = Stores.ID "+
                            " WHERE (ContainerData.IsActive = 1) And Container.ID =  " + ContainerID.ToString();

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialAddition.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("MaterialAddition", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }

     
}