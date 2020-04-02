using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class DeadStock : System.Web.UI.Page
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
            //    log.Action = "User tried to access Dead Stock Page";
            //    db.Loggers.Add(log);
            //    db.SaveChanges();
            //    Response.Redirect("Unauthorized.aspx");
            //}

        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            try
            {
                if(SelectStores.SelectedIndex == 0 || selectitem.SelectedIndex == 0 || itemunit.SelectedIndex == 0){
                    LblError.Text = "Please Select Store , Material and Unit";
                    LblError.Visible = true;
                    LblError.ForeColor = System.Drawing.Color.Red;
                }
                else {
                    AddNewDeadMaterial();
                }


            }
            catch (Exception ex)
            {
                LblError.Text = "Error In Dead Material , The Error is " + ex.InnerException.InnerException.Message;
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
            }

        }

        private void AddNewDeadMaterial()
        {
            decimal QTY;
            decimal Height;
            decimal Width;
            DeadMaterial DM = new DeadMaterial();
            DM.StoreID = Convert.ToInt32(SelectStores.SelectedValue);
            DM.MaterialID = Convert.ToInt32(selectitem.SelectedValue);
            DM.Notes = DeadNote.Value;

            //Get Quantity Value
            if (Quantity.Value == "")
                QTY = 0;
            else
                QTY = Convert.ToDecimal(Quantity.Value);
            DM.Quantity = QTY;

            //Get Height Value
            if (Sheight.Value == "")
                Height = 0;
            else
                Height = Convert.ToDecimal(Sheight.Value);
            DM.Height = Height;

            //Get Width Value
            if (SWidth.Value == "")
                Width = 0;
            else
                Width = Convert.ToDecimal(SWidth.Value);
            DM.Width = Width;

            DM.UnitID = Convert.ToInt32(itemunit.SelectedValue);
            DM.UserName = User.Identity.Name.ToString();
            DM.ActionDate = DateTime.Now;
            DM.IsActive = true;

            db.DeadMaterials.Add(DM);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.ActionDate = DateTime.Now;
            MH.UserName = User.Identity.Name;
            MH.TransactionName = "New DeadMaterial";
            MH.OldStock = 0;
            MH.NewStock = Convert.ToDecimal(Quantity.Value);
            MH.Note = "New Dead Material With Height " + Height.ToString() + " And Width " + Width.ToString();
            MH.MaterialID = Convert.ToInt32(selectitem.SelectedValue);
            MH.StoreID = Convert.ToInt32(SelectStores.SelectedValue);
            db.MaterialHistories.Add(MH);
            db.SaveChanges();



            LblError.Text = "New Dead Material is added Successfully";
            LblError.Visible = true;
            LblError.ForeColor = System.Drawing.Color.Green;

            Quantity.Value = "";
            Sheight.Value = "";
            SWidth.Value = "";
            DeadNote.Value = "";
            //selectitem.SelectedIndex = 0;
            //SelectStores.SelectedIndex = 0;
            //itemunit.SelectedIndex = 0;
        }
    }
}