﻿using System;
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
            if (!Roles.IsUserInRole(User.Identity.Name, "SystemAdmin") &&
                !Roles.IsUserInRole(User.Identity.Name, "Management") &&
                !Roles.IsUserInRole(User.Identity.Name, "Sales"))
            {
                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "Authorization";
                log.UserName = User.Identity.Name;
                log.Action = "User tried to access Sales Reservation Data Page";
                db.Loggers.Add(log);
                db.SaveChanges();

                Response.Redirect("Unauthorized.aspx");
            }

            else
            {
                pnlMaterialData.Visible = false;
                cancelCuttingPanel.Visible = false;
                cancelMaterialPanel.Visible = false;
                Session["UserName"] = User.Identity.Name;
            }                
        }

        //protected void btnGetMaterialData_Click(object sender, EventArgs e)
        //{
        //    //var materialid = Convert.ToInt32(dsMaterials.SelectedValue);
        //    //var storeid = Convert.ToInt32(dsStores.SelectedValue);
        //    //var Ms = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
        //    //itemname.Value = Ms.Material.MaterialName;
        //    //txtstock.Value = Ms.StockOnHand.ToString();
        //    //txtReservedStock.Value = "";
        //    //SafetyStock.Value = Ms.SafetyStock.ToString();
        //    //materialimg.Src = Ms.Material.imagepath;
        //    //pnlMaterialData.Visible = true;

        //    pnlAvailableMaterial.Visible = true;
        //    GridMaterial.DataBind();
        //}

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
                  decimal stock = Convert.ToDecimal(txtstock.Value.ToString());
                  decimal reserved = Convert.ToDecimal(txtReservedStock.Value);
                  var material = db.MaterialInStocks.Where(x => x.MaterialID == mt && x.StoreID == s).FirstOrDefault();
             
                   
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
                        if(itemtype.Value.ToLower() == "material")
                        {
                            ReserveStock();
                        }
                        else if (itemtype.Value.ToLower() == "cuttinglist")
                        {
                            ReserveCuttingList();
                        }

                        pnlMaterialData.Visible = false;
                        GridMaterial.DataBind();
                    }
                }
            }
        }

        private void ReserveCuttingList()
        {
            int S = Convert.ToInt32(dsStores.SelectedValue);
            int M = Convert.ToInt32(dsMaterials.SelectedValue);
            var Height = Convert.ToDecimal(txtItemHeight.Value.ToString());
            var Notes = txtItemNote.Value.ToString();
            var Stock = Convert.ToDecimal(txtstock.Value.ToString());
            var Width = Convert.ToDecimal(txtItemWidth.Value.ToString());
            var MS = db.CuttingListsMaterials.Where(x => x.StoreID == S && x.MaterialID == M && x.Notes == Notes && x.Height == Height && x.Width == Width && x.Quantity == Stock).FirstOrDefault();
            decimal res = 0;
            decimal oldres = 0;
            decimal newres = 0;
            try
            {
                ReservedCuttingMaterial RM = new ReservedCuttingMaterial();
                RM.CuttingMaterialID = MS.ID;
                RM.ReservedDate = DateTime.Now;
                RM.UserName = User.Identity.Name;
                RM.Quantity = Convert.ToDecimal(txtReservedStock.Value);
                if (txtPaidAmount.Value == null || txtPaidAmount.Value == String.Empty)
                {
                    res = Convert.ToDecimal(txtReservedStock.Value);
                    RM.Paid = false;
                    RM.PaidAmount = 0;
                    if (MS.ReservedQTY == null)
                    {
                        MS.ReservedQTY = res;
                        newres = res;
                    }
                    else
                    {
                        oldres = Convert.ToDecimal(MS.ReservedQTY);
                        newres = oldres + res;
                        MS.ReservedQTY = newres;
                        

                    }
                    //LogAction(MS.Quantity, oldres, MS.Quantity, newres, MS.ID);
                }

                else
                {
                    RM.Paid = true;
                    RM.PaidAmount = Convert.ToDecimal(txtPaidAmount.Value.ToString());
                    MS.Quantity -= Convert.ToDecimal(txtReservedStock.Value.ToString());
                }

                RM.IsDeleted = false;
                RM.Note = txtNotes.Value;
                db.ReservedCuttingMaterials.Add(RM);
                db.SaveChanges();

                Logger log = new Logger();
                log.ActionType = "Sales Reservation";
                log.ActionDate = DateTime.Now;
                log.UserName = User.Identity.Name;
                log.Action = "Sales Reservation of Cutting List Material ( " + MS.Material.MaterialName.ToString() + " ) in Store ( " + MS.Store.StoreName.ToString() + " ) Quantity " + txtReservedStock.Value.ToString();

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
                    RM.PaidAmount = 0;
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
                log.Action = "Sales Reservation of Material ( " + MS.Material.MaterialName.ToString() + " ) in Store ( " + MS.Store.StoreName.ToString() + " ) Quantity " + txtReservedStock.Value.ToString();

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
                {
                    material.ReservedStock = Convert.ToDecimal(txtReservedStock.Value);
                }

                else
                {
                    material.ReservedStock += Convert.ToDecimal(txtReservedStock.Value);
                }
                   
                material.StockOnHand -= Convert.ToDecimal(txtReservedStock.Value);
                db.SaveChanges();

                LogAction(oldstock, oldreserved, newstock, newreserved, material.ID);
                LogSalesReservation(oldstock, newstock, material.ID,true);
            }
            catch(Exception ex)
            {
                lblError.Text = "Error in Stock Decrease " + ex.InnerException.InnerException.Message;
                lblError.ForeColor = Color.Red;
                lblError.Visible = true;
            }

        }

        private void LogSalesReservation(decimal? oldstock, decimal? newstock, int iD,bool reserve)
        {
            try
            {
                var material = db.MaterialInStocks.Where(x => x.ID == iD).FirstOrDefault();
                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = material.MaterialID;
                MH.StoreID = material.StoreID;
                MH.OldStock = oldstock;
                MH.NewStock = newstock;
                if(reserve)
                {
                    MH.Note = " Sales Reservation Of Material ( " + material.Material.MaterialName.ToString() +" ) in Store ( "+material.Store.StoreName.ToString()+" ) By " + User.Identity.Name.ToString();
                    MH.TransactionName = "Sales Reservation";
                }
                else
                {
                    MH.Note = " Sales Reservation of Material ( " + material.Material.MaterialName.ToString() + " ) in Store ( " + material.Store.StoreName.ToString() +" ) Cancelled By " + User.Identity.Name.ToString();
                    MH.TransactionName = "Cancel Reservation";
                }

                MH.UserName = User.Identity.Name.ToString();
               
                db.MaterialHistories.Add(MH);
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                lblError.Text = "Error in Log History of Reservation , Error is " + ex.InnerException.Message;
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
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
                catch (Exception ex)
                {
                    lblError.Text = "Error in Stock Log " + ex.InnerException.InnerException.Message;
                    lblError.ForeColor = Color.Red;
                    lblError.Visible = true;
                }
        }
  
        protected void btnCancelData_Click(object sender, EventArgs e)
        {
            if(canceltype.SelectedIndex == 0)
            {
                cancelMaterialPanel.Visible = true;
                cancelCuttingPanel.Visible = false;
                GridData.DataBind();
            }
            else if(canceltype.SelectedIndex == 1)
            {
                cancelCuttingPanel.Visible = true;
                cancelMaterialPanel.Visible = false;
                GridCuttingReservation.DataBind();
            }
         
        }

        //protected void GridData_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    // Reservation ID, MaterialName,Quantity
        //    //ReservedDate,Note,UserName,
        //    //Paid,PaidAmount,ReservedStock,
        //    //StockOnHand,MaterialID,StoreID
        //    GridViewRow gv = GridData.SelectedRow;
        //    int ReservedID = Convert.ToInt32(gv.Cells[1].Text.ToString());
        //    var resmaterial = db.ReservedMaterials.Where(x => x.ID == ReservedID).FirstOrDefault();
        //    //string name = gv.Cells[2].Text;
        //    string name = resmaterial.MaterialInStock1.Material.MaterialName;

        //    //decimal QTY = Convert.ToDecimal(gv.Cells[3].Text);
        //    decimal QTY = Convert.ToDecimal(resmaterial.Quantity);
        //    string ReservationNote = resmaterial.Note;
        //    //string ReservationNote = gv.Cells[5].Text.ToString();
        //    decimal pai = Convert.ToDecimal(resmaterial.PaidAmount);

        //    //decimal pai = 0;
        //    if(gv.Cells[7].Text !="&nbsp;")
        //    {
        //        pai = Convert.ToDecimal(gv.Cells[8].Text);
        //    }

                
        //    //decimal reserved = Convert.ToDecimal(gv.Cells[9].Text);
        //    decimal reserved = Convert.ToDecimal(resmaterial.MaterialInStock1.ReservedStock);
        //    //decimal stock = Convert.ToDecimal(gv.Cells[10].Text);
        //    decimal stock = Convert.ToDecimal(resmaterial.MaterialInStock1.StockOnHand);
        //    //int materialid = Convert.ToInt32(gv.Cells[11].Text);
        //    int materialid = Convert.ToInt32(resmaterial.MaterialInStock1.MaterialID);
        //    //int storeid = Convert.ToInt32(gv.Cells[12].Text);
        //    int storeid = Convert.ToInt32(resmaterial.MaterialInStock1.StoreID);

        //    var item = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid ).FirstOrDefault();
        //    if (pai != 0)
        //    {
        //        decimal oldstock =  Convert.ToDecimal(item.StockOnHand);
        //        decimal newstock = oldstock + QTY;
        //        item.StockOnHand = newstock;
        //        LogSalesReservation(oldstock, newstock, item.ID, false);
        //    }

        //    item.ReservedStock = reserved - QTY;
        //    db.SaveChanges();

        //    //var materilainstock = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();

        //    StockLogger st = new StockLogger();
        //    st.MaterialInStock = item.ID;
        //    st.OldStock = stock;
        //    if (pai != 0 )
        //        st.NewStock = stock + reserved;
        //    else
        //        st.NewStock = stock;
        //    st.OldReservedStock = reserved;
        //    st.NewReservedStock = reserved - QTY;
        //    st.Notes = "Reservation Cancelled By " + User.Identity.Name;

        //    db.StockLoggers.Add(st);
        //    db.SaveChanges();

        //    //var resmaterial = db.ReservedMaterials.Where(x => x.MaterialInStock == item.ID && x.PaidAmount == pai && x.Quantity == QTY && x.Note == ReservationNote ).FirstOrDefault();
            
        //    resmaterial.IsDeleted = true;
        //    db.SaveChanges();

        //    Logger log = new Logger();
        //    log.Action ="Reservation of " + name + " in Store " + storeid.ToString() + " with Quantity "+ QTY.ToString()+" is cancelled ";
        //    log.ActionDate = DateTime.Now;
        //    log.UserName = User.Identity.Name;
        //    log.ActionType = "Cancel Reservation";
        //    db.Loggers.Add(log);
        //    db.SaveChanges();

        //    GridData.DataBind();
        //}

        protected void GridData_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridData.SelectedRow;
            int ReservedID = Convert.ToInt32(gv.Cells[1].Text.ToString());
            var ReservedMaterial = db.ReservedMaterials.Where(x => x.ID == ReservedID).FirstOrDefault();
            string name = ReservedMaterial.MaterialInStock1.Material.MaterialName;
            decimal QTY = Convert.ToDecimal(ReservedMaterial.Quantity);
            string ReservationNote = ReservedMaterial.Note;
            decimal PaidAmount = Convert.ToDecimal(ReservedMaterial.PaidAmount);
            decimal TotalReserved = Convert.ToDecimal(ReservedMaterial.MaterialInStock1.ReservedStock);
            decimal stock = Convert.ToDecimal(ReservedMaterial.MaterialInStock1.StockOnHand);
            int materialid = Convert.ToInt32(ReservedMaterial.MaterialInStock1.MaterialID);
            int storeid = Convert.ToInt32(ReservedMaterial.MaterialInStock1.StoreID);

            var item = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
            if (PaidAmount != 0)
            {
                decimal oldstock = Convert.ToDecimal(item.StockOnHand);
                decimal newstock = oldstock + QTY;
                item.StockOnHand = newstock;
                LogSalesReservation(oldstock, newstock, item.ID, false);
            }

            item.ReservedStock = TotalReserved - QTY;
            db.SaveChanges();

            StockLogger st = new StockLogger();
            st.MaterialInStock = item.ID;
            st.OldStock = stock;
            if (PaidAmount != 0)
                st.NewStock = stock + QTY;
            else
                st.NewStock = stock;
            st.OldReservedStock = TotalReserved;
            st.NewReservedStock = TotalReserved - QTY;
            st.Notes = "Cancel Reservation of Material ( " + item.Material.MaterialName.ToString() +" ) In Store ( " + item.Store.StoreName.ToString() + " ) Cancelled By " + User.Identity.Name;

            db.StockLoggers.Add(st);
            db.SaveChanges();
 
            ReservedMaterial.IsDeleted = true;
            db.SaveChanges();

            Logger log = new Logger();
            log.Action = "Cancel Reservation of Material ( " + item.Material.MaterialName.ToString() + " ) in Store ( " + item.Store.StoreName.ToString() + " ) with Quantity " + QTY.ToString() + " is cancelled ";
            log.ActionDate = DateTime.Now;
            log.UserName = User.Identity.Name;
            log.ActionType = "Cancel Reservation";
            db.Loggers.Add(log);
            db.SaveChanges();

            GridData.DataBind();
        }

        protected void dsMaterials_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlAvailableMaterial.Visible = true;
            GridMaterial.DataBind();
        }

        protected void GridMaterial_SelectedIndexChanged(object sender, EventArgs e)
        {
            //MaterialName,stock,width,height,Notes,type
            GridViewRow gv = GridMaterial.SelectedRow;

            var Width = gv.Cells[3].Text.ToString();
            var Height = gv.Cells[4].Text.ToString();
            if(Width != null || Width != String.Empty)
                txtItemWidth.Value = gv.Cells[3].Text.ToString();
            else
                txtItemWidth.Value = "0";

            if(Height != null || Height != String.Empty)
                txtItemHeight.Value = gv.Cells[4].Text.ToString();
            else
                txtItemHeight.Value = "0";

            decimal stock = Convert.ToDecimal(gv.Cells[2].Text.ToString());
            string Notes = gv.Cells[5].Text.ToString();
            txtItemNote.Value = Notes;
            string MaterialName = gv.Cells[1].Text.ToString();
            var materialid = Convert.ToInt32(dsMaterials.SelectedValue);
            var storeid = Convert.ToInt32(dsStores.SelectedValue);
            string MaterialType = gv.Cells[6].Text.ToString();
            var Ms = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
            itemname.Value = Ms.Material.MaterialName;
            itemtype.Value = MaterialType.ToString();
            txtReservedStock.Value = "";
            SafetyStock.Value = Ms.SafetyStock.ToString();
            materialimg.Src = Ms.Material.imagepath;

            if (MaterialType == "Material")
            {
                txtstock.Value = Ms.StockOnHand.ToString();
            }
            else if(MaterialType == "CuttingList")
            {
                txtstock.Value = stock.ToString();
            }
            pnlMaterialData.Visible = true;

        }

        protected void GridCuttingReservation_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridCuttingReservation.SelectedRow;
            int ReservedID = Convert.ToInt32(gv.Cells[1].Text.ToString());
            var ReservedMaterial = db.ReservedCuttingMaterials.Where(x => x.ID == ReservedID).FirstOrDefault();
            decimal QTY = Convert.ToDecimal(ReservedMaterial.Quantity);
            string ReservationNote = ReservedMaterial.Note;
            decimal PaidAmount = Convert.ToDecimal(ReservedMaterial.PaidAmount);
            int cuttingListID = Convert.ToInt32(ReservedMaterial.CuttingMaterialID);
            ReservedMaterial.IsDeleted = true;
            var CMaterial = db.CuttingListsMaterials.Where(x => x.ID == cuttingListID).FirstOrDefault();
            CMaterial.ReservedQTY -= QTY;
            CMaterial.IsActive = true; 
            if(PaidAmount != 0)
            {
                CMaterial.Quantity += QTY;
            }

            Logger log = new Logger();
            log.Action = "Cancel Reservation of CuttingList Material ( " + CMaterial.Material.MaterialName.ToString() + " ) in Store ( " + CMaterial.Store.StoreName.ToString() + " ) with Quantity " + QTY.ToString() + " is cancelled ";
            log.ActionDate = DateTime.Now;
            log.UserName = User.Identity.Name;
            log.ActionType = "Cancel Reservation";
            db.Loggers.Add(log);
            db.SaveChanges();

           GridCuttingReservation.DataBind();
           GridCuttingReservation.Visible = true;
           GridMaterial.DataBind();
           GridMaterial.Visible = true;
        }
    }
}