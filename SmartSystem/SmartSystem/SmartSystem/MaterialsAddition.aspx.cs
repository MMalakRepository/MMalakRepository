using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SmartSystem
{
    public partial class MaterialsAddition : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnCloseAddition.Visible = false;
                dvDetails.Visible = false;
            }
        }

        protected void btnAddNewContainer_Click(object sender, EventArgs e)
        {
            if(txtContainerNumber.Value == null || txtContainerNumber.Value == String.Empty)
            {
                lblContainerErr.Text = "Insert Container Number ";
                lblContainerErr.ForeColor = Color.Red;
                lblContainerErr.Visible = true;
            }
            else
            {
                
                
                try
                {
                    int cnumber = Convert.ToInt32(txtContainerNumber.Value);
                    bool cExists = CheckContainer(cnumber);
                    if (cExists)
                    {
                        lblContainerErr.Text = "The Container Number already exists ";
                        lblContainerErr.ForeColor = Color.Red;
                        lblContainerErr.Visible = true;
                    }
                    else
                    {
                        lblContainerErr.Visible = false;
                        AddnewContainer();
                       
                    }

                }
                catch (Exception ex)
                {
                    lblContainerErr.Text = "Error in Container Creation " + ex.InnerException.Message;
                    lblContainerErr.ForeColor = Color.Red;
                    lblContainerErr.Visible = true;
                }
            }
          
        }

        private void AddnewContainer()
        {
            if(txtContainerDesc.Value == null || txtContainerDesc.Value == String.Empty)
            {
                lblContainerErr.Text = "Please Enter Description for this Container";
                lblContainerErr.ForeColor = Color.Red;
                lblContainerErr.Visible = true;
            }
            else
            {
                int cnumber = Convert.ToInt32(txtContainerNumber.Value);
                Container CN = new Container();
                CN.CUser = User.Identity.Name;
                CN.CDate = DateTime.Now;
                CN.CNumber = Convert.ToInt32(txtContainerNumber.Value);
                CN.CDescription = txtContainerDesc.Value.ToString();
                if (txtContainerNote.Value == null || txtContainerNote.Value == String.Empty)
                    CN.Notes = "No Notes Added";
                else
                    CN.Notes = txtContainerNote.Value;

                db.Containers.Add(CN);
                db.SaveChanges();
                
                btnAddNewContainer.Enabled = false;
                btnCloseAddition.Enabled = true;
                btnCloseAddition.Visible = true;
                var ct = db.Containers.Where(c => c.CNumber == cnumber).FirstOrDefault();
                LblContainerID.Text = ct.ID.ToString();
                txtContainerDesc.Disabled = true;
                txtContainerNote.Disabled = true;
                txtContainerNumber.Disabled = true;
                lblContainerErr.Visible = false;
                dvDetails.Visible = true;
            }
        }

        private bool CheckContainer(int Cnumber)
        {
            bool IsExist = false;
            var cont = db.Containers.Where(x => x.CNumber == Cnumber).FirstOrDefault();
            if (cont != null)
                IsExist = true;

            return IsExist;
        }

        protected void btnCloseAddition_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void GridData_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow gv = GridData.SelectedRow;
                int ItemID = int.Parse(gv.Cells[1].Text);

                var cDetail = db.ContainerDatas.Where(x => x.ID == ItemID).FirstOrDefault();
                cDetail.IsActive = false;
                db.SaveChanges();

                var materialid = Convert.ToInt32(cDetail.MaterialID);
                var storeid = Convert.ToInt32(cDetail.StoreID);
                decimal Qty = Convert.ToDecimal(cDetail.Quantity);

                DecreaseStock(materialid, storeid, Qty);
                GridData.DataBind();
            }
            catch (Exception ex)
            {
                lblAddItemErr.Text = "Error in Item Return " + ex.InnerException.Message;
                lblAddItemErr.Visible = true;
                lblAddItemErr.ForeColor = Color.Red;
            }
        }

        private void DecreaseStock(int materialid,int storeid,decimal QTY)
        {
            try
            {

                var MS = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
                decimal oldstock, newstock;
                oldstock = Convert.ToDecimal(MS.StockOnHand);
                newstock = oldstock - QTY;
                MS.StockOnHand = newstock;
                db.SaveChanges();

                Logger log = new Logger();
                log.UserName = User.Identity.Name;
                log.Action = "Material " + MS.Material.MaterialName.ToString() + " Stock is now increased From " + oldstock.ToString() + " To " + newstock.ToString();
                log.ActionType = "Item Addition Return";
                log.ActionDate = DateTime.Now;
                db.Loggers.Add(log);
                db.SaveChanges();

                StockLogger stLog = new StockLogger();
                stLog.ActionDate = DateTime.Now;
                stLog.MaterialInStock = MS.ID;
                stLog.NewStock = newstock;
                stLog.OldStock = oldstock;
                stLog.UserName = User.Identity.Name;
                stLog.Notes = "Material " + MS.Material.MaterialName.ToString() + " stock decreased in Container " + txtContainerNumber.Value.ToString();
                db.StockLoggers.Add(stLog);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.NewStock = newstock;
                MH.OldStock = oldstock;
                MH.TransactionName = "Addition Return";
                MH.UserName = User.Identity.Name;
                MH.ActionDate = DateTime.Now;
                MH.Note = "Material " + MS.Material.MaterialName.ToString() + " stock decreased in Container " + txtContainerNumber.Value.ToString();
                db.MaterialHistories.Add(MH);
                db.SaveChanges();

                lblAddItemErr.Text = "Item Returned Successfully";
                lblAddItemErr.Visible = true;
                lblAddItemErr.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                lblAddItemErr.Text = "Error in new stock addition Return " + ex.InnerException.Message;
                lblAddItemErr.Visible = true;
                lblAddItemErr.ForeColor = Color.Green;
            }
        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtQuantity.Value == null || txtQuantity.Value == String.Empty)
                {
                    lblAddItemErr.Text = "Please Insert Quantity";
                    lblAddItemErr.Visible = true;
                    lblAddItemErr.ForeColor = Color.Red;
                }
                else if(selectitem.SelectedIndex == 0 || Store.SelectedIndex == 0)
                {
                    lblAddItemErr.Text = "Please Select Store and Material";
                    lblAddItemErr.Visible = true;
                    lblAddItemErr.ForeColor = Color.Red;
                }
                else
                {
                    AddNewitem();
                }
            }
            catch(Exception ex)
            {
                lblAddItemErr.Text = "Error in Item Addition " + ex.InnerException.Message;
                lblAddItemErr.Visible = true;
                lblAddItemErr.ForeColor = Color.Red;
            }
        }

        private void AddNewitem()
        {
            try
            {
                int storeid = Convert.ToInt32(Store.SelectedValue);
                int materialid = Convert.ToInt32(selectitem.SelectedValue);
                decimal QTY = Convert.ToDecimal(txtQuantity.Value);

                ContainerData CD = new ContainerData();
                CD.MaterialID = materialid;
                CD.StoreID = storeid;
                CD.ContainerID = Convert.ToInt32(LblContainerID.Text);
                if (txtItemNotes.Value == null || txtItemNotes.Value == String.Empty)
                    CD.Notes = "No Notes Added For item";
                else
                    CD.Notes = txtItemNotes.Value.ToString();
                CD.IsActive = true;
                CD.Quantity = QTY;
                db.ContainerDatas.Add(CD);
                db.SaveChanges();
                GridData.DataBind();

                AddNewStock(storeid,materialid,QTY);
                txtItemNotes.Value = "";
                txtQuantity.Value = "";
            }
            catch(Exception ex)
            {
                lblAddItemErr.Text = "Error in item " + ex.InnerException.Message;
                lblAddItemErr.ForeColor = Color.Red;
                lblAddItemErr.Visible = true;
            }
        }

        private void AddNewStock(int storeid, int materialid, decimal QTY)
        {
            try
            {
               
                var MS = db.MaterialInStocks.Where(x => x.MaterialID == materialid && x.StoreID == storeid).FirstOrDefault();
                decimal oldstock, newstock;
                oldstock = Convert.ToDecimal(MS.StockOnHand);
                newstock = oldstock + QTY;
                MS.StockOnHand = newstock;
                db.SaveChanges();

                Logger log = new Logger();
                log.UserName = User.Identity.Name;
                log.Action = "Material " + MS.Material.MaterialName.ToString() + " Stock is now increased From " + oldstock.ToString() + " To " + newstock.ToString();
                log.ActionType = "Item Addition";
                log.ActionDate = DateTime.Now;
                db.Loggers.Add(log);
                db.SaveChanges();

                StockLogger stLog = new StockLogger();
                stLog.ActionDate = DateTime.Now;
                stLog.MaterialInStock = MS.ID;
                stLog.NewStock = newstock;
                stLog.OldStock = oldstock;
                stLog.UserName = User.Identity.Name;
                stLog.Notes = "Material " + MS.Material.MaterialName.ToString() + " stock increased in Container " + txtContainerNumber.Value.ToString();
                db.StockLoggers.Add(stLog);
                db.SaveChanges();

                MaterialHistory MH = new MaterialHistory();
                MH.MaterialID = materialid;
                MH.StoreID = storeid;
                MH.NewStock = newstock;
                MH.OldStock = oldstock;
                MH.TransactionName = "Addition";
                MH.UserName = User.Identity.Name;
                MH.ActionDate = DateTime.Now;
                MH.Note = "Material " + MS.Material.MaterialName.ToString() + " stock increased in Container " + txtContainerNumber.Value.ToString();
                db.MaterialHistories.Add(MH);
                db.SaveChanges();

                lblAddItemErr.Text = "Item Entered Successfully";
                lblAddItemErr.Visible = true;
                lblAddItemErr.ForeColor = Color.Green;
            }
            catch(Exception ex)
            {
                lblAddItemErr.Text = "Error in new stock addition " + ex.InnerException.Message;
                lblAddItemErr.Visible = true;
                lblAddItemErr.ForeColor = Color.Green;
            }
        }
    }
}