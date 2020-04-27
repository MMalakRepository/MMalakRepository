using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartSystem;

namespace SmartSystem
{
    public partial class Administration : System.Web.UI.Page
    {
        Entities db = new Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Roles.IsUserInRole(User.Identity.Name, "SystemAdmin") &&
                !Roles.IsUserInRole(User.Identity.Name, "Management"))
            {
                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "Authorization";
                log.UserName = User.Identity.Name;
                log.Action = "User tried to access Administration Page";
                db.Loggers.Add(log);
                db.SaveChanges();
                Response.Redirect("Unauthorized.aspx");
            }
      
            else
            {
                Session["UserName"] = User.Identity.Name;
            }
        }

        protected void btnAddNewCategory_Click(object sender, EventArgs e)
        {
            if(txtNewCategory.Value.ToString() == null || txtNewCategory.Value.ToString() == String.Empty)
            {
                LblAddNewCategory.Text = "Please Enter New Category Name";
                LblAddNewCategory.Visible = true;
                LblAddNewCategory.ForeColor = System.Drawing.Color.Red;

            }
            else
            {

                var cat = db.Categories.Where(x => x.CategoryName == txtNewCategory.Value).FirstOrDefault();
                if (cat == null)
                    AddNewCategory();
                else
                {
                    LblAddNewCategory.Text = "The category (  " + txtNewCategory.Value.ToString() + " ) Already Exists";
                    LblAddNewCategory.Visible = true;
                    LblAddNewCategory.ForeColor = System.Drawing.Color.Red;
                }
            }


        }

        private void AddNewCategory()
        {
            try
            {
                Category ct = new Category();
                ct.CategoryName = txtNewCategory.Value;

                db.Categories.Add(ct);
                db.SaveChanges();

                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "New Category";
                log.UserName = User.Identity.Name;
                log.Action = "new Category (  " + txtNewCategory.Value.ToString() + " ) is added ";

                db.Loggers.Add(log);
                db.SaveChanges();


                LblAddNewCategory.Text = "New Category (  " + txtNewCategory.Value.ToString() + " ) Added Successfully";
                LblAddNewCategory.Visible = true;
                LblAddNewCategory.ForeColor = System.Drawing.Color.Green;
                txtNewCategory.Value = "";

                materialcategory.Items.Clear();
                ListItem item = new ListItem();
                item.Selected = true;
                item.Value = "";
                item.Text =  "Select Category";

                materialcategory.Items.Add(item);
                materialcategory.DataBind();


            }
            catch (Exception ex)
            {
                LblAddNewCategory.Text = "Error in category Creation , The Error is " + ex.InnerException.Message;
                LblAddNewCategory.Visible = true;
                LblAddNewCategory.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnAddNewSubCategory_Click(object sender, EventArgs e)
        {
            if(txtSubCategory.Value.ToString() == null || txtSubCategory.Value.ToString() == String.Empty)
            {
                LblAddNewSubCategory.Visible = true;
                LblAddNewSubCategory.Text = "Please Enter New Subcategory Name";
                LblAddNewSubCategory.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                var subcat = db.SubCategories.Where(x => x.SubCategoryName == txtSubCategory.Value).FirstOrDefault();
                if (subcat == null)
                    AddNewSubCategory();
                else
                {
                    LblAddNewSubCategory.Visible = true;
                    LblAddNewSubCategory.Text = "The Subcategory ( " + txtSubCategory.Value + " ) already Exists";
                    LblAddNewSubCategory.ForeColor = System.Drawing.Color.Red;
                }
            }
           
 
        }

        private void AddNewSubCategory()
        {
            try
            {
                SubCategory SC = new SubCategory();
                SC.CategoryID = Convert.ToInt32(materialcategory.SelectedValue);
                SC.SubCategoryName = txtSubCategory.Value.ToString();

                 db.SubCategories.Add(SC);
                db.SaveChanges();



                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "New SubCategory";
                log.UserName = User.Identity.Name;
                log.Action = "New SubCategory  ( " + txtSubCategory.Value + " )  is added ";

                db.Loggers.Add(log);
                db.SaveChanges();

                LblAddNewSubCategory.Text = "SubCategory ( " + txtSubCategory.Value + " ) Added ";
                LblAddNewSubCategory.Visible = true;
                LblAddNewSubCategory.ForeColor = System.Drawing.Color.Green;

                txtSubCategory.Value = "";

            }
            catch (Exception ex)
            {
                LblAddNewSubCategory.Text = "Error in SubCategory Creation" + ex.Message;
                LblAddNewSubCategory.Visible = true;
                LblAddNewSubCategory.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnAddNewUnit_Click(object sender, EventArgs e)
        {

            var un = db.Units.Where(x => x.UnitName == txtNewUnit.Value).FirstOrDefault();
            if (un == null)
                AddNewUnit();
            else
            {
                LblAddNewUnit.Text = " The Unit ( " + txtNewUnit.Value + " ) Already Exists";
                LblAddNewUnit.Visible = true;
                LblAddNewUnit.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void AddNewUnit()
        {
            try
            {
                if(txtNewUnit.Value == null || txtNewUnit.Value == String.Empty)
                {
                    LblAddNewUnit.Text = "Please Enter The New Unit Name";
                    LblAddNewUnit.Visible = true;
                    LblAddNewUnit.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    Unit u = new Unit();
                    u.UnitName = txtNewUnit.Value;

                    db.Units.Add(u);
                    db.SaveChanges();


                    Logger log = new Logger();
                    log.ActionDate = DateTime.Now;
                    log.ActionType = "New Unit";
                    log.UserName = User.Identity.Name;
                    log.Action = "New Unit ( " + txtNewUnit.Value.ToString() + " ) added Successfully";

                    db.Loggers.Add(log);
                    db.SaveChanges();


                    LblAddNewUnit.Text = "New Unit ( " + txtNewUnit.Value.ToString() + " ) added Successfully";
                    LblAddNewUnit.Visible = true;
                    LblAddNewUnit.ForeColor = System.Drawing.Color.Green;

                    txtNewUnit.Value = "";

    
                }
               
            }
            catch (Exception ex)
            {
                LblAddNewUnit.Text = "Error in Unit Creation , The Error is " + ex.InnerException.Message;
                LblAddNewUnit.Visible = true;
                LblAddNewUnit.ForeColor = System.Drawing.Color.Red;
            }
        }

     
        protected void btnAddnewStore_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (txtNewStore.Value == null || txtNewStore.Value == String.Empty)
                {
                    LbladdNewStore.Text = "Please Enter The New Store Name";
                    LbladdNewStore.Visible = true;
                    LbladdNewStore.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    string st = txtNewStore.Value.ToString();
                    var store = db.Stores.Where(x => x.StoreName == st).FirstOrDefault();
                    if (store != null)
                    {
                        LbladdNewStore.Text = "The Store Name Already Exists";
                        LbladdNewStore.Visible = true;
                        LbladdNewStore.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        NewStore();
                    }
                }
            }
            catch (Exception ex)
            {
                LbladdNewStore.Text = "Error in Store Creation , The Error is " + ex.InnerException.Message;
                LbladdNewStore.Visible = true;
                LbladdNewStore.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void NewStore()
        {
            Store u = new Store();
            u.StoreName = txtNewStore.Value;
            u.IsActive = true;
            
            if (txtStoreLocation.Value == null || txtStoreLocation.Value == String.Empty)
                u.StoreLocation = "";
            else
                u.StoreLocation = txtStoreLocation.Value.ToString();

            db.Stores.Add(u);
            db.SaveChanges();

            var s = db.Stores.Where(x => x.StoreName == txtNewStore.Value.ToString()).FirstOrDefault();
            s.StoreNumber = s.ID;
            db.SaveChanges();

            Logger log = new Logger();
            log.ActionDate = DateTime.Now;
            log.ActionType = "New Store";
            log.UserName = User.Identity.Name;
            log.Action = "New Unit ( " + txtNewStore.Value.ToString() + " ) added Successfully";

            db.Loggers.Add(log);
            db.SaveChanges();


            LbladdNewStore.Text = "New Store ( " + txtNewStore.Value.ToString() + " ) added Successfully";
            LbladdNewStore.Visible = true;
            LbladdNewStore.ForeColor = System.Drawing.Color.Green;

            txtNewStore.Value = "";
        }
    }
}