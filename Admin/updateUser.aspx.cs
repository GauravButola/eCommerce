using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class Admin_updateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLoad_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            Customer cust = context.Customers.Where(i => i.UserName.Contains(txtUserName.Text)).FirstOrDefault();

            txtName.Enabled = true;
            txtEmail.Enabled = true;
            txtContact.Enabled = true;
            txtAddress.Enabled = true;
            ddlGender.Enabled = true;
            txtPassword.Enabled = true;
            ddlUserType.Enabled = true;

            txtUserName.Text = cust.UserName;
            txtName.Text = cust.CustomerName;
            txtEmail.Text = cust.email;
            txtContact.Text = cust.ContactNumber;
            txtAddress.Text = cust.Address;
            txtPassword.Text = cust.Password;
            ddlGender.SelectedValue = cust.sex;
            ddlUserType.SelectedValue = cust.UserType;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            Customer cust = context.Customers.Where(i => i.UserName==txtUserName.Text).FirstOrDefault();

            cust.CustomerName = txtName.Text;
            cust.email = txtEmail.Text;
            cust.ContactNumber = txtContact.Text;
            cust.Address = txtAddress.Text;
            cust.Password = txtPassword.Text;
            cust.sex = ddlGender.SelectedValue;
            cust.UserType = ddlUserType.SelectedValue;

            context.SaveChanges();
        }

    }
}