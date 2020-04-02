using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SmartSystem
{
    public partial class Customers : System.Web.UI.Page
    {
        Entities db = new Entities();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Roles.IsUserInRole(User.Identity.Name, "Management"))
            {
                //    Logger log = new Logger();
                //    log.ActionDate = DateTime.Now;
                //    log.ActionType = "Authorization";
                //    log.UserName = User.Identity.Name;
                //    log.Action = "User tried to access Customers Master Data Page";

                //    db.Loggers.Add(log);
                //    db.SaveChanges();
                //    Response.Redirect("Unauthorized.aspx");
            }
 
        }

        protected void btnAddNewCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                if (customername.Value == string.Empty || customername.Value == null || customernumber.Value == null)
                {
                    LblError.Text = "Please enter customer number and customer name. ";
                    LblError.Visible = true;
                    LblError.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    int custno = Convert.ToInt32(customernumber.Value);
                    var customers = db.Customers.ToList();
                    var cust = db.Customers.Where(x => x.CustomerNumber == custno).FirstOrDefault();
                    if ( cust != null)
                    {
                        LblError.Text = "The Customer Number already Exists";
                        LblError.Visible = true;
                        LblError.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {

                        Customer CS = new Customer();
                        CS.CustomerNumber = Convert.ToInt32(customernumber.Value);
                        CS.CustomerName = customername.Value;
                        if (phonenumber.Value == "")
                        {
                            phonenumber.Value = "0";
                        }
                        else
                        {
                            CS.PhoneNumber = Convert.ToInt32(phonenumber.Value);
                        }
                        CS.IsLocked = false;
                        CS.CreationDate = DateTime.Now;
                        CS.CreationUser = User.Identity.Name;
                        CS.CreditLimitAmount = 0;
                        CS.Address = customeraddress.Value;
                        CS.IsActive = false;
                        CS.EmailAddress = customeremail.Value;
                        CS.ContactPerson = contactperson.Value;

                        db.Customers.Add(CS);
                        db.SaveChanges();

                        LblError.Text = "The New Customer is created Successfully";
                        LblError.Visible = true;
                        LblError.ForeColor = System.Drawing.Color.Green;

                        customernumber.Value = "";
                        customername.Value = "";
                        phonenumber.Value = "";
                        customeraddress.Value = "";
                        contactperson.Value = "";
                        customeremail.Value = "";

                    }
                }
            }


            catch (Exception ex)
            {
                LblError.Text = "Error In Customer Creation , The Error is " + ex.InnerException.InnerException.Message;
                LblError.Visible = true;
                LblError.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}