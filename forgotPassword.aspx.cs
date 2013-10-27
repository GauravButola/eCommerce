using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;
using System.Net.Mail;

public partial class forgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnPasswordRecover_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            Customer cust = context.Customers.Where(i => i.email==txtEmail.Text).FirstOrDefault();
            if (cust == null)
            {
                string title = "User ID not found";
                string message = "No user found with the given email ID. Please provide the email ID you signed up with.";
                string jsFunction = string.Format("showNotification('{0}','{1}')", title, message);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "notify", jsFunction, true);
            }
            else
            {
                string email = cust.email;
                string password = cust.Password;
                MailMessage mail = new MailMessage("webmaster@eCommerce.com", email);
                mail.Subject = "Password for your eCommerce ID";
                mail.Body = "Your password for eCommerce is : " + password;
                mail.IsBodyHtml = false;

                SmtpClient smp = new SmtpClient();
                //smp.Send(mail);

                string title = "Password sent!";
                string message = "Your password has been sent to " + email;
                string jsFunction = string.Format("showNotification('{0}','{1}')", title, message);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "notify", jsFunction, true);
            }
        }
    }
}