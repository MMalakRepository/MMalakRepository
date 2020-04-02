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

namespace SmartSystem
{
    public partial class InternalOrdersReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 

        protected void btnExportstorePDF_Click(object sender, ImageClickEventArgs e)
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
            Response.AddHeader("content-disposition", "attachment;filename=InternalOrdersDetails-Customer-"+Customer.SelectedItem.ToString()+ " - "+ DateTime.Now.ToShortDateString() + ".pdf");
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

        protected void btnExportStoreExce_Click(object sender, ImageClickEventArgs e)
        {
            GridData.AllowPaging = false;
            GridData.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "InternalOrdersDetails - Customer - "+Customer.SelectedItem.ToString()+ " - "+ DateTime.Now.ToShortDateString() + ".xls";
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

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void btnExportMaterialPDF_Click(object sender, ImageClickEventArgs e)
        {
            GridMaterials.AllowPaging = false;
            GridMaterials.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=InternalOrdersMaterial - " + DateTime.Now.ToShortDateString() + ".pdf");
            GridMaterials.GridLines = GridLines.Horizontal;
            GridMaterials.HeaderStyle.Font.Bold = true;
            GridMaterials.HeaderStyle.ForeColor = System.Drawing.Color.DarkBlue;
            GridMaterials.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GridMaterials.AllowPaging = true;
            GridMaterials.DataBind();
        }

        protected void btnExportMaterialExcel_Click(object sender, ImageClickEventArgs e)
        {
            GridMaterials.AllowPaging = false;
            GridMaterials.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "InternalOrdersByMaterial - " + DateTime.Now.ToShortDateString() + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridMaterials.GridLines = GridLines.Both;
            GridMaterials.HeaderStyle.Font.Bold = true;
            GridMaterials.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            GridMaterials.AllowPaging = true;
            GridMaterials.DataBind();
        }

        protected void btnExportCustomerOrdersPDF_Click(object sender, ImageClickEventArgs e)
        {
            GridOrders.AllowPaging = false;
            GridOrders.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=InternalOrdersOfCustomer-" + SelectCustomerOrders.SelectedItem.ToString() + " - " + DateTime.Now.ToShortDateString() + ".pdf");
            GridOrders.GridLines = GridLines.Horizontal;
            GridOrders.HeaderStyle.Font.Bold = true;
            GridOrders.HeaderStyle.ForeColor = System.Drawing.Color.DarkBlue;
            GridOrders.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GridOrders.AllowPaging = true;
            GridOrders.DataBind();
        }

        protected void btnExportCustomerOrdersExcel_Click(object sender, ImageClickEventArgs e)
        {
            GridOrders.AllowPaging = false;
            GridOrders.DataBind();
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "InternalOrders - Customer - " + SelectCustomerOrders.SelectedItem.ToString() + " - " + DateTime.Now.ToShortDateString() + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridOrders.GridLines = GridLines.Both;
            GridOrders.HeaderStyle.Font.Bold = true;
            GridOrders.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            GridOrders.AllowPaging = true;
            GridOrders.DataBind();
        }

        protected void GridOrders_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridOrders.SelectedRow;
            int orderID = int.Parse(gv.Cells[2].Text);
            Response.Redirect("printOrder.aspx?ID=" + orderID.ToString());

        }
    }
}