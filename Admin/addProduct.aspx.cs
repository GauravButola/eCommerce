using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class Admin_addProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using(eCommerceDBEntities context = new eCommerceDBEntities())
            {
                List<Category> ct = context.Categories.ToList();
                ddlCategory.DataSource = ct ;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            //Save the file on server's folder kepping the original filename
            flImageUpload.SaveAs(Server.MapPath(@"~\Site_data\product_images\" + flImageUpload.FileName));

            Product pr = new Product 
            {
                ProductName = txtName.Text,
                ProductDescription = txtDescription.Text,
                ProductPrice = Convert.ToDecimal(txtPrice.Text),
                ProductImageURL = @"~\Site_data\product_images\" + flImageUpload.FileName,
                Discount = Convert.ToInt16(string.IsNullOrEmpty(txtDiscount.Text) ? "0" : txtDiscount.Text),
                CategoryID = Convert.ToInt16(ddlCategory.SelectedValue)
            };

            using(eCommerceDBEntities context = new eCommerceDBEntities())
            {
                context.Products.AddObject(pr);
                context.SaveChanges();
            }

            lblStatus.Text = "Product successfully uploaded.";
            lblStatus.ForeColor = System.Drawing.Color.Green;
            hlAddFeature.NavigateUrl = "~/Admin/addFeatures.aspx?ProductID=" + pr.ProductID;
        }
        catch (System.IO.DirectoryNotFoundException ex)
        {
            lblStatus.ForeColor= System.Drawing.Color.Red;
            lblStatus.Text = "Select an image first";
        }
    }
}