using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class DeadMaterialsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnExportMaterials_Click(object sender, EventArgs e)
        {
            ExportMaterials();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
 
        }

        private void ExportMaterials()
        {
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "DeadMaterialsData " + DateTime.Now.ToShortDateString() + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            GridView1.AllowPaging = true;
            GridView1.DataBind();

        }

        protected void btnExportStore_Click(object sender, EventArgs e)
        {
            GridData.AllowPaging = false;
            GridData.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "DeadMaterialsInStore " + DateTime.Now.ToShortDateString() + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridData.GridLines = GridLines.Both;
            GridData.HeaderStyle.Font.Bold = true;
            GridData.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            GridData.AllowPaging = true;
            GridData.DataBind();
        }

        protected void btnSupplierData_Click(object sender, EventArgs e)
        {
            GridSupplierData.AllowPaging = false;
            GridSupplierData.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "DeadMaterialsBySupplier " + DateTime.Now.ToShortDateString() + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridSupplierData.GridLines = GridLines.Both;
            GridSupplierData.HeaderStyle.Font.Bold = true;
            GridSupplierData.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            GridSupplierData.AllowPaging = true;
            GridSupplierData.DataBind();
        }

        protected void btnExportstorePDF_Click(object sender, EventArgs e)
        {
            GridData.AllowPaging = false;
            GridData.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=DeadMaterialsInStore " + DateTime.Now.ToShortDateString() + ".pdf");
            GridData.GridLines = GridLines.Horizontal;
            GridData.HeaderStyle.Font.Bold = true;
            GridData.HeaderStyle.ForeColor = System.Drawing.Color.DarkBlue;
            GridData.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GridData.AllowPaging = true;
            GridData.DataBind();
        }

        protected void btnExportMaterialsPDF_Click(object sender, EventArgs e)
        {
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=DeadMaterialData " + DateTime.Now.ToShortDateString() + ".pdf");
            GridView1.GridLines = GridLines.Horizontal;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.HeaderStyle.ForeColor = System.Drawing.Color.DarkBlue;
            GridView1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GridView1.AllowPaging = true;
            GridView1.DataBind();
        }

        protected void btnExportSupplierPDF_Click(object sender, EventArgs e)
        {
            GridSupplierData.AllowPaging = false;
            GridSupplierData.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=DeadMaterialsbySupplier " + DateTime.Now.ToShortDateString() + ".pdf");
            GridSupplierData.GridLines = GridLines.Horizontal;
            GridSupplierData.HeaderStyle.Font.Bold = true;
            GridSupplierData.HeaderStyle.ForeColor = System.Drawing.Color.DarkBlue;
            GridSupplierData.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GridSupplierData.AllowPaging = true;
            GridSupplierData.DataBind();
        }


   
    }
}