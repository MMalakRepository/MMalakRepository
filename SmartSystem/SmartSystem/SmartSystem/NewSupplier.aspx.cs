using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartSystem
{
    public partial class NewSupplier : System.Web.UI.Page
    {
        Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Roles.IsUserInRole(User.Identity.Name, "Management") &&
               !Roles.IsUserInRole(User.Identity.Name, "SystemAdmin"))
            {
                Logger log = new Logger();
                log.ActionDate = DateTime.Now;
                log.ActionType = "Authorization";
                log.UserName = User.Identity.Name;
                log.Action = "User tried to access New Supplier Data Page";
                db.Loggers.Add(log);
                db.SaveChanges();

                Response.Redirect("Unauthorized.aspx");
            }
        }

        protected void btnAddNewSupplier_Click(object sender, EventArgs e)
        {
            var sup = db.Suppliers.Where(x => x.Name == Suppliername.Value).FirstOrDefault();
            if (sup == null)
                AddNewSupplier();
            else
            {
                LblError.Text = "The Supplier ( " + Suppliername.Value + " ) Already Exists";
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void AddNewSupplier()
        {

            try
            {
                if (Suppliername.Value == "" || Suppliername.Value == string.Empty)
                {
                    LblError.Text = "Please Enter Supplier Name.";
                    LblError.Visible = true;
                    LblError.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    Supplier S = new Supplier();
                    S.Address = Supplieraddress.Value;
                    S.ContactPerson = contactperson.Value;
                    S.Country = suppliercountry.Value;
                    S.EmailAddress = Supplieremail.Value;
                    S.IsActive = true;
                    S.Name = Suppliername.Value;

                    db.Suppliers.Add(S);
                    db.SaveChanges();

                    LblError.Text = "New Supplier ( " + Suppliername.Value.ToString() + " ) Added Successfully";
                    LblError.Visible = true;
                    LblError.ForeColor = System.Drawing.Color.Green;

                    Supplieraddress.Value = "";
                    contactperson.Value = "";
                    suppliercountry.Value = "";
                    Supplieremail.Value = "";
                    Suppliername.Value = "";

                    Logger log = new Logger();
                    log.Action = "New Supplier " + Suppliername.Value.ToString() +" Created Successfully";
                    log.UserName = User.Identity.Name;
                    log.ActionDate = DateTime.Now;
                    log.ActionType = "New Supplier";

                    db.Loggers.Add(log);
                    db.SaveChanges();
                }


            }
            catch (Exception ex)
            {
                LblError.Text = "Error in Supplier Creation , Contact System Administrator , " + ex.InnerException.Message;
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}