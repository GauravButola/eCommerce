using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Get the lookup string form URL
            string lookup = Request.QueryString["product"];
            string category = Request.QueryString["category"];

            Page.Title = "Search: " + lookup;

            //Keeping the lookup string in searchbar for ease of use
            ((TextBox)this.Page.Master.FindControl("txtSearch")).Text = lookup;

            using (eCommerceDBEntities context = new eCommerceDBEntities())
            {
                //Running %like query on 2 fields to get best results from DB
                List<Product> pr = context.Products.Where(i => i.ProductName.Contains(lookup) ||
                    i.ProductDescription.Contains(lookup)
                    ).ToList();

                var lq = (from p in context.Products
                          join c in context.Categories
                          on p.CategoryID equals c.CategoryID
                          where (string.IsNullOrEmpty(category) ? true : c.CategoryName == category) &&
                                (string.IsNullOrEmpty(lookup)? true : p.ProductName.Contains(lookup) || p.ProductDescription.Contains(lookup))
                          select p).ToList();

                Repeater1.DataSource = lq;
                Repeater1.DataBind();
            }

        }
    }
}