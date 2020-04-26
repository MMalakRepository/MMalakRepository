using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class MaterialsData : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Roles.IsUserInRole(User.Identity.Name, "Management") &&
              !Roles.IsUserInRole(User.Identity.Name, "StoreManager"))
            {
                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "Authorization";
                log.UserName = User.Identity.Name;
                log.Action = "User tried to access Materials Update Data Page";
                db.Loggers.Add(log);
                db.SaveChanges();

                Response.Redirect("Unauthorized.aspx");
            }
            else
            {
                pnlMaterialData.Visible = false;
            }
         
        }

        protected void btnUpdateMaterial_Click(object sender, EventArgs e)
        {
            var materialid = Convert.ToInt32(dsMaterials.SelectedValue);
            var storeid = Convert.ToInt32(dsStores.SelectedValue);
            
            var Ms = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
            decimal OldStock = Convert.ToDecimal(Ms.StockOnHand.ToString());
            var oldsafetystock = Ms.SafetyStock.ToString();
            var oldreserved = Ms.ReservedStock.ToString();
            decimal newstock = Convert.ToDecimal(txtstock.Value);

            try
            {
                Ms.ReservedStock = Convert.ToDecimal(txtReservedStock.Value);
                Ms.StockOnHand = Convert.ToDecimal(txtstock.Value);
                Ms.SafetyStock = Convert.ToDecimal(SafetyStock.Value);
                db.SaveChanges();
                lblError.Text = "The Material Data Updated Successfully";
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Green;

                StockLogger stLog = new StockLogger();
                stLog.OldStock = OldStock;
                stLog.NewStock = Convert.ToDecimal(txtstock.Value);

                stLog.OldSafetyStock = Convert.ToDecimal(oldsafetystock);
                stLog.newSafetyStock = Convert.ToDecimal(SafetyStock.Value);

                stLog.OldReservedStock = Convert.ToDecimal(oldreserved);
                stLog.NewReservedStock = Convert.ToDecimal(txtReservedStock.Value);

                stLog.UserName = User.Identity.Name;
                stLog.ActionDate = DateTime.Now;

                stLog.MaterialInStock = Ms.ID;
                db.StockLoggers.Add(stLog);
                db.SaveChanges();

                Logger Log = new Logger();
                Log.ActionType = "Update Material";
                Log.Action = "Material " + Ms.Material.MaterialName + " Stock in Store " + Ms.Store.StoreName + " is ( "+txtstock.Value.ToString()+" ) And Safety Stock is ( " + SafetyStock.Value.ToString() + " ) ";
                Log.UserName = User.Identity.Name;
                Log.ActionDate = DateTime.Now;
                db.Loggers.Add(Log);
                db.SaveChanges();

                if (OldStock != newstock)
                {
                    MaterialHistory MH = new MaterialHistory();
                    MH.ActionDate = DateTime.Now;
                    MH.MaterialID = materialid;
                    MH.StoreID = storeid;
                    MH.TransactionName = "Update Stock";
                    MH.UserName = User.Identity.Name;
                    MH.NewStock = Convert.ToDecimal(txtstock.Value);
                    MH.OldStock = Convert.ToDecimal(OldStock);
                    MH.Note = "Material " + Ms.Material.MaterialName + " Stock is now updated in Store " + storeid.ToString();
                    db.MaterialHistories.Add(MH);
                    db.SaveChanges();
                }
              
            }
            catch (Exception ex)
            {
                lblError.Text = "Error in Update Material Data " + ex.Message;
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
           
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            itemname.Value = "";
            txtstock.Value = "";
            txtReservedStock.Value = "";
            SafetyStock.Value = "";
            STORES.DataBind();
            dsMaterials.DataBind();
        }

        protected void btnGetMaterialData_Click(object sender, EventArgs e)
        {
            var materialid = Convert.ToInt32(dsMaterials.SelectedValue);
            var storeid = Convert.ToInt32(dsStores.SelectedValue);

            var Ms = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();

            itemname.Value =  Ms.Material.MaterialName;
            txtstock.Value = Ms.StockOnHand.ToString();
            txtReservedStock.Value = Ms.ReservedStock.ToString();
            SafetyStock.Value = Ms.SafetyStock.ToString();
            materialimg.Src = Ms.Material.imagepath;

            pnlMaterialData.Visible = true;
        }
    }
}