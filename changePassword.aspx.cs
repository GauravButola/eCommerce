using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class changePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Change Password";
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            //Getting user info based on session variable
            int id = (int)Session["CustomerID"];
            Customer cust = context.Customers.Where(i => i.CustomerID == id).FirstOrDefault();

            cust.Password = txtPassword.Text;
            context.SaveChanges();
        }
        lblError.Visible = true;
        lblError.Text = "Password successfully updated";
    }
}