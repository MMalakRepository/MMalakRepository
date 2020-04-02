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
    public partial class DefectiveMaterialsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }


        private void ExportGridToExcel()
        {
            GridData.AllowPaging = false;
            GridData.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "MaterialsData " + DateTime.Now.ToShortDateString() + ".xls";
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

        private void ExportMaterials()
        {
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "CuttingListMaterialsData " + DateTime.Now.ToShortDateString() + ".xls";
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
            string FileName = "CuttingListMaterialsInStore " + DateTime.Now.ToShortDateString() + ".xls";
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

        protected void btnExportMaterials_Click(object sender, EventArgs e)
        {
            ExportMaterials();
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
            string FileName = "CuttingListMaterialsBySupplier " + DateTime.Now.ToShortDateString() + ".xls";
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
            Response.AddHeader("content-disposition", "attachment;filename=CuttingListMaterialsInStore " + DateTime.Now.ToShortDateString() + ".pdf");
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
            Response.AddHeader("content-disposition", "attachment;filename=CuttingListMaterialData " + DateTime.Now.ToShortDateString() + ".pdf");
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
            Response.AddHeader("content-disposition", "attachment;filename=CuttingListMaterialsbySupplier " + DateTime.Now.ToShortDateString() + ".pdf");
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