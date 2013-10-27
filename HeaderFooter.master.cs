using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class HeaderFooter : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["notifyTitle"] != null || Request.QueryString["notificationDescription"] != null)
        {
            string title = Request.QueryString["notifyTitle"];
            string message = Request.QueryString["notificationDescription"];
            string jsFunction = string.Format("showNotification('{0}','{1}')",title,message);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "notify", jsFunction, true);
        }
        
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            //Check if some user is logged in.
            if (Session["CustomerID"] != null)
            {
                //Getting user info based on session variable
                int id = (int)Session["CustomerID"];
                Customer cust = context.Customers.Where(i => i.CustomerID == id).FirstOrDefault();
                //Change the links
                lnkLogInLogOut.Text = "Logout";
                lnkLogInLogOut.PostBackUrl = "logout.aspx";

                lnkSignUpProfile.Text = "Welcome: " + cust.CustomerName;
                lnkSignUpProfile.PostBackUrl = "~/profile.aspx?CustomerID=" + cust.CustomerID;


                //Update Cart count
                var cart = (from c in context.Carts
                            join p in context.Products
                                on c.ProductID equals p.ProductID
                                where c.CustomerID==id
                            select new { p.ProductName, p.ProductPrice, p.ProductImageURL });
                lblCartCount.Text = cart.Count().ToString();
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/search.aspx?product=" + txtSearch.Text);
    }


}
