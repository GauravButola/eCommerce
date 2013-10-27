using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id = Convert.ToInt16(Request.QueryString["ProductID"]);
            ViewState["prodid"] = id;
            using (eCommerceDBEntities context = new eCommerceDBEntities())
            {
                if (Session["CustomerID"] == null)
                {
                    Panel1.Enabled = false;
                }
                Product pr = context.Products.Where(i => i.ProductID == id).FirstOrDefault();
                lblName.Text = pr.ProductName;
                lblPrice.Text += pr.ProductPrice.ToString();
                lblDescription.Text = pr.ProductDescription;
                imgProductImage.ImageUrl = pr.ProductImageURL;

                //Setting page title
                Page.Title = pr.ProductName;

                //Joing feature tables to show data on datagrid
                var lq = (from f in context.Features
                          join mf in context.MetaFeatures
                              on f.MetaFeatureID equals mf.MetaFeatureID
                          where f.ProductID == id
                          select new { Feature = mf.FeatureName, Description = f.FeatureDescription }).ToList();

                GridView1.DataSource = lq;
                GridView1.DataBind();

                //Populating reviews
                var review = (from r in context.Reviews
                              where r.ProductID == id
                              join c in context.Customers
                                  on r.CustomerID equals c.CustomerID
                              select new { 
                                r.ReviewDate,
                                r.ReviewTitle,
                                r.ReviewDescription,
                                r.Rating,
                                c.CustomerName
                              });
                Repeater1.DataSource = review;
                Repeater1.DataBind();

            }
        }
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        string notifyTitle = "Added to cart";
        string message = "One new item has been added to your cart.";
        string notification = string.Format("&?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);

        if (Session["CustomerID"] == null)
        {
            string redirectToURL = "~/order.aspx?addToCart=";
            string ProductID = Request.QueryString["ProductID"];
            Response.Redirect("~/login.aspx?redirect=" + redirectToURL + ProductID);
        }
        else
        {
            string ProductID = Request.QueryString["ProductID"];
            Response.Redirect("~/order.aspx?addToCart=" + ProductID + notification);
        }
    }
    protected void btnPost_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            if (Session["CustomerID"] != null)
            {
                int CustID = Convert.ToInt16(Session["CustomerID"].ToString());
                int ProdID = Convert.ToInt16(Request.QueryString["ProductID"]);

                Review rv = new Review()
                {
                    ReviewTitle = txtReviewTitle.Text,
                    ReviewDescription = txtReviewDetail.Text,
                    CustomerID = CustID,
                    ProductID = ProdID,
                    Rating = Convert.ToInt16(ddlRatings.SelectedValue),
                    ReviewDate = DateTime.Now
                };

                context.Reviews.AddObject(rv);
                context.SaveChanges();

                string notifyTitle = "Review added";
                string message = "Your review has been posted on the product page. Thanks for helping others.";
                string notification = string.Format("?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);
            
                Response.Redirect("~/product.aspx?ProductID=" + ViewState["prodid"].ToString() + "&" + notification);
            }
        }
    }
}