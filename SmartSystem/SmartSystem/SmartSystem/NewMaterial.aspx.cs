using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Services;

namespace SmartSystem
{
    public partial class NewMaterial : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Roles.IsUserInRole(User.Identity.Name, "StockManager") && !Roles.IsUserInRole(User.Identity.Name, "Management"))
            {
                //    Logger log = new Logger();
                //    log.ActionDate = DateTime.Now;
                //    log.ActionType = "Authorization";
                //    log.UserName = User.Identity.Name;
                //    log.Action = "User tried to access New Materials Page";
                //    db.Loggers.Add(log);
                //    db.SaveChanges();
                //    Response.Redirect("Unauthorized.aspx");
            }

        }

        protected void btnAddToStore_Click(object sender, EventArgs e)
        {
            var materialID = Convert.ToInt32(selectitem.SelectedValue);
            var storeID = Convert.ToInt32(Store.SelectedValue);
            var item = db.MaterialInStocks.Where(x => x.MaterialID == materialID && x.StoreID == storeID).FirstOrDefault();
            if (item == null)
            {
                if (Store.SelectedIndex == 0 || selectitem.SelectedIndex == 0)
                {
                    LblAddItemToStore.Visible = true;
                    LblAddItemToStore.Text = "Please select store and material";
                    LblAddItemToStore.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    AddItemToStore(materialID, storeID);
                }
            }
            else
            {
                LblAddItemToStore.Visible = true;
                LblAddItemToStore.Text = "This Items already Existis in the Store";
                LblAddItemToStore.ForeColor = System.Drawing.Color.Red;

            }

        }

        private void AddItemToStore(int materialID, int storeID)
        {
            decimal newstock = 0;
            try
            {

                var m = db.Materials.Where(x => x.ID == materialID).FirstOrDefault();
                var supplier = m.SupplierID;
                MaterialInStock MS = new MaterialInStock();
                MS.MaterialID = materialID;
                MS.ReservedStock = 0;
                if (stockOnHand.Value == null || stockOnHand.Value == string.Empty)
                {
                    MS.StockOnHand = 0;
                }
                else
                {
                    MS.StockOnHand = Convert.ToDecimal(stockOnHand.Value);
                    newstock = Convert.ToDecimal(stockOnHand.Value);

                }
                MS.StoreID = storeID;
                MS.CreationDate = DateTime.Now;
                MS.CreationUser = User.Identity.Name.ToString();
                MS.IsActive = true;
                MS.OpeningStock = 0;
                MS.Location = location.Value;
                if (safetystock.Value == null || safetystock.Value == string.Empty)
                {
                    MS.SafetyStock = 0;
                }
                else
                {
                    MS.SafetyStock = Convert.ToDecimal(safetystock.Value);

                }
                MS.UnitID = m.UnitID;
                MS.Supplier = m.SupplierID;
                string t = MS.CreationUser;

                db.MaterialInStocks.Add(MS);
                db.SaveChanges();


                LblAddItemToStore.Text = "The Material ( " + selectitem.SelectedItem.ToString() + " ) is now added successfully to Store ( " + Store.SelectedItem.ToString() + " ) ";
                LblAddItemToStore.Visible = true;
                LblAddItemToStore.ForeColor = System.Drawing.Color.Green;
                

                AddHistory(materialID, storeID, newstock, m);
                stockOnHand.Value = "";
                location.Value = "";
                safetystock.Value = "";



            }
            catch (Exception ex)
            {
                LblAddItemToStore.Text = ex.InnerException.Message;
                LblAddItemToStore.Visible = true;
                LblAddItemToStore.ForeColor = System.Drawing.Color.Red;
            }

        }

        private void AddHistory(int materialID, int storeID, decimal newstock, Material m)
        {
            try
            {
                MaterialHistory MH = new MaterialHistory();
                MH.ActionDate = DateTime.Now;
                MH.MaterialID = materialID;
                MH.StoreID = storeID;
                MH.TransactionName = "Initial Stock";
                MH.UserName = User.Identity.Name;
                MH.NewStock = newstock;
                MH.OldStock = 0;
                MH.Note = "Material " + m.MaterialName + " is now created in Store " + storeID.ToString();
                db.MaterialHistories.Add(MH);
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                LblAddItemToStore.Text = ex.InnerException.InnerException.Message;
                LblAddItemToStore.Visible = true;
                LblAddItemToStore.ForeColor = System.Drawing.Color.Red;
            }
          
        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            string i = itemcode.Value.ToString();
            if (itemsupplier.SelectedIndex == 0 || materialcategory.SelectedIndex == 0 || itemunit.SelectedIndex == 0)
            {
                LblAddNewItem.Visible = true;
                LblAddNewItem.ForeColor = System.Drawing.Color.Red;
                LblAddNewItem.Text = "Please Select Supplier, Category and Unit";
            }
            else
            {
                var item = db.Materials.Where(x => x.MaterialNo == i).FirstOrDefault();

                if (item == null)
                {
                    AddNewMaterial();
                }
                else
                {
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = System.Drawing.Color.Red;
                    LblAddNewItem.Text = "This Item Already Exists";
                }
            }


        }

        private void AddNewMaterial()
        {
            try
            {
                if (itemcode.Value == null || itemcode.Value == string.Empty || itemname.Value == null || itemname.Value == string.Empty)
                {
                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = System.Drawing.Color.Red;
                    LblAddNewItem.Text = "Please enter item code and item name.";
                }
                else
                {
                    Material M = new Material();

                    if (FileUpload1.HasFile)
                    {
                        string postedFile = FileUpload1.PostedFile.FileName;
                        string filePath = Server.MapPath("~/Uploads/") + Path.GetFileName(postedFile);
                        string p = "Uploads/" + Path.GetFileName(postedFile);
                        M.imagepath = p;
                    }
                    else
                    {
                        M.imagepath = "";
                    }

                    M.MaterialNo = itemcode.Value;
                    M.MaterialName = itemname.Value;
                    if (itemDescription.Value == null || itemDescription.Value == String.Empty)
                        M.Description = "";
                    else
                        M.Description = itemDescription.Value;

                    M.TypeID = Convert.ToInt32(materialcategory.SelectedValue);
                    M.UnitID = Convert.ToInt32(itemunit.SelectedValue);
                    M.IsActive = true;

                    M.SupplierID = Convert.ToInt32(itemsupplier.SelectedValue);
                    db.Materials.Add(M);
                    db.SaveChanges();
                    uploadimage();


                    selectitem.Items.Clear();
                    ListItem item = new ListItem();
                    item.Selected = true;
                    item.Text = "أختر الصنف";
                    item.Value = "";
                    selectitem.Items.Add(item);
                    selectitem.DataBind();

                    itemcode.Value = "";
                    itemname.Value = "";

                    Sheight.Value = "";
                    Swidth.Value = "";
                    itemDescription.Value = "";
                    //itemsupplier.SelectedIndex = 0;
                    //itemunit.SelectedIndex = 0;
                    //materialcategory.SelectedIndex = 0;

                    LblAddNewItem.Visible = true;
                    LblAddNewItem.ForeColor = System.Drawing.Color.Green;
                    LblAddNewItem.Text = "The Item " + itemname.Value.ToString() + " is added  Successfully";
                }

            }
            catch (Exception ex)
            {
                LblAddNewItem.Visible = true;
                LblAddNewItem.ForeColor = System.Drawing.Color.Red;
                LblAddNewItem.Text = ex.Message;
            }

        }

        private void uploadimage()
        {
 
            try
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
                }
             

            }
            catch (Exception ex)
            {
                LblUploadError.Text = "Error In upload the image" + ex.Message;
                LblUploadError.Visible = true;
                LblUploadError.ForeColor = System.Drawing.Color.Red;
            }
        }
 
    }
}