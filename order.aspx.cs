using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerID"] == null)
        {
            string redirectToURL = "~/order.aspx";
            Response.Redirect("~/login.aspx?redirect=" + redirectToURL);
        }

        if (!IsPostBack)
        {
            //Get logged in id
            int CustID = Convert.ToInt16(Session["CustomerID"]);
            using (eCommerceDBEntities context = new eCommerceDBEntities())
            {
                if (Request.QueryString["addToCart"] != null)
                {
                    int ProdID = Convert.ToInt16(Request.QueryString["addToCart"]);

                    //Check if product is already in cart
                    Cart cr = context.Carts.Where(i => i.ProductID == ProdID).FirstOrDefault();
                    //If not in the DB add it.
                    if (cr == null)
                    {
                        context.Carts.AddObject(new Cart
                        {
                            CustomerID = CustID,
                            ProductID = ProdID,
                            Quantity = 1
                        });
                        context.SaveChanges();
                    }
                }

                var cart = (from c in context.Carts
                            join p in context.Products
                                on c.ProductID equals p.ProductID
                            where c.CustomerID == CustID
                            select new { p.ProductName, p.ProductPrice, p.ProductImageURL, c.CartID });
                Repeater1.DataSource = cart;
                Repeater1.DataBind();

                Boolean isCartEmpty = context.Carts.Where(i=>i.CustomerID == CustID).FirstOrDefault() == null;
                //If cart is empty. No ID label means, no cart item
                if (isCartEmpty)
                {
                    Wizard1.Visible = false;
                    lblMessage.Visible = true;
                }
            }
        }
    }

    protected void lnkRemoveItem_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            //Get the reference of the clicked button.
            LinkButton button = (sender as LinkButton);
            //Get the Repeater Item reference
            RepeaterItem item = button.NamingContainer as RepeaterItem;
            //Get the repeater item index
            int index = item.ItemIndex;
            string id = ((Label)(Repeater1.Items[index].FindControl("lblHiddenCartID"))).Text;
            int cartid = Convert.ToInt16(id);
            Cart cr = context.Carts.Where(i => i.CartID == cartid).FirstOrDefault();

            context.Carts.DeleteObject(cr);
            context.SaveChanges();

            string notifyTitle = "One item removed";
            string message = "One item was removed from your cart!";
            string notification = string.Format("?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);
            
            Response.Redirect("~/order.aspx" + notification);
        }
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Response.Redirect("~/order.aspx");
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            int custID = Convert.ToInt16(Session["CustomerID"]);
            if (string.IsNullOrEmpty(txtAmount.Text))
            {
                lblStatus.Text = "Please select mode of payment Debit/Credit card";
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                List<Cart> cart = context.Carts.Where(i => i.CustomerID == custID).ToList();

                foreach (var i in cart)
                {
                    //Fill order table
                    context.Orders.AddObject(new Order
                    {
                        CustomerID = custID,
                        ProductID = i.ProductID,
                        DateOrdered = DateTime.Now
                    });

                    //Product is bought so, empty the cart.
                    context.Carts.DeleteObject(i);
                }
                context.SaveChanges();

                lblStatus.Text = "Your order has been placed. Happy shopping!";
                lblStatus.ForeColor = System.Drawing.Color.Green;

                string notifyTitle = "Payment Successful!";
                string message = "The order has been placed. You will receive your shipment sonn.";
                string notification = string.Format("?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);

                Response.Redirect("~/order.aspx" + notification);
            }
        }
    }
    protected void rdoDebitCard_CheckedChanged(object sender, EventArgs e)
    {
        addAmount();
        lblStatus.Text = "";
    }

    protected void rdoCredit_CheckedChanged(object sender, EventArgs e)
    {
        addAmount();
        lblStatus.Text = "";
    }
    private void addAmount()
    {
        int CustomerID = Convert.ToInt16(Session["CustomerID"].ToString());
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            var cart = (from c in context.Carts
                        join p in context.Products
                            on c.ProductID equals p.ProductID
                            where c.CustomerID == CustomerID
                        select new { p.ProductPrice, c.Quantity });
            decimal amt = 0;
            foreach (var i in cart)
            {
                amt += (i.ProductPrice * i.Quantity);
            }
            txtAmount.Text = amt.ToString();
        }
    }

}