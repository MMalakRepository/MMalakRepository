using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
 using iTextSharp.text.html.simpleparser;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.Reporting.WebForms;
using System.Data;

namespace SmartSystem
{
    public partial class CuttingListDataReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetSupplierData_Click(object sender, EventArgs e)
        {
            int SupplierID = Convert.ToInt32(selectsupplier.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "  SELECT  Stores.StoreName, Materials.MaterialNo, Materials.MaterialName, Category.CategoryName, " +
                            " SubCategories.SubCategoryName, Supplier.Name AS Supplier, CuttingListsMaterials.Notes, " +
                            " CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width," +
                            " CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName " +
                            " FROM Materials INNER JOIN " +
                            " CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN " +
                            " Stores ON CuttingListsMaterials.StoreID = Stores.ID INNER JOIN " +
                            " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                            " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                            " Supplier ON Materials.SupplierID = Supplier.SupplierID " +
                            " Where CuttingListsMaterials.IsActive = 1 and Supplier.SupplierID = " + SupplierID.ToString() + "";
                   
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportSupplier.Visible = true;
            ReportSupplier.ProcessingMode = ProcessingMode.Local;
            ReportSupplier.LocalReport.ReportPath = Server.MapPath("./Reports/CuttingMaterialData.rdlc");
            ReportSupplier.LocalReport.DataSources.Clear();
            ReportSupplier.LocalReport.DataSources.Add(new ReportDataSource("CusttingMaterialData", dt));
            ReportSupplier.LocalReport.DisplayName = "CuttingMaterialDataBySupplier" + DateTime.Now.ToString("ddMMyyyyhhmmss");
            //ReportParameter PR = new ReportParameter("ReportDesc", "By Supplier");
            //ReportSupplier.LocalReport.SetParameters(PR);
            ReportSupplier.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectSupplier();", true);
        }

