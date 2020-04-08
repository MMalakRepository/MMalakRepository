using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SmartSystem
{
    public partial class InternalOrders : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!User.IsInRole("StockManager") || !User.IsInRole("Management"))
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



            if (!IsPostBack)
            {
                dvDetails.Visible = false;
                Itemdetails.Visible = false;
                Customer.Enabled = true;
                dvOrderDetails.Visible = false;
                txtNote.Disabled = false;
                btnCloseOrder.Visible = false;
                btnAddNewOrder.Enabled = true;
            }
        }

        protected void btnAddNewOrder_Click(object sender, EventArgs e)
        {
            try
            {
                if (Customer.SelectedIndex == 0)
                {
                    lblOrderErr.Text = "Please Select A Customer ";
                    lblOrderErr.ForeColor = Color.Red;
                }
                else
                {
                    Itemdetails.Visible = false;
                    dvDetails.Visible = true;
                    lblOrderErr.Text = "";
                    txtOrderNotes.Disabled = true;
                    Customer.Enabled = false;
                    btnCloseOrder.Visible = true;
                    btnAddNewOrder.Enabled = false ;

                    Order neworder = new Order();
                    neworder.CustomerID = Convert.ToInt32(Customer.SelectedValue);
                    neworder.IsActive = true;
                    neworder.OrderDate = DateTime.Now;
                    neworder.UserName = User.Identity.Name;
                    neworder.Notes = txtOrderNotes.Value.ToString();
                    neworder.OrderNo = 0;

                    db.Orders.Add(neworder);
                    db.SaveChanges();

                    var lastorder = db.Orders.Max(x => x.ID);
                    string t = lastorder.ToString();
                    LblOrderID.Text = lastorder.ToString();
                    AddNewOrderLog(t);

  
                }
            }
            catch(Exception ex)
            {
                lblOrderErr.Text = "Error in Orders " + ex.InnerException.InnerException.Message;
                lblOrderErr.Visible = true;
                lblOrderErr.ForeColor = Color.Red;

                Logger log = new Logger();
                log.Action = "Error in Order Creation " + ex.InnerException.InnerException.Message;
                log.ActionDate = DateTime.Now;
                log.ActionType = "Order Creation";
                log.UserName = User.Identity.Name;

                db.Loggers.Add(log);
                db.SaveChanges();
            }
        }

        protected void btnCheckItemStock_Click(object sender, EventArgs e)
        {
            Itemdetails.Visible = false;
            GridData.DataBind();
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

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            try
            {
                var availableQTY = Convert.ToDecimal(txtCurrentStock.Value);
                var requestedQTY = Convert.ToDecimal(txtRequestedStock.Value.ToString()); ;
                if(String.IsNullOrEmpty(txtRequestedStock.Value.ToString()))
                {
                    LblAddNewItem.Text = "Please insert the Requested Quantity";
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = Color.Red;
                }
               else if (requestedQTY > availableQTY)
                {
                    LblAddNewItem.Text = "The Requested Quantity > Available Stock" ;
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = Color.Red;
                }
                else
                {
                    selectitem.Enabled = false;
                    Store.Enabled = false;
                    SettleStock();

                    OrderDetail d = new OrderDetail();
                    d.IsActive = true;
                    d.MaterialID = Convert.ToInt32(selectitem.SelectedValue);
                    d.OrderID = Convert.ToInt32(LblOrderID.Text.ToString());
                    d.Quantity = Convert.ToDecimal(txtRequestedStock.Value.ToString());
                    d.StoreID = Convert.ToInt32(Store.SelectedValue.ToString());
                    if (txtNote.Value == null || txtNote.Value == String.Empty)
                        txtNote.Value = "";
                    d.Notes = txtNote.Value.ToString();

                    if (String.IsNullOrWhiteSpace(txtitemHieght.Value.ToString()) || txtitemHieght.Value.ToString() == "&nbsp;")
                        d.Height = 0;
                    else
                        d.Height = Convert.ToDecimal(txtitemHieght.Value.ToString());

                    if (String.IsNullOrWhiteSpace(txtItemWidth.Value.ToString()) || txtItemWidth.Value.ToString() == "&nbsp;")
                        d.Width = 0;
                    else
                        d.Width = Convert.ToDecimal(txtItemWidth.Value.ToString());

                    d.MaterialType = txtItemType.Value.ToString();

                    db.OrderDetails.Add(d);
                    db.SaveChanges();
                    GridOrderDetails.DataBind();
                    dvOrderDetails.Visible = true;
                    ClearData();
                    selectitem.Enabled = true;
                    Store.Enabled = true;
                }
               
            }
            catch (Exception ex)
            {
                lblOrderErr.Text = "Error in Order Items " + ex.InnerException.InnerException.Message;
                lblOrderErr.Visible = true;
                lblOrderErr.ForeColor = Color.Red;

                Logger log = new Logger();
                log.Action = "Error in Order items Addition " + ex.InnerException.InnerException.Message;
                log.ActionDate = DateTime.Now;
                log.ActionType = "Order Details";
                log.UserName = User.Identity.Name;

                db.Loggers.Add(log);
                db.SaveChanges();
            }

        }

        private void AddNewOrderLog(string t)
        {
            Logger log = new Logger();
            log.Action = "New Order " + t.ToString() + " is now created ";
            log.ActionDate = DateTime.Now;
            log.ActionType = "Order Creation";
            log.UserName = User.Identity.Name;

            db.Loggers.Add(log);
            db.SaveChanges();
        }

        private void SettleStock()
        {
            string type = txtItemType.Value.ToString();

            if (type == "CuttingList")
                CuttingItemStock();
            else if (type == "Material")
                MaterialStock();
            else if (type == "DeadMaterial")
                DeadMaterialStock();
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
            item.Quantity = item.Quantity - Convert.ToDecimal(txtRequestedStock.Value);
            db.SaveChanges();

            Logger log = new Logger();
            log.Action = "Dead Material (" + item.Material.MaterialName.ToString() + " ) , The Stock changed from "
                + MaterialStock.ToString() + " to " + newstock.ToString();
            log.ActionDate = DateTime.Now;
            log.ActionType = "DeadMaterial Order";
            log.UserName = User.Identity.Name;

            db.Loggers.Add(log);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.ActionDate = DateTime.Now;
            MH.MaterialID = MaterialID;
            MH.StoreID = MaterialStore;
            MH.TransactionName = "Sales DeadList";
            MH.UserName = User.Identity.Name;
            MH.NewStock = newstock;
            MH.OldStock = MaterialStock;
            MH.Note = "DeadMaterial " + item.Material.MaterialName.ToString() + " is now invoiced in Store "
                + MaterialStore.ToString() + "With Height " + Materialheight.ToString() + " and Width " 
                + MaterialWidth.ToString() + " In Order ID " + LblOrderID.Text.ToString() + " In Order ID " + LblOrderID.Text.ToString() ;
            db.MaterialHistories.Add(MH);
            db.SaveChanges();

        }

        private void MaterialStock()
        {
            var MaterialID = Convert.ToInt32(txtMaterialID.Value);
            var MaterialStore = Convert.ToInt32(txtStore.Value);
            var MaterialStock = Convert.ToDecimal(txtCurrentStock.Value);
            var newstock = MaterialStock - Convert.ToDecimal(txtRequestedStock.Value);
            var item = db.MaterialInStocks.Where(x => x.MaterialID == MaterialID && x.StoreID == MaterialStore).FirstOrDefault();
            item.StockOnHand -= Convert.ToDecimal(txtRequestedStock.Value);
            db.SaveChanges();

            var ss = db.MaterialInStocks.Where(x => x.MaterialID == MaterialID && x.StoreID == MaterialStore).FirstOrDefault();

            StockLogger stlog = new StockLogger();
            stlog.MaterialInStock = ss.ID;
            stlog.OldStock = MaterialStock;
            stlog.ActionDate = DateTime.Now;
            stlog.UserName = User.Identity.Name;
            stlog.NewStock = MaterialStock - Convert.ToDecimal(txtRequestedStock.Value);
            stlog.Notes = "Order Number " + LblOrderID.Text.ToString() + "   For Customer " + Customer.SelectedItem.ToString();

            db.StockLoggers.Add(stlog);
            db.SaveChanges();

            Logger log = new Logger();
            log.Action = " Material Order (" + item.Material.MaterialName.ToString() + " ) , The Stock changed from " + MaterialStock.ToString() + " to " + newstock.ToString() + " For Customer " + Customer.SelectedItem.ToString();
            log.ActionDate = DateTime.Now;
            log.ActionType = "Material Order";
            log.UserName = User.Identity.Name;

            db.Loggers.Add(log);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.ActionDate = DateTime.Now;
            MH.MaterialID = MaterialID;
            MH.StoreID = MaterialStore;
            MH.TransactionName = "Sales Material";
            MH.UserName = User.Identity.Name;
            MH.NewStock = newstock;
            MH.OldStock = MaterialStock;
            MH.Note = "Material " + item.Material.MaterialName.ToString() + " is now invoiced in Store " + MaterialStore.ToString() + " In order ID " + LblOrderID.Text.ToString();
            db.MaterialHistories.Add(MH);
            db.SaveChanges();

        }

        private void CuttingItemStock()
        {
            var MaterialID = Convert.ToInt32(txtMaterialID.Value);
            var MaterialStore = Convert.ToInt32(txtStore.Value);
            var Materialheight = Convert.ToDecimal(txtitemHieght.Value);
            var MaterialWidth = Convert.ToDecimal(txtItemWidth.Value);
            var MaterialNotes = txtItemNotes.Value.ToString();
            var MaterialStock = Convert.ToDecimal(txtCurrentStock.Value);

            var newstock = MaterialStock - Convert.ToDecimal(txtRequestedStock.Value);

            var item = db.CuttingListsMaterials.Where(x => x.MaterialID == MaterialID && x.StoreID == MaterialStore && x.Height == Materialheight && x.Width == MaterialWidth && x.Notes == MaterialNotes.ToString()).FirstOrDefault();
            item.Quantity -= Convert.ToDecimal(txtRequestedStock.Value);
            db.SaveChanges();

            Logger log = new Logger();
            log.Action = "CuttingList Material (" + item.Material.MaterialName.ToString() + " ) , The Stock changed from " + MaterialStock.ToString() + " to " + newstock.ToString();
            log.ActionDate = DateTime.Now;
            log.ActionType = "CuttingList Order";
            log.UserName = User.Identity.Name;

            db.Loggers.Add(log);
            db.SaveChanges();

            MaterialHistory MH = new MaterialHistory();
            MH.ActionDate = DateTime.Now;
            MH.MaterialID = MaterialID;
            MH.StoreID = MaterialStore;
            MH.TransactionName = "Sales CuttingList";
            MH.UserName = User.Identity.Name;
            MH.NewStock = newstock;
            MH.OldStock = MaterialStock;
            MH.Note = "CuttingListMaterial " + item.Material.MaterialName.ToString() + " is now invoiced in Store " 
                + MaterialStore.ToString() + "With Height " + Materialheight.ToString() + " and Width " + MaterialWidth.ToString() +" In Order ID " + LblOrderID.Text.ToString() ;
            db.MaterialHistories.Add(MH);
            db.SaveChanges();

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

        protected void GridOrderDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Itemdetails.Visible = true;
                GridViewRow gv = GridOrderDetails.SelectedRow;
                //order,material,code,name,QTy,height,Width,Type,customer,store,
                int orderid = int.Parse(gv.Cells[1].Text);
                int materialid = int.Parse(gv.Cells[2].Text);
                string code = gv.Cells[3].Text;
                string name = gv.Cells[4].Text;
                decimal QTY = decimal.Parse(gv.Cells[5].Text);
                decimal Height = decimal.Parse(gv.Cells[6].Text);
                decimal Width = decimal.Parse(gv.Cells[7].Text);
                string storename = gv.Cells[10].Text;

                string type = gv.Cells[8].Text;
                if (type == "CuttingList")
                    CuttingItemReturn(materialid, name, orderid, QTY, Height, Width, storename);
                else if (type == "Material")
                    MaterialReturn(materialid, name, orderid, QTY, Height, Width, storename);
                else if (type == "DeadMaterial")
                    DeadMaterialReturn(materialid, name, orderid, QTY, Height, Width, storename);


                var orderdetail = db.OrderDetails.Where(x => x.OrderID == orderid && x.MaterialID == materialid && x.Quantity == QTY).FirstOrDefault();
                orderdetail.IsActive = false;
                db.SaveChanges();


                GridOrderDetails.DataBind();
                if (GridOrderDetails.Rows.Count == 0)
                    dvOrderDetails.Visible = false;
                Itemdetails.Visible = false;
                GridData.DataBind();
                
            }
            catch (Exception ex)
            {
                LblAddNewItem.Text = "Error in Material Return " + ex.Message;
                LblAddNewItem.Visible = true;
                LblAddNewItem.ForeColor = Color.Red;
            }

        }

        private void DeadMaterialReturn(int materialid,string name,int orderid,decimal QTY,decimal height,decimal width,string store)
        {
            decimal oldstock, newstock;
            var st = db.Stores.Where(x => x.StoreName == store).FirstOrDefault();
            int storeid = st.ID;
            var deaditem = db.DeadMaterials.Where(x => x.MaterialID == materialid && x.StoreID == storeid && x.Height == height && x.Width == width).FirstOrDefault();
            if (deaditem != null)
            {
                oldstock = Convert.ToDecimal(deaditem.Quantity);
                newstock = Convert.ToDecimal(deaditem.Quantity) + QTY;
                deaditem.Quantity = newstock;
                db.SaveChanges();

                Logger log = new Logger();
                log.Action = "Return of Dead Material ( " + name + " ) In store ( " + store + " ) from Order  ( " + orderid + " )" ;
                log.ActionDate = DateTime.Now;
                log.UserName = User.Identity.Name;
                log.ActionType = "CuttingList Return";
                db.Loggers.Add(log);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.TransactionName = "Return DeadList";
                MH.UserName = User.Identity.Name;
                MH.NewStock = newstock;
                MH.OldStock = oldstock;
                MH.Note = "DeadMaterial " + name + " is now returned in Store " + storeid.ToString() + " With Height "
                    + height.ToString() + " and Width "+ width.ToString() + " from Order  ( " + orderid + " )"; ;
                db.MaterialHistories.Add(MH);
                db.SaveChanges();
            }
            else
            {
                DeadMaterial cs = new DeadMaterial();
                cs.Quantity = QTY;
                cs.StoreID = storeid;
                cs.MaterialID = materialid;
                cs.IsActive = true;
                cs.Height = height;
                cs.Width = width;
                cs.UserName = User.Identity.Name;
                cs.Notes = "Return of Dead Material ( " + name + " ) In store ( " + store + " ) from Order  ( " + orderid + " )";
                cs.ActionDate = DateTime.Now;

                db.DeadMaterials.Add(cs);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.TransactionName = "Return DeadList";
                MH.UserName = User.Identity.Name;
                MH.NewStock = Convert.ToDecimal(QTY);
                MH.OldStock = 0;
                MH.Note = "DeadMaterial " + name + " is now returned in Store " + storeid.ToString() +  " With Height " 
                    + height.ToString() + " and Width " + width.ToString() + " from Order  ( " + orderid + " )"; ;
                db.MaterialHistories.Add(MH);
                db.SaveChanges();

            }
        }

        private void MaterialReturn(int materialid,string name, int orderid, decimal QTY, decimal height, decimal width, string store)
        {
            var st = db.Stores.Where(x => x.StoreName == store).FirstOrDefault();
            int storeid = st.ID;
            var mat = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
            if (mat != null)
            {
                decimal oldstock = decimal.Parse(mat.StockOnHand.ToString());
                decimal newstock = oldstock + QTY;

                mat.StockOnHand = newstock;
                db.SaveChanges();

                StockLogger stlog = new StockLogger();
                stlog.ActionDate = DateTime.Now;
                stlog.UserName = User.Identity.Name;
                stlog.MaterialInStock = mat.ID;
                stlog.NewStock = newstock;
                stlog.OldStock = oldstock;
                stlog.Notes = "Return of Good Material ( " + name + " ) In store ( " + store + " ) from Order  ( " + orderid + " )";

                db.StockLoggers.Add(stlog);
                db.SaveChanges();

                Logger log = new Logger();
                log.ActionType = "Material Return";
                log.ActionDate = DateTime.Now;
                log.UserName = User.Identity.Name;
                log.Action = "Return of Good List of Material ( " + name + " ) In store ( " + store + " ) from Order  ( " + orderid + " )";

                db.Loggers.Add(log);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.TransactionName = "Return Material";
                MH.UserName = User.Identity.Name;
                MH.NewStock = newstock;
                MH.OldStock = oldstock;
                MH.Note = "Material ( " + name + " ) is now returned in Store ( " + storeid.ToString() +" ) From order ( " + orderid + " ) " ;
                db.MaterialHistories.Add(MH);
                db.SaveChanges();
            }
        
        }

        private void CuttingItemReturn(int materialid,string name, int orderid, decimal QTY, decimal height, decimal width, string store)
        {
            var st = db.Stores.Where(x => x.StoreName == store).FirstOrDefault();
            int storeid = st.ID;
            decimal oldstock, newstock;
            var custlist = db.CuttingListsMaterials.Where(x => x.MaterialID == materialid && x.StoreID == storeid && x.Height == height && x.Width == width).FirstOrDefault();
            if (custlist != null)
            {
                 oldstock = Convert.ToDecimal(custlist.Quantity);
                newstock = oldstock + QTY;
                custlist.Quantity = newstock;
                db.SaveChanges();

                Logger log = new Logger();
                log.Action = "Return of Cutting List of Material ( " + name + " ) In store ( " + store + " ) from Order  ( " + orderid + " )";
                log.ActionDate = DateTime.Now;
                log.UserName = User.Identity.Name;
                log.ActionType = "CuttingList Return";
                db.Loggers.Add(log);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.TransactionName = "Return CuttingList";
                MH.UserName = User.Identity.Name;
                MH.NewStock = newstock;
                MH.OldStock = oldstock;
                MH.Note = "CuttingListMaterial ( " + name + " ) is now returned in Store ( " + storeid.ToString() + " ) From order ( " + orderid + " ) With Height " + height.ToString() + " and Width " + width.ToString();
                db.MaterialHistories.Add(MH);
                db.SaveChanges();
            }
            else
            {
                CuttingListsMaterial cs = new CuttingListsMaterial();
                cs.Quantity = QTY;
                cs.StoreID = storeid;
                cs.MaterialID = materialid;
                cs.IsActive = true;
                cs.Height = height;
                cs.Width = width;
                cs.UserName = User.Identity.Name;
                cs.Notes = "Return of Cutting List of Material ( " + name + " ) In store ( " + store + " ) from Order  ( " + orderid + " )";
                cs.ActionDate = DateTime.Now;

                db.CuttingListsMaterials.Add(cs);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.TransactionName = "Return CuttingList";
                MH.UserName = User.Identity.Name;
                MH.NewStock =Convert.ToDecimal(QTY);
                MH.OldStock = 0;
                MH.Note = "CuttingListMaterial ( " + name + " ) is now returned in Store ( " + storeid.ToString() + " ) From order ( " + orderid + " ) With Height " + height.ToString() + " and Width " + width.ToString();
                db.MaterialHistories.Add(MH);
                db.SaveChanges();
            }

       

        }

        protected void btnCloseOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
 
    }
}