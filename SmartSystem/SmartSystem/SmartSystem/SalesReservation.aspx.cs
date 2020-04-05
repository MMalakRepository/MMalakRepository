using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Security;

namespace SmartSystem
{
    public partial class SalesReservation : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole(User.Identity.Name, "SystemAdmin") &&
                Roles.IsUserInRole(User.Identity.Name, "Management") &&
                Roles.IsUserInRole(User.Identity.Name, "Sales"))

                Response.Redirect("Unauthorized.aspx");
            else
            {
                pnlMaterialData.Visible = false;
                cancelPanel.Visible = false;
                Session["UserName"] = User.Identity.Name;
            }

  
                
        }

        protected void btnGetMaterialData_Click(object sender, EventArgs e)
        {
            var materialid = Convert.ToInt32(dsMaterials.SelectedValue);
            var storeid = Convert.ToInt32(dsStores.SelectedValue);
            var Ms = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
            itemname.Value = Ms.Material.MaterialName;
            txtstock.Value = Ms.StockOnHand.ToString();
            txtReservedStock.Value = "";
            SafetyStock.Value = Ms.SafetyStock.ToString();
            materialimg.Src = Ms.Material.imagepath;
            pnlMaterialData.Visible = true;
        }

        protected void btnReserveStock_Click(object sender, EventArgs e)
        {
            var mt = Convert.ToInt32(dsMaterials.SelectedValue);
            var s = Convert.ToInt16(dsStores.SelectedValue);
            if (txtNotes.Value == "")
            {
                lblError.Text = "Please insert your Notes";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SetNoteError();", true);
                lblError.ForeColor = Color.Red;
                lblError.Visible = true;
                pnlMaterialData.Visible = true;
         
            }
            else
            {
                if (txtReservedStock.Value == "")
                {
                    lblError.Text = "Please Quantity you want to Reserve";
                    lblError.ForeColor = Color.Red;
                    lblError.Visible = true;
                    pnlMaterialData.Visible = true;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SetQuantityError();", true);
                }
                else
                {
                    var reserved = Convert.ToDecimal(txtReservedStock.Value);
                    var material = db.MaterialInStocks.Where(x => x.MaterialID == mt && x.StoreID == s).FirstOrDefault();
                    var stock = Convert.ToDecimal(material.StockOnHand);
                    if(stock < reserved)
                    {
                        lblError.ForeColor = Color.Red;
                        lblError.Text = " The Stock <  The Requested Quantity";
                        lblError.Visible = true;
                        pnlMaterialData.Visible = true;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SetQuantityError();", true);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "EnterText", "SetStockError();", true);
                    }
                    else
                    {
                        ReserveStock();
                    }
                }
            }
        }

        private void ReserveStock()
        {
            int S = Convert.ToInt32(dsStores.SelectedValue);
            int M = Convert.ToInt32(dsMaterials.SelectedValue);
            var MS = db.MaterialInStocks.Where(x => x.MaterialID == M && x.StoreID == S).FirstOrDefault();
            int MSS = MS.ID;
            decimal res = 0;
            decimal oldres = 0;
            decimal newres = 0;
            try
            {
                ReservedMaterial RM = new ReservedMaterial();
                RM.MaterialInStock = MSS;
                RM.ReservedDate = DateTime.Now;
                RM.UserName = User.Identity.Name;
                RM.Quantity = Convert.ToDecimal(txtReservedStock.Value);
                if (txtPaidAmount.Value == null || txtPaidAmount.Value == String.Empty)
                {
                    
                    res = Convert.ToDecimal(txtReservedStock.Value);

                    RM.Paid = false;
                    if (MS.ReservedStock == null)
                    {
                        MS.ReservedStock = res;
                        newres = res;
                    }
                    else
                    {
                        oldres = Convert.ToDecimal(MS.ReservedStock);
                        newres = oldres + res;
                        MS.ReservedStock = newres;
                    }


                    LogAction(MS.StockOnHand, oldres, MS.StockOnHand, newres, MS.ID);
                }
                  
                else
                {
                    RM.Paid = true;
                    RM.PaidAmount = Convert.ToDecimal(txtPaidAmount.Value);


                    DecreaseStock(MSS);
                }

                RM.IsDeleted = false;
                RM.Note = txtNotes.Value;
                db.ReservedMaterials.Add(RM);
                db.SaveChanges();

                Logger log = new Logger();
                log.ActionType = "Sales Reservation";
                log.ActionDate = DateTime.Now;
                log.UserName = User.Identity.Name;
                log.Action = "Sales Reservation of Material " + M.ToString() + " in Store " + S.ToString() + " Quantity " + txtReservedStock.Value.ToString();

                db.Loggers.Add(log);
                db.SaveChanges();

                lblError.Visible = false;
                txtReservedStock.Value = "";
                pnlMaterialData.Visible = false;
                txtPaidAmount.Value = "";
                txtNotes.Value = "";
            }
            catch (Exception ex)
            {
                lblError.Text = "Error in Stock Reservation " + ex.InnerException.InnerException.Message;
                lblError.ForeColor = Color.Red;
                lblError.Visible = true;
            }
        }

        private void DecreaseStock(int MSS)
        {
            try
            {
                decimal t = 0;
                var material = db.MaterialInStocks.Where(x => x.ID == MSS).FirstOrDefault();
                var oldstock = material.StockOnHand;
                var oldreserved = material.ReservedStock;
                var newstock = oldstock - Convert.ToDecimal(txtReservedStock.Value);
                var newreserved = oldreserved + Convert.ToDecimal(txtReservedStock.Value);
               
                if (material.ReservedStock == null)
                    material.ReservedStock = Convert.ToDecimal(txtReservedStock.Value);
                else
                    material.ReservedStock += Convert.ToDecimal(txtReservedStock.Value);


                material.StockOnHand -= Convert.ToDecimal(txtReservedStock.Value);
                db.SaveChanges();

                LogAction(oldstock, oldreserved, newstock, newreserved, material.ID);
            }
            catch(Exception ex)
            {
                lblError.Text = "Error in Stock Decrease " + ex.InnerException.InnerException.Message;
                lblError.ForeColor = Color.Red;
                lblError.Visible = true;
            }

        }

        private void LogAction(decimal? oldstock, decimal? oldreserved, decimal? newstock, decimal? newreserved,int materialinstock)
        {
            try
            {
                StockLogger st = new StockLogger();
                st.MaterialInStock = materialinstock;
                st.OldStock = oldstock;
                st.NewStock = newstock;
                st.OldReservedStock = oldreserved;
                st.NewReservedStock = newreserved;
                st.UserName = User.Identity.Name;
                st.Notes = txtNotes.Value;

                db.StockLoggers.Add(st);
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                lblError.Text = "Error in Stock Log " + ex.InnerException.InnerException.Message;
                lblError.ForeColor = Color.Red;
                lblError.Visible = true;
            }

        }
  
        protected void btnCancelData_Click(object sender, EventArgs e)
        {
            cancelPanel.Visible = true;
            GridData.DataBind();
        }

        protected void GridData_SelectedIndexChanged(object sender, EventArgs e)
        {
            // MaterialName,Quantity,ReservedDate,Note,UserName,Paid,PaidAmount,ReservedStock,StockOnHand,MaterialID,StoreID
            GridViewRow gv = GridData.SelectedRow;
            string name = gv.Cells[1].Text;
            decimal QTY = Convert.ToDecimal(gv.Cells[2].Text);
            decimal pai = 0;
            if(gv.Cells[7].Text !="&nbsp;")
                pai = Convert.ToDecimal(gv.Cells[7].Text);
            decimal reserved = Convert.ToDecimal(gv.Cells[8].Text);
            decimal stock = Convert.ToDecimal(gv.Cells[9].Text);
            int materialid = Convert.ToInt32(gv.Cells[10].Text);
            int storeid = Convert.ToInt32(gv.Cells[11].Text);

            var item = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid ).FirstOrDefault();
            if(pai != 0)
                item.StockOnHand  = stock + reserved;

            item.ReservedStock = stock - reserved;
            db.SaveChanges();

            var materilainstock = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();

            StockLogger st = new StockLogger();
            st.MaterialInStock = materilainstock.ID;
            st.OldStock = stock;
            if (pai != 0)
                st.NewStock = stock + reserved;
            else
                st.NewStock = stock;
            st.OldReservedStock = reserved;
            st.NewReservedStock = reserved - QTY;
            st.Notes = "Reservation Cancelled By " + User.Identity.Name;

            db.StockLoggers.Add(st);
            db.SaveChanges();
           

            
            var resmaterial = db.ReservedMaterials.Where(x => x.MaterialInStock == item.ID && x.PaidAmount == pai && x.Quantity == QTY).FirstOrDefault();
            resmaterial.IsDeleted = true;
            db.SaveChanges();

            Logger log = new Logger();
            log.Action ="Reservation of " + name + " in Store " + storeid.ToString() + " with Quantity "+QTY.ToString()+" is cancelled ";
            log.ActionDate = DateTime.Now;
            log.UserName = User.Identity.Name;
            log.ActionType = "Cancel Reservation";

            db.Loggers.Add(log);
            db.SaveChanges();

            GridData.DataBind();


        }
    }
}