        protected void btnGetMaterialData_Click(object sender, EventArgs e)
        {
            int MaterialID = Convert.ToInt32(selectitems.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "  SELECT  Stores.StoreName, Materials.MaterialNo, Materials.MaterialName, Category.CategoryName, " +
                            " SubCategories.SubCategoryName, Supplier.Name AS Supplier, CuttingListsMaterials.Notes, " +
                            " CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width," +
                            " CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName " +
                            " FROM Materials INNER JOIN " +
                            " CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN " +
                            " Stores ON CuttingListsMaterials.StoreID = Stores.ID INNER JOIN " +
                            " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                            " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                            " Supplier ON Materials.SupplierID = Supplier.SupplierID " +
                            " Where CuttingListsMaterials.IsActive = 1 and Materials.ID = " + MaterialID.ToString() + "";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportMaterial.Visible = true;
            ReportMaterial.ProcessingMode = ProcessingMode.Local;
            ReportMaterial.LocalReport.ReportPath = Server.MapPath("./Reports/CuttingMaterialData.rdlc");
            ReportMaterial.LocalReport.DataSources.Clear();
            ReportMaterial.LocalReport.DataSources.Add(new ReportDataSource("CusttingMaterialData", dt));
            ReportMaterial.LocalReport.DisplayName = "CuttingMaterialDataByMaterial" + DateTime.Now.ToString("ddMMyyyyhhmmss");
            //ReportParameter PR = new ReportParameter("ReportDesc", "By Supplier");
            //ReportMaterial.LocalReport.SetParameters(PR);
            ReportMaterial.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectMaterial();", true);
        }

        protected void btnGetStoreData_Click(object sender, EventArgs e)
        {
            int StoreID = Convert.ToInt32(SelectStores.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "  SELECT  Stores.StoreName, Materials.MaterialNo, Materials.MaterialName, Category.CategoryName, " +
                            " SubCategories.SubCategoryName, Supplier.Name AS Supplier, CuttingListsMaterials.Notes, " +
                            " CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width," +
                            " CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName " +
                            " FROM Materials INNER JOIN " +
                            " CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN " +
                            " Stores ON CuttingListsMaterials.StoreID = Stores.ID INNER JOIN " +
                            " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                            " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                            " Supplier ON Materials.SupplierID = Supplier.SupplierID " +
                            " Where CuttingListsMaterials.IsActive = 1 and Stores.ID = " + StoreID.ToString() + "";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportStore.Visible = true;
            ReportStore.ProcessingMode = ProcessingMode.Local;
            ReportStore.LocalReport.ReportPath = Server.MapPath("./Reports/CuttingMaterialData.rdlc");
            ReportStore.LocalReport.DataSources.Clear();
            ReportStore.LocalReport.DataSources.Add(new ReportDataSource("CusttingMaterialData", dt));
            ReportStore.LocalReport.DisplayName = "CuttingMaterialDataByMaterial" + DateTime.Now.ToString("ddMMyyyyhhmmss");
            //ReportParameter PR = new ReportParameter("ReportDesc", "By Supplier");
            //ReportMaterial.LocalReport.SetParameters(PR);
            ReportStore.LocalReport.Refresh();
     
        }

        protected void btnGetDataByCategory_Click(object sender, EventArgs e)
        {
            int Category = Convert.ToInt32(SelectCategory.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "  SELECT  Stores.StoreName, Materials.MaterialNo, Materials.MaterialName, Category.CategoryName, " +
                            " SubCategories.SubCategoryName, Supplier.Name AS Supplier, CuttingListsMaterials.Notes, " +
                            " CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width," +
                            " CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName " +
                            " FROM Materials INNER JOIN " +
                            " CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN " +
                            " Stores ON CuttingListsMaterials.StoreID = Stores.ID INNER JOIN " +
                            " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                            " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                            " Supplier ON Materials.SupplierID = Supplier.SupplierID " +
                            " Where CuttingListsMaterials.IsActive = 1 and Category.CategoruID = " + Category.ToString() + "";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportCategory.Visible = true;
            ReportCategory.ProcessingMode = ProcessingMode.Local;
            ReportCategory.LocalReport.ReportPath = Server.MapPath("./Reports/CuttingMaterialData.rdlc");
            ReportCategory.LocalReport.DataSources.Clear();
            ReportCategory.LocalReport.DataSources.Add(new ReportDataSource("CusttingMaterialData", dt));
            ReportCategory.LocalReport.DisplayName = "CuttingMaterialDataByCategory" + DateTime.Now.ToString("ddMMyyyyhhmmss");
            //ReportParameter PR = new ReportParameter("ReportDesc", "By Supplier");
            //ReportMaterial.LocalReport.SetParameters(PR);
            ReportCategory.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectCategory();", true);
        }
 
 
        protected void btnGetDataBySubCategory_Click(object sender, EventArgs e)
        {
            int SubCategory = Convert.ToInt32(SelectSubCategory.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "  SELECT  Stores.StoreName, Materials.MaterialNo, Materials.MaterialName, Category.CategoryName, " +
                            " SubCategories.SubCategoryName, Supplier.Name AS Supplier, CuttingListsMaterials.Notes, " +
                            " CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width," +
                            " CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName " +
                            " FROM Materials INNER JOIN " +
                            " CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN " +
                            " Stores ON CuttingListsMaterials.StoreID = Stores.ID INNER JOIN " +
                            " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                            " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                            " Supplier ON Materials.SupplierID = Supplier.SupplierID " +
                            " Where CuttingListsMaterials.IsActive = 1 and SubCategories.ID = " + SubCategory.ToString() + "";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportSubCategory.Visible = true;
            ReportSubCategory.ProcessingMode = ProcessingMode.Local;
            ReportSubCategory.LocalReport.ReportPath = Server.MapPath("./Reports/CuttingMaterialData.rdlc");
            ReportSubCategory.LocalReport.DataSources.Clear();
            ReportSubCategory.LocalReport.DataSources.Add(new ReportDataSource("CusttingMaterialData", dt));
            ReportSubCategory.LocalReport.DisplayName = "CuttingMaterialDataBySubCategory" + DateTime.Now.ToString("ddMMyyyyhhmmss");
            //ReportParameter PR = new ReportParameter("ReportDesc", "By Supplier");
            //ReportMaterial.LocalReport.SetParameters(PR);
            ReportSubCategory.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectCategory();", true);
        }
 
    }
}