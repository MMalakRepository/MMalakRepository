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

namespace SmartSystem
{
    public partial class MaterialDataReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        protected void btnGetSagetyData_Click(object sender, EventArgs e)
        {
            int Storeid = Convert.ToInt32(SafetyStores.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Materials.MaterialNo, Materials.MaterialName, MaterialInStock.StockOnHand," +
                 " MaterialInStock.SafetyStock, MaterialInStock.Location, MaterialInStock.ReservedStock, Stores.StoreName, Category.CategoryName, " +
                         " SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                         " FROM            Materials INNER JOIN " +
                         " MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN " +
                         " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN" +
                         " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                         " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                         " Supplier ON Materials.SupplierID = Supplier.SupplierID AND MaterialInStock.Supplier = Supplier.SupplierID  " +
                         " Where MaterialInStock.SafetyStock < MaterialInStock.StockOnHand and Stores.ID = "+ Storeid.ToString() +"  ";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportSafety.Visible = true;
            ReportSafety.ProcessingMode = ProcessingMode.Local;
            ReportSafety.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsData.rdlc");
            ReportSafety.LocalReport.DataSources.Clear();
            ReportSafety.LocalReport.DataSources.Add(new ReportDataSource("MaterialsData", dt));
            ReportStore.LocalReport.DisplayName = "MaterialSafetyByStore" + DateTime.Now.ToShortDateString();
            ReportSafety.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectSafety();", true);
        }

