using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "eCommerce | Signup";
        if (Session["CustomerID"] != null)
            Response.Redirect("home.aspx");
    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            //New user object created from the information in the webform.
            Customer newUser = new Customer()
            {
                CustomerName = txtName.Text,
                sex = ddlGender.SelectedValue,
                UserName = txtUserName.Text,
                Password = txtPassword.Text,
                Address = txtAddress.Text,
                email = txtEmail.Text,
                ContactNumber = txtContact.Text,
                UserType = "customer"
            };

            //Lookup if a user with the given username or email already exists in DB.
            Customer cust = context.Customers.Where(i => i.UserName == newUser.UserName
               || i.email == newUser.email).FirstOrDefault();
           
            //If user is found, show error, else add new user.
            if (cust != null)
            {
                lblError.Text = "A user with that Email ID or UserName already exists.";
                lblError.Visible = true;
            }
            else
            {
                //Add new user to the customers' context
                context.Customers.AddObject(newUser);
                //Save new user in the database.
                context.SaveChanges();

                //Send user to loginpage
                Response.Redirect("login.aspx");
            }
            

        }
    }
}