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
    public partial class Transfers : System.Web.UI.Page
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
                log.Action = "User tried to access Transfers Data Page";
                db.Loggers.Add(log);
                db.SaveChanges();

                Response.Redirect("Unauthorized.aspx");
            }


            if (!IsPostBack)
            {
                dvDetails.Visible = false;
                Itemdetails.Visible = false;
                btnFinishTransfer.Visible = false;
            }
        }

        protected void btnAddNewTransfer_Click(object sender, EventArgs e)
        {
            try
            {
                if (FromStore.SelectedIndex == 0 || ToStore.SelectedIndex == 0)
                {
                    lblTransferErr.Text = "Please Select Required Stores ";
                    lblTransferErr.Visible = true;
                    lblTransferErr.ForeColor = Color.Red;

                }
                else if (FromStore.SelectedIndex == ToStore.SelectedIndex)
                {
                    lblTransferErr.Text = " You can't transfer to the same Store ";
                    lblTransferErr.Visible = true;
                    lblTransferErr.ForeColor = Color.Red;
                }
                else
                {
                    Itemdetails.Visible = false;
                    dvDetails.Visible = true;
                    lblTransferErr.Text = "";
                    txtOrderNotes.Disabled = true;
                    FromStore.Enabled = false;
                    ToStore.Enabled = false;
                    btnFinishTransfer.Visible = true;
                    btnAddNewTransfer.Enabled = false;

                    Transfer neworder = new Transfer();
                    neworder.FromStore = Convert.ToInt32(FromStore.SelectedValue);
                    neworder.ToStore = Convert.ToInt32(ToStore.SelectedValue);
                    neworder.IsActive = true;
                    neworder.TransferDate = DateTime.Now;
                    neworder.UserName = User.Identity.Name;
                    neworder.Note = txtOrderNotes.Value.ToString();

                    db.Transfers.Add(neworder);
                    db.SaveChanges();

                    var lastorder = db.Transfers.Max(x => x.ID);
                    string t = lastorder.ToString();
                    LblTransferID.Text = lastorder.ToString();

                    Logger log = new Logger();
                    log.Action = "New Transfer " + t.ToString() + " is now created ";
                    log.ActionDate = DateTime.Now;
                    log.ActionType = "Transfers";
                    log.UserName = User.Identity.Name;

                    db.Loggers.Add(log);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                lblTransferErr.Text = "Error in Orders " + ex.InnerException.InnerException.Message;
                lblTransferErr.Visible = true;
                lblTransferErr.ForeColor = Color.Red;

                Logger log = new Logger();
                log.Action = "Error in Transfer Creation " + ex.InnerException.InnerException.Message;
                log.ActionDate = DateTime.Now;
                log.ActionType = "Transfers";
                log.UserName = User.Identity.Name;

                db.Loggers.Add(log);
                db.SaveChanges();
            }

        }

        protected void btnCheckItemStock_Click(object sender, EventArgs e)
        {
            int store = Convert.ToInt32(ToStore.SelectedValue);
            int material = Convert.ToInt32(selectitem.SelectedValue);

            var item = db.MaterialInStocks.Where(x => x.MaterialID == material && x.StoreID == store).FirstOrDefault();
            if (item == null)
            {
                LblErrCheckItem.Text = " This Material ( " + selectitem.SelectedItem.ToString() + " ) isn't created in the store ( " + ToStore.SelectedItem.ToString() + " )";
                LblErrCheckItem.Visible = true;
                LblErrCheckItem.ForeColor = Color.Red;
                GridData.Visible = false;
            }
            else
            {
                Itemdetails.Visible = false;
                GridData.DataBind();
            }


        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            try
            {
                var availableQTY = Convert.ToDecimal(txtCurrentStock.Value);

                var requestedQTY = Convert.ToDecimal(txtRequestedStock.Value.ToString());

                if (availableQTY == 0)
                {
                    LblAddNewItem.Text = " There is no available stock for this item";
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = Color.Red;
                }
                else if (String.IsNullOrEmpty(txtRequestedStock.Value.ToString()))
                {
                    LblAddNewItem.Text = "Please insert the Requested Quantity";
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = Color.Red;
                }
                else if (requestedQTY > availableQTY)
                {
                    LblAddNewItem.Text = "The Requested Quantity > Available Stock";
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = Color.Red;
                }
                else
                {
                    selectitem.Enabled = false;
                    string type = txtItemType.Value.ToString();

                    if (type == "CuttingList")
                        CuttingItemStock();
                    else if (type == "Material")
                        MaterialStock();
                    else if (type == "DeadMaterial")
                        DeadMaterialStock();

                    TransferDetail d = new TransferDetail();
                    d.IsActive = true;
                    d.MaterialID = Convert.ToInt16(selectitem.SelectedValue);
                    d.TransferID = Convert.ToInt16(LblTransferID.Text.ToString());
                    d.Quantity = Convert.ToDecimal(txtRequestedStock.Value.ToString());

                    if (String.IsNullOrWhiteSpace(txtitemHieght.Value.ToString()) || txtitemHieght.Value.ToString() == "&nbsp;")
                        d.Height = 0;
                    else
                        d.Height = Convert.ToDecimal(txtitemHieght.Value.ToString());

                    if (String.IsNullOrWhiteSpace(txtItemWidth.Value.ToString()) || txtItemWidth.Value.ToString() == "&nbsp;")
                        d.Width = 0;
                    else
                        d.Width = Convert.ToDecimal(txtItemWidth.Value.ToString());

                    d.MaterialType = txtItemType.Value.ToString();

                    db.TransferDetails.Add(d);
                    db.SaveChanges();

                    ClearData();
                    selectitem.Enabled = true;

                }

            }
            catch (Exception ex)
            {
                lblTransferErr.Text = "Error in Order Items " + ex.InnerException.InnerException.Message;
                lblTransferErr.Visible = true;
                lblTransferErr.ForeColor = Color.Red;

                Logger log = new Logger();
                log.Action = "Error in Transfer items Addition " + ex.InnerException.InnerException.Message;
                log.ActionDate = DateTime.Now;
                log.ActionType = "Transfer Details";
                log.UserName = User.Identity.Name;

                db.Loggers.Add(log);
                db.SaveChanges();
            }
        }

        protected void GridData_SelectedIndexChanged(object sender, EventArgs e)
        {
            Itemdetails.Visible = true;
            GridViewRow gv = GridData.SelectedRow;
            txtCurrentStock.Value = gv.Cells[3].Text;
            txtStore.Value = gv.Cells[2].Text;
            txtItemNotes.Value = gv.Cells[6].Text;
            txtitemHieght.Value = gv.Cells[4].Text;
            txtItemWidth.Value = gv.Cells[5].Text;
            txtItemType.Value = gv.Cells[7].Text;
            txtMaterialID.Value = gv.Cells[1].Text;
        }

        private void ClearData()
        {

            txtitemHieght.Value = "";
            txtItemNotes.Value = "";
            txtItemType.Value = "";
            txtItemWidth.Value = "";
            txtNote.Value = "";
            txtRequestedStock.Value = "";
            txtCurrentStock.Value = "";
            txtStore.Value = "";
            Itemdetails.Visible = false;
            GridData.DataBind();
        }

        private void DeadMaterialStock()
        {
            var MaterialID = Convert.ToInt32(txtMaterialID.Value);
            var MaterialStore = Convert.ToInt32(txtStore.Value);
            var Materialheight = Convert.ToDecimal(txtitemHieght.Value);
            var MaterialWidth = Convert.ToDecimal(txtItemWidth.Value);
            var MaterialNotes = txtItemNotes.Value.ToString();
            var MaterialStock = Convert.ToDecimal(txtCurrentStock.Value);
            var newstock = MaterialStock - Convert.ToDecimal(txtRequestedStock.Value);

            var item = db.DeadMaterials.Where(x => x.MaterialID == MaterialID && x.StoreID == MaterialStore && x.Height == Materialheight && x.Width == MaterialWidth && x.Notes == MaterialNotes.ToString()).FirstOrDefault();
            if (item != null)
            {
                item.Quantity -= Convert.ToDecimal(txtRequestedStock.Value);
                db.SaveChanges();

            }

            DeadMaterial CS = new DeadMaterial();
            CS.StoreID = Convert.ToInt32(ToStore.SelectedValue);
            CS.MaterialID = MaterialID;
            CS.Height = Materialheight;
            CS.Width = MaterialWidth;
            CS.Quantity = Convert.ToDecimal(txtRequestedStock.Value);
            CS.UserName = User.Identity.Name;
            CS.ActionDate = DateTime.Now;
            CS.Notes = "Transferred From Store " + MaterialStore.ToString() + " At " + DateTime.Now.ToString() + " Transfer Number " + LblTransferID.Text;
            CS.IsActive = true;

            db.DeadMaterials.Add(CS);
            db.SaveChanges();


            Logger log = new Logger();
            log.Action = "Transfer Number ( " + LblTransferID.Text + " ) of Dead Material (" + item.Material.MaterialName.ToString() + " ) , The Stock changed from "
                + MaterialStock.ToString() + " to " + newstock.ToString() + " From Store " + FromStore.SelectedItem.ToString() + " To Store " + ToStore.SelectedItem.ToString() ;
            log.ActionDate = DateTime.Now;
            log.ActionType = "DeadMaterial Transfer";
            log.UserName = User.Identity.Name;


            db.Loggers.Add(log);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.ActionDate = DateTime.Now;
            MH.MaterialID = MaterialID;
            MH.StoreID = Convert.ToInt32(ToStore.SelectedValue);
            MH.TransactionName = "DeadMaterial Transfer";
            MH.UserName = User.Identity.Name;
            MH.NewStock = Convert.ToDecimal(txtRequestedStock.Value);
            MH.OldStock = 0;
            MH.Note = "DeadMaterial Transfer No " + LblTransferID.Text.ToString() + " With Height " + Materialheight.ToString() + " and Width " + MaterialWidth.ToString() + " From Store " + FromStore.SelectedItem.ToString() + " To Store " + ToStore.SelectedItem.ToString();
            db.MaterialHistories.Add(MH);
            db.SaveChanges();


            MaterialHistory MH2 = new MaterialHistory();
            MH2.ActionDate = DateTime.Now;
            MH2.MaterialID = MaterialID;
            MH2.StoreID = MaterialStore;
            MH2.TransactionName = "DeadMaterial Transfer";
            MH2.UserName = User.Identity.Name;
            MH2.NewStock = newstock;
            MH2.OldStock = MaterialStock;
            MH2.Note = "DeadMaterial Transfer No " + LblTransferID.Text.ToString() + " With Height " + Materialheight.ToString() + " and Width " + MaterialWidth.ToString() + " From Store " + FromStore.SelectedItem.ToString() + " To Store " + ToStore.SelectedItem.ToString();
            db.MaterialHistories.Add(MH2);
            db.SaveChanges();
        }

        private void MaterialStock()
        {
            var MaterialID = Convert.ToInt32(txtMaterialID.Value);
            var StoreFrom = Convert.ToInt32(FromStore.SelectedValue);
            var MaterialStock = Convert.ToDecimal(txtCurrentStock.Value);
            var store2 = Convert.ToInt32(ToStore.SelectedValue);
            //Update Current Stock Of From Store 
            var item = db.MaterialInStocks.Where(x => x.MaterialID == MaterialID && x.StoreID == StoreFrom).FirstOrDefault();
            var stock1 = item.StockOnHand;
            var newstock1 = item.StockOnHand - Convert.ToDecimal(txtRequestedStock.Value);
            item.StockOnHand -= Convert.ToDecimal(txtRequestedStock.Value);
            db.SaveChanges();

            StockLogger stlog = new StockLogger();
            stlog.MaterialInStock = item.ID;
            stlog.OldStock = stock1;
            stlog.NewStock = newstock1;
            stlog.UserName = User.Identity.Name;
            stlog.ActionDate = DateTime.Now;
            stlog.Notes = "Transfer Number " + LblTransferID.Text.ToString() + " From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            db.StockLoggers.Add(stlog);

            Logger log2 = new Logger();
            log2.Action = "Transfer Number ( " + LblTransferID.Text + " ) of  Material (" + item.Material.MaterialName.ToString() + " ) , The Stock changed from ( "
                + stock1.ToString() + " ) to ( " + newstock1.ToString() + " ) From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            log2.ActionDate = DateTime.Now;
            log2.ActionType = "Material Transfer";
            log2.UserName = User.Identity.Name;

            db.Loggers.Add(log2);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.MaterialID = MaterialID;
            MH.StoreID = Convert.ToInt32(FromStore.SelectedValue);
            MH.OldStock = stock1;
            MH.NewStock = newstock1;
            MH.ActionDate = DateTime.Now;
            MH.UserName = User.Identity.Name;
            MH.Note = " Material Transfer No ( " + LblTransferID.Text.ToString() + " ) From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            MH.TransactionName = "Material Transfer";
            db.MaterialHistories.Add(MH);
            db.SaveChanges();

            //To Store Actions

            var itemstore2 = db.MaterialInStocks.Where(x => x.MaterialID == MaterialID && x.StoreID == store2).FirstOrDefault();
            var storestock = itemstore2.StockOnHand;
            var storestock2 = storestock + Convert.ToDecimal(txtRequestedStock.Value);
            itemstore2.StockOnHand = storestock2;
            db.SaveChanges();

            //stockLogger
            StockLogger stlog2 = new StockLogger();
            stlog2.MaterialInStock = itemstore2.ID;
            stlog2.OldStock = storestock;
            stlog2.NewStock = storestock2;
            stlog2.UserName = User.Identity.Name;
            stlog2.ActionDate = DateTime.Now;
            stlog2.Notes = "Transfer Number " + LblTransferID.Text.ToString() + " From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            db.StockLoggers.Add(stlog2);
            db.SaveChanges();


            //Insert Logger
            Logger log = new Logger();
            log.Action = "Transfer Number ( " + LblTransferID.Text + " ) of  Material (" + item.Material.MaterialName.ToString() + " ) , The Stock changed from "
                + storestock.ToString() + " to " + storestock2.ToString() + " From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            log.ActionDate = DateTime.Now;
            log.ActionType = "Material Transfer";
            log.UserName = User.Identity.Name;

            db.Loggers.Add(log);
            db.SaveChanges();


            MaterialHistory MH2 = new MaterialHistory();
            MH2.MaterialID = MaterialID;
            MH2.StoreID = Convert.ToInt32(ToStore.SelectedValue);
            MH2.OldStock = storestock;
            MH2.NewStock = storestock2;
            MH2.ActionDate = DateTime.Now;
            MH2.UserName = User.Identity.Name;
            MH2.Note = " Material Transfer No ( " + LblTransferID.Text.ToString() + " ) From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            MH2.TransactionName = "Material Transfer";
            db.MaterialHistories.Add(MH2);
            db.SaveChanges();


        }

        private void CuttingItemStock()
        {
            var MaterialID = Convert.ToInt32(txtMaterialID.Value);
            var MaterialStore = Convert.ToInt32(FromStore.SelectedValue);
            var Materialheight = Convert.ToDecimal(txtitemHieght.Value);
            var MaterialWidth = Convert.ToDecimal(txtItemWidth.Value);
            var MaterialNotes = txtItemNotes.Value.ToString();
            var MaterialStock = Convert.ToDecimal(txtCurrentStock.Value);
            var storeto = Convert.ToInt32(ToStore.SelectedValue);

            var newstock = MaterialStock - Convert.ToDecimal(txtRequestedStock.Value);

            var fromitem = db.CuttingListsMaterials.Where(x => x.MaterialID == MaterialID && x.StoreID == MaterialStore && x.Height == Materialheight && x.Width == MaterialWidth && x.Notes == MaterialNotes.ToString()).FirstOrDefault();
            var toitem = db.CuttingListsMaterials.Where(x => x.MaterialID == MaterialID && x.StoreID == storeto && x.Height == Materialheight && x.Width == MaterialWidth && x.Notes == MaterialNotes.ToString()).FirstOrDefault();
            if (fromitem != null)
            {
                fromitem.Quantity -= Convert.ToDecimal(txtRequestedStock.Value);
                db.SaveChanges();
            }

            CuttingListsMaterial CS = new CuttingListsMaterial();
            CS.StoreID = Convert.ToInt32(ToStore.SelectedValue);
            CS.MaterialID = MaterialID;
            CS.Height = Materialheight;
            CS.Width = MaterialWidth;
            CS.Quantity = Convert.ToDecimal(txtRequestedStock.Value);
            CS.UserName = User.Identity.Name;
            CS.ActionDate = DateTime.Now;
            CS.Notes = "Transferred From Store " + MaterialStore.ToString() + " At " + DateTime.Now.ToString() + " Transfer Number " + LblTransferID.Text;
            CS.IsActive = true;

            db.CuttingListsMaterials.Add(CS);
            db.SaveChanges();


            Logger log = new Logger();
            log.Action = "Transfer Number ( " + LblTransferID.Text + "  ) CuttingList Material (" + fromitem.Material.MaterialName.ToString() + " ) , " +
                "The Stock changed from " + MaterialStock.ToString() + " to " + newstock.ToString() + " From Store ( " + FromStore.SelectedItem.ToString() + " ) To Store ( " + ToStore.SelectedItem.ToString() + " )";
            log.ActionDate = DateTime.Now;
            log.ActionType = "CuttingList Transfer";
            log.UserName = User.Identity.Name;

            db.Loggers.Add(log);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.MaterialID = MaterialID;
            MH.StoreID = MaterialStore;
            MH.OldStock = MaterialStock;
            MH.NewStock = newstock;
            MH.ActionDate = DateTime.Now;
            MH.UserName = User.Identity.Name;
            MH.Note = " Cutting List Transfer No " + LblTransferID.Text.ToString() + " With Height " + Materialheight.ToString() + " and Width " + MaterialWidth.ToString();
            MH.TransactionName = "CuttingList Transfer";
            db.MaterialHistories.Add(MH);
            db.SaveChanges();


            MaterialHistory MH2 = new MaterialHistory();
            MH2.MaterialID = MaterialID;
            MH2.StoreID = Convert.ToInt32(ToStore.SelectedValue);
            MH2.OldStock = 0;
            MH2.NewStock = Convert.ToDecimal(txtRequestedStock.Value);
            MH2.ActionDate = DateTime.Now;
            MH2.UserName = User.Identity.Name;
            MH2.Note = " Cutting List Transfer No " + LblTransferID.Text.ToString() + " With Height " + Materialheight.ToString() + " and Width " + MaterialWidth.ToString();
            MH2.TransactionName = "CuttingList Transfer";
            db.MaterialHistories.Add(MH2);
            db.SaveChanges();

        }

        protected void btnFinishTransfer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}