
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
    public partial class PrintCustomerOrders : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Init(object sender, EventArgs e)
        {
            int CustomerID = int.Parse(Request.QueryString["ID"]);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Customers.CustomerName, Stores.StoreName, Materials.MaterialNo, " +
                            " Materials.MaterialName, Orders.ID AS orderNo, Orders.OrderDate, Orders.UserName, OrderDetails.Quantity, OrderDetails.Height, " +
                            "  OrderDetails.Width, OrderDetails.MaterialType, OrderDetails.Notes" +
                            "  FROM    OrderDetails INNER JOIN " +
                            "  Materials ON OrderDetails.MaterialID = Materials.ID INNER JOIN " +
                            "  Orders ON OrderDetails.OrderID = Orders.ID INNER JOIN " +
                            "  Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN " +
                            "  Stores ON OrderDetails.StoreID = Stores.ID Where OrderDetails.IsActive = 1 and " +
                            " Orders.CustomerID = " + CustomerID + " Order By Orders.ID Desc ";

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            //SavePDF(ReportViewer1,"D:/");
            savereport();
            //ConvertReportToPDF(ReportViewer1.LocalReport);

            //Warning[] warnings;
            //string[] streamIds;
            //string contentType;
            //string encoding;
            //string extension;

            ////Export the RDLC Report to Byte Array.
            //byte[] bytes = ReportViewer1.LocalReport.Render("PDF", null, out contentType, out encoding, out extension, out streamIds, out warnings);

            ////Download the RDLC Report in Word, Excel, PDF and Image formats.
            //Response.Clear();
            //Response.Buffer = true;
            //Response.Charset = "";
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.ContentType = contentType;
            //Response.AppendHeader("Content-Disposition", "attachment; filename=RDLC." + extension);
            //Response.BinaryWrite(bytes);
            //Response.Flush();
            //Response.End();

        }
        private void savereport()
        {
            string FileName = "CustomerDataReport_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".pdf";
            string extension;
            string encoding;
            string mimeType;
            string[] streams;
            Warning[] warnings;

            string contentType = "application/pdf";

            Byte[] mybytes = ReportViewer1.LocalReport.Render("PDF", null,
                            out extension, out encoding,
                            out mimeType, out streams, out warnings); //for exporting to PDF  
            using (FileStream fs = File.Create(Server.MapPath("~/Reports/") + FileName))
            {
                fs.Write(mybytes, 0, mybytes.Length);
            }

            //Response.ClearHeaders();
            //Response.ClearContent();
            //Response.Buffer = true;
            //Response.Clear();
            Response.ContentType = contentType;
            Response.AddHeader("Content-Disposition", "attachment; filename=" + FileName);
            Response.WriteFile(Server.MapPath("~/Reports/" + FileName));
            //Response.WriteFile("D:/" + FileName);
            //Response.Flush();
            //Response.Close();
            //Response.End();   


            if (mybytes != null)
            {
                Response.BinaryWrite(mybytes);
                string strFilePath = @"D:\MIchael";
                string filename = Path.Combine(strFilePath, FileName);
                using (FileStream fs = new FileStream(filename, FileMode.Create))
                {
                    fs.Write(mybytes, 0, mybytes.Length);
                }
            }
        }

        private string ConvertReportToPDF(LocalReport rep)
        {
            string reportType = "PDF";
            string mimeType;
            string encoding;

            string deviceInfo = "<DeviceInfo>" +
               "  <OutputFormat>PDF</OutputFormat>" +
               "  <PageWidth>8.27in</PageWidth>" +
               "  <PageHeight>6.0in</PageHeight>" +
               "  <MarginTop>0.2in</MarginTop>" +
               "  <MarginLeft>0.2in</MarginLeft>" +
               "  <MarginRight>0.2in</MarginRight>" +
               "  <MarginBottom>0.2in</MarginBottom>" +
               "</DeviceInfo>";

            Warning[] warnings;
            string[] streamIds;
            string extension = string.Empty;

            byte[] bytes = rep.Render(reportType, deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);
            //string localPath = System.Configuration.ConfigurationManager.AppSettings["TempFiles"].ToString();  
            string localPath = AppDomain.CurrentDomain.BaseDirectory;
            string fileName = Guid.NewGuid().ToString() + ".pdf";
            localPath = localPath + fileName;
            System.IO.File.WriteAllBytes(localPath, bytes);
            return localPath;
        }
    }


}