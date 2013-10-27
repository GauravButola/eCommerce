using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "eCommerce | Login";
        if (Session["CustomerID"] != null)
        {
            string notifyTitle = "Already logged in";
            string message = "You can't access login page when you are logged in.";
            string notification = string.Format("?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);
            Response.Redirect("home.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            //Check if there's any user who has the given username and password
            Customer cust = context.Customers.Where(i => i.UserName == txtUserName.Text &&
                i.Password == txtPassword.Text).FirstOrDefault();

            if (cust == null)
            {
                //User not found
                lblError.Text = "Wrong username or password";
                lblError.Visible = true;
            }
            else
            {
                //Create a session for user
                Session["CustomerID"] = cust.CustomerID;

                string notifyTitle = "Welcome!";
                string message = "You have been successfully logged in. Happy shopping!";
                string notification = string.Format("?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);

                //If user is requesting a redirect.
                string redirectToURL =  Request.QueryString["redirect"];
                if(string.IsNullOrEmpty(redirectToURL))
                {
                    Response.Redirect("~/home.aspx" + notification);
                }
                else
                    Response.Redirect(redirectToURL);
            }
        }
    }
}