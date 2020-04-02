
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
    public partial class PrintOrder : System.Web.UI.Page
    {
        Entities db = new Entities();
 

        protected void Page_Init(object sender, EventArgs e)
        {
            int OrderID =   int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                //var mainB = db.OrderDetailsDatas.Where(x => x.ID == OrderID).ToList();
                //var list = db.OrderDetailsDatas.Where(x => x.ID == OrderID).ToList();


                //var list = from b in db.OrderDetailsDatas
                //           where b.ID == OrderID
                //           select b;

                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
                string cmdtxt = "Select * from orderDetailsData where ID = " + OrderID;

                SqlCommand cmd = new SqlCommand(cmdtxt, con);
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.Text;
                DataTable dt = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.Fill(dt);

                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("./Reports/OrderPrint.rdlc");
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("SmartShutterDataSet", dt));
                ReportViewer1.LocalReport.Refresh();

                //LocalReport report = new LocalReport();
                //report.ReportPath = Server.MapPath("./Reports/OrderPrint.rdlc");
                //report.DataSources.Clear();
                //report.DataSources.Add(new ReportDataSource("SmartShutterDataSet", dt));
                //PrintToPrinter(report);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static List<Stream> m_streams;
        private static int m_currentPageIndex = 0;

        public static void PrintToPrinter(LocalReport report)
        {
            Export(report);

        }

        public static void Export(LocalReport report, bool print = true)
        {
            string deviceInfo =
             @"<DeviceInfo>
                <OutputFormat>EMF</OutputFormat>
                <PageWidth>8in</PageWidth>
                <PageHeight>8in</PageHeight>
                <MarginTop>0.5in</MarginTop>
                <MarginLeft>0.5in</MarginLeft>
                <MarginRight>0.5in</MarginRight>
                <MarginBottom>0.5in</MarginBottom>
            </DeviceInfo>";
            Warning[] warnings;
            m_streams = new List<Stream>();
            report.Render("Image", deviceInfo, CreateStream, out warnings);
            foreach (Stream stream in m_streams)
                stream.Position = 0;

            if (print)
            {
                Print();
            }
        }


        public static void Print()
        {
            if (m_streams == null || m_streams.Count == 0)
                throw new Exception("Error: no stream to print.");
            PrintDocument printDoc = new PrintDocument();
            if (!printDoc.PrinterSettings.IsValid)
            {
                throw new Exception("Error: cannot find the default printer.");
            }
            else
            {
                printDoc.PrintPage += new PrintPageEventHandler(PrintPage);
                m_currentPageIndex = 0;
                printDoc.Print();
            }
        }

        public static Stream CreateStream(string name, string fileNameExtension, Encoding encoding, string mimeType, bool willSeek)
        {
            Stream stream = new MemoryStream();
            m_streams.Add(stream);
            return stream;
        }

        public static void PrintPage(object sender, PrintPageEventArgs ev)
        {
            Metafile pageImage = new Metafile(m_streams[m_currentPageIndex]);

            // Adjust rectangular area with printer margins.
            Rectangle adjustedRect = new Rectangle(
                ev.PageBounds.Left - (int)ev.PageSettings.HardMarginX,
                ev.PageBounds.Top - (int)ev.PageSettings.HardMarginY,
                ev.PageBounds.Width,
                ev.PageBounds.Height);

            // Draw a white background for the report
            ev.Graphics.FillRectangle(Brushes.White, adjustedRect);

            // Draw the report content
            ev.Graphics.DrawImage(pageImage, adjustedRect);

            // Prepare for the next page. Make sure we haven't hit the end.
            m_currentPageIndex++;
            ev.HasMorePages = (m_currentPageIndex < m_streams.Count);
        }

        public static void DisposePrint()
        {
            if (m_streams != null)
            {
                foreach (Stream stream in m_streams)
                    stream.Close();
                m_streams = null;
            }
        }

 
    }
}