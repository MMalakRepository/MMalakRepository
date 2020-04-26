using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Web.Security;

namespace SmartSystem
{
    public partial class SystemLog : System.Web.UI.Page
    {
        Entities db = new Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Roles.IsUserInRole(User.Identity.Name, "Management"))
            {
                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "Authorization";
                log.UserName = User.Identity.Name;
                log.Action = "User tried to access System Log Page";
                db.Loggers.Add(log);
                db.SaveChanges();

                Response.Redirect("Unauthorized.aspx");
            }


        }
        protected void btnGetLogData_Click(object sender, EventArgs e)
        {
            string  ActionType = Event.SelectedItem.ToString();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = @" SELECT UserName, ActionDate, ActionType, LogID, Action FROM Logger Where ActionType = '"+ ActionType +"' ORDER BY LogID DESC ";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportLog.Visible = true;
            ReportLog.ProcessingMode = ProcessingMode.Local;
            ReportLog.LocalReport.ReportPath = Server.MapPath("./Reports/SystemLog.rdlc");
            ReportLog.LocalReport.DataSources.Clear();
            ReportLog.LocalReport.DataSources.Add(new ReportDataSource("SystemLog", dt));
            ReportLog.LocalReport.DisplayName = "SystemLogReport" + DateTime.Now.ToString("ddMMyyyyhhmmss");
            //ReportParameter PR = new ReportParameter("ReportDesc", "By Supplier");
            //ReportMaterial.LocalReport.SetParameters(PR);
            ReportLog.LocalReport.Refresh();
        }
    }
}