        protected void btnGetSupplierData_Click(object sender, EventArgs e)
        {
            int SupplierID = Convert.ToInt32(selectsupplier.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Materials.MaterialNo, Materials.MaterialName, MaterialInStock.StockOnHand," +
                 " MaterialInStock.SafetyStock, MaterialInStock.Location, MaterialInStock.ReservedStock, Stores.StoreName, Category.CategoryName, " +
                         " SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                         " FROM            Materials INNER JOIN " +
                         " MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN " +
                         " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN" +
                         " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                         " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                         " Supplier ON Materials.SupplierID = Supplier.SupplierID AND MaterialInStock.Supplier = Supplier.SupplierID  " +
                         " Where Supplier.SupplierID = " + SupplierID.ToString() + "";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportSupplier.Visible = true;
            ReportSupplier.ProcessingMode = ProcessingMode.Local;
            ReportSupplier.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsData.rdlc");
            ReportSupplier.LocalReport.DataSources.Clear();
            ReportSupplier.LocalReport.DataSources.Add(new ReportDataSource("MaterialsData", dt));
            ReportStore.LocalReport.DisplayName = "MaterialDataBySupplier" + DateTime.Now.ToShortDateString();
            ReportSupplier.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectSupplier();", true);
        }

        protected void btnGetMaterialData_Click(object sender, EventArgs e)
        {
            int MaterialID = Convert.ToInt32(selectitems.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Materials.MaterialNo, Materials.MaterialName, MaterialInStock.StockOnHand," +
                 " MaterialInStock.SafetyStock, MaterialInStock.Location, MaterialInStock.ReservedStock, Stores.StoreName, Category.CategoryName, " +
                         " SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                         " FROM            Materials INNER JOIN " +
                         " MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN " +
                         " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN" +
                         " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                         " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                         " Supplier ON Materials.SupplierID = Supplier.SupplierID AND MaterialInStock.Supplier = Supplier.SupplierID  " +
                         " Where Materials.ID = " + MaterialID.ToString() + "";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportMaterial.Visible = true;
            ReportMaterial.ProcessingMode = ProcessingMode.Local;
            ReportMaterial.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsData.rdlc");
            ReportMaterial.LocalReport.DataSources.Clear();
            ReportStore.LocalReport.DisplayName = "MaterialDataByMaterial" + DateTime.Now.ToShortDateString();
            ReportMaterial.LocalReport.DataSources.Add(new ReportDataSource("MaterialsData", dt));
            ReportMaterial.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectMaterial();", true);
        }

        protected void btnGetStoreData_Click(object sender, EventArgs e)
        {
            int Storeid = Convert.ToInt32(SelectStores.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Materials.MaterialNo, Materials.MaterialName, MaterialInStock.StockOnHand," +
                 " MaterialInStock.SafetyStock, MaterialInStock.Location, MaterialInStock.ReservedStock, Stores.StoreName, Category.CategoryName, " +
                         " SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                         " FROM            Materials INNER JOIN " +
                         " MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN " +
                         " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN" +
                         " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                         " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                         " Supplier ON Materials.SupplierID = Supplier.SupplierID AND MaterialInStock.Supplier = Supplier.SupplierID  " +
                         " Where Stores.ID = " + Storeid.ToString() + "";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportStore.Visible = true;
            ReportStore.ProcessingMode = ProcessingMode.Local;
            ReportStore.LocalReport.DisplayName = "MaterialDataByStore" + DateTime.Now.ToShortDateString();
            ReportStore.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsData.rdlc");
            ReportStore.LocalReport.DataSources.Clear();
            ReportStore.LocalReport.DataSources.Add(new ReportDataSource("MaterialsData", dt));
            ReportStore.LocalReport.Refresh();
        }

        protected void btnGetDataByCategory_Click(object sender, EventArgs e)
        {
            int Category = Convert.ToInt32(SelectCategory.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Materials.MaterialNo, Materials.MaterialName, MaterialInStock.StockOnHand," +
                 " MaterialInStock.SafetyStock, MaterialInStock.Location, MaterialInStock.ReservedStock, Stores.StoreName, Category.CategoryName, " +
                         " SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                         " FROM            Materials INNER JOIN " +
                         " MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN " +
                         " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN" +
                         " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                         " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                         " Supplier ON Materials.SupplierID = Supplier.SupplierID AND MaterialInStock.Supplier = Supplier.SupplierID  " +
                         " Where Category.CategoruID = " + Category.ToString() + "";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportCategory.Visible = true;
            ReportCategory.ProcessingMode = ProcessingMode.Local;
            ReportCategory.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsData.rdlc");
            ReportCategory.LocalReport.DataSources.Clear();
            ReportStore.LocalReport.DisplayName = "MaterialDataByCategory" + DateTime.Now.ToShortDateString();
            ReportCategory.LocalReport.DataSources.Add(new ReportDataSource("MaterialsData", dt));
            ReportCategory.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectCategory();", true);
        }

        protected void btnGetDataBySubCategory_Click(object sender, EventArgs e)
        {
            int SubCategory = Convert.ToInt32(SelectSubCategory.SelectedValue);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SmartShutterConnectionString"].ConnectionString;
            string cmdtxt = "SELECT        Materials.MaterialNo, Materials.MaterialName, MaterialInStock.StockOnHand," +
                 " MaterialInStock.SafetyStock, MaterialInStock.Location, MaterialInStock.ReservedStock, Stores.StoreName, Category.CategoryName, " +
                         " SubCategories.SubCategoryName, Supplier.Name AS Supplier " +
                         " FROM            Materials INNER JOIN " +
                         " MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN " +
                         " Stores ON MaterialInStock.StoreID = Stores.ID INNER JOIN" +
                         " SubCategories ON Materials.TypeID = SubCategories.ID INNER JOIN " +
                         " Category ON SubCategories.CategoryID = Category.CategoruID INNER JOIN " +
                         " Supplier ON Materials.SupplierID = Supplier.SupplierID AND MaterialInStock.Supplier = Supplier.SupplierID  " +
                         " Where SubCategories.ID = " + SubCategory.ToString() + "";
            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.CommandTimeout = 0;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            adapt.Fill(dt);

            ReportSubCategory.Visible = true;
            ReportSubCategory.ProcessingMode = ProcessingMode.Local;
            ReportSubCategory.LocalReport.ReportPath = Server.MapPath("./Reports/MaterialsData.rdlc");
            ReportSubCategory.LocalReport.DataSources.Clear();
            ReportStore.LocalReport.DisplayName = "MaterialDataBySubCategory" + DateTime.Now.ToShortDateString();
            ReportSubCategory.LocalReport.DataSources.Add(new ReportDataSource("MaterialsData", dt));
            ReportSubCategory.LocalReport.Refresh();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SelectCategory();", true);
        }
 
    }
}