using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class DefectiveMaterialData : System.Web.UI.Page
    {
        Entities db = new Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!User.IsInRole("StockManager"))
            //{

            //    Logger log = new Logger();
            //    log.ActionDate = DateTime.Now;
            //    log.ActionType = "Authorization";
            //    log.UserName = User.Identity.Name;
            //    log.Action = "User tried to access Internal Orders Page";

            //    db.Loggers.Add(log);
            //    db.SaveChanges();
            //    Response.Redirect("Unauthorized.aspx");
            //}


        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            try
            {
                if(itemunit.SelectedIndex == 0)
                {
                    LblError.Text = "Please Select Measure Unit";
                    LblError.Visible = true;
                    LblError.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    AddNewCuttingList();
                }
                
            }
            catch (Exception ex)
            {
                LblError.Text = "Error In CuttingList Material , The Error is " + ex.InnerException.InnerException.Message;
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
            }

        }

        private void AddNewCuttingList()
        {
            decimal QTY;
            decimal Height;
            decimal Width;
            CuttingListsMaterial DM = new CuttingListsMaterial();
            DM.StoreID = Convert.ToInt32(SelectStores.SelectedValue);
            DM.MaterialID = Convert.ToInt32(selectitem.SelectedValue);
            DM.Notes = DefectiveNote.Value;

            //Get Quantity Value
            if (Quantity.Value == null || Quantity.Value == string.Empty)
                QTY = 0;
            else
                QTY = Convert.ToDecimal(Quantity.Value);
            DM.Quantity = QTY;

            //Get Height Value
            if (Sheight.Value == null || Sheight.Value == String.Empty)
                Height = 0;
            else
                Height = Convert.ToDecimal(Sheight.Value);
            DM.Height = Height;

            //Get Width Value
            if (SWidth.Value == null || SWidth.Value == String.Empty)
                Width = 0;
            else
                Width = Convert.ToDecimal(SWidth.Value);
            DM.Width = Width;

            DM.IsActive = true;
            DM.UnitID = Convert.ToInt32(itemunit.SelectedValue);
            DM.UserName = User.Identity.Name.ToString();
            DM.ActionDate = DateTime.Now;
            DM.ReservedQTY = 0;

            db.CuttingListsMaterials.Add(DM);
            db.SaveChanges();

            LblError.Text = "New Cutting List Material is added Successfully";
            LblError.Visible = true;
            LblError.ForeColor = System.Drawing.Color.Green;

            MaterialHistory MH = new MaterialHistory();
            MH.ActionDate = DateTime.Now;
            MH.UserName = User.Identity.Name;
            MH.TransactionName = "New CuttingList";
            MH.OldStock = 0;
            //Get Height Value
            if (Sheight.Value == null || Sheight.Value == String.Empty)
                Height = 0;
            else
                Height = Convert.ToDecimal(Sheight.Value);
            DM.Height = Height;

            //Get Width Value
            if (SWidth.Value == null || SWidth.Value == String.Empty)
                Width = 0;
            else
                Width = Convert.ToDecimal(SWidth.Value);
            DM.Width = Width;
            MH.Note = "New Cutting List With Height " + Height.ToString() + " And Width " + Width.ToString();
            MH.NewStock =Convert.ToDecimal(Quantity.Value);
            MH.MaterialID = Convert.ToInt32(selectitem.SelectedValue);
            MH.StoreID = Convert.ToInt32(SelectStores.SelectedValue);
            db.MaterialHistories.Add(MH);
            db.SaveChanges();



            Quantity.Value = "";
            Sheight.Value = "";
            SWidth.Value = "";
            DefectiveNote.Value = "";
            //STORES.DataBind();
            //SelectStores.SelectedIndex = 0;
            //selectitem.SelectedIndex = 0;
        }
    }
}