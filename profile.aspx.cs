using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                using (eCommerceDBEntities context = new eCommerceDBEntities())
                {
                    //Getting user info based on session variable
                    int id = (int)Session["CustomerID"];
                    Customer cust = context.Customers.Where(i => i.CustomerID == id).FirstOrDefault();

                    //Setting page title.
                    Page.Title = "Profile | " + cust.CustomerName;

                    //Setting values from DB
                    txtName.Text = cust.CustomerName;
                    txtUserName.Text = cust.UserName;
                    txtContact.Text = cust.ContactNumber;
                    ddlGender.SelectedValue = cust.sex;
                    txtEmail.Text = cust.email;
                    txtAddress.Text = cust.Address;
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            //Getting user info based on session variable
            int id = (int)Session["CustomerID"];
            Customer cust = context.Customers.Where(i => i.CustomerID == id).FirstOrDefault();

            cust.CustomerName = txtName.Text;
            cust.sex = ddlGender.SelectedValue;
            cust.UserName = txtUserName.Text;
            cust.Address = txtAddress.Text;
            cust.email = txtEmail.Text;
            cust.ContactNumber = txtContact.Text;

            context.SaveChanges();
        }
        lblError.Visible = true;
        lblError.Text = "Details successfully updated";
    }
}