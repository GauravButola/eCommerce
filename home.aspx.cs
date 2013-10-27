using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Populating Mobile category
            //Instantiating the entity class to access DB tables
            using (eCommerceDBEntities context = new eCommerceDBEntities())
            {
                //Query the DB for products which are mobile i.e. CategoryID == 1
                List<Product> pr = context.Products.Where(i => i.CategoryID == 1).ToList();

                //At first launch, fill fields with first rowMobile i.e. pr[0]
                lblPrice.Text = pr[0].ProductPrice.ToString();
                lnkProductTitle.Text = pr[0].ProductName;
                lnkProductTitle.NavigateUrl = "product.aspx?ProductID=" + pr[0].ProductID;
                lnkImageLinkTo.NavigateUrl = lnkProductTitle.NavigateUrl;
                imgProduct.ImageUrl = pr[0].ProductImageURL;
                lnkOrder.NavigateUrl = lnkProductTitle.NavigateUrl;

                //Store returned rowMobile in viewstate for it to persist, to be used later.
                ViewState["rowMobile"] = 0;

                //Populating Books category
                //Query the DB for products which are books i.e. CategoryID == 4
                List<Product> books = context.Products.Where(i => i.CategoryID == 4).ToList();
                //At first launch, fill fields with first row i.e. pr[0]
                lblBookPrice.Text = books[0].ProductPrice.ToString();
                lnkBookTitle.Text = books[0].ProductName;
                lnkBookTitle.NavigateUrl = "product.aspx?ProductID=" + books[0].ProductID;
                lnkImageLinkToBook.NavigateUrl = lnkBookTitle.NavigateUrl;
                imgProductBook.ImageUrl = books[0].ProductImageURL;
                lnkBookOrder.NavigateUrl = lnkBookTitle.NavigateUrl;

                //Store returned rowBook in viewstate for it to persist, to be used later.
                ViewState["rowBooks"] = 0;

                //Populating Clothes category
                //Query the DB for products which are clothes i.e. CategoryID == 3
                List<Product> clothes = context.Products.Where(i => i.CategoryID == 3).ToList();
                //At first launch, fill fields with first row i.e. pr[0]
                lblClothesPrice.Text = clothes[0].ProductPrice.ToString();
                lnkClothesTitle.Text = clothes[0].ProductName;
                lnkClothesTitle.NavigateUrl = "product.aspx?ProductID=" + clothes[0].ProductID;
                lnkImageLinkToClothes.NavigateUrl = lnkClothesTitle.NavigateUrl;
                imgProductClothes.ImageUrl = clothes[0].ProductImageURL;
                lnkClothesOrder.NavigateUrl = lnkClothesTitle.NavigateUrl;

                //Store returned rowBook in viewstate for it to persist, to be used later.
                ViewState["rowClothes"] = 0;
            }

        }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        //Enable prev button if it's disabled.
        if (btnPrev.Enabled == false)
            btnPrev.Enabled = true;
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            List<Product> pr = context.Products.Where(p => p.CategoryID == 1).ToList();
            int i = (int)ViewState["rowMobile"];

            //Get the next rowMobile 
            i++;
            try
            {
                lblPrice.Text = pr[i].ProductPrice.ToString();
                lnkProductTitle.Text = pr[i].ProductName;
                lnkProductTitle.NavigateUrl = "product.aspx?ProductID=" + pr[i].ProductID;
                lnkImageLinkTo.NavigateUrl = lnkProductTitle.NavigateUrl;
                imgProduct.ImageUrl = pr[i].ProductImageURL;
                lnkOrder.NavigateUrl = lnkProductTitle.NavigateUrl;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //There aren't anymore rowMobiles so, disable further action.
                btnNext.Enabled = false;
                i--;
            }

            //Updating viewstate for next use.
            ViewState["rowMobile"] = i;
        }
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        //Enable next button if it's disabled.
        if (btnNext.Enabled == false)
            btnNext.Enabled = true;
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            List<Product> pr = context.Products.Where(p => p.CategoryID == 1).ToList();

            int i = (int)ViewState["rowMobile"];
            //Get the next rowMobile 
            i--;
            try
            {
                lblPrice.Text = pr[i].ProductPrice.ToString();
                lnkProductTitle.Text = pr[i].ProductName;
                lnkProductTitle.NavigateUrl = "product.aspx?ProductID=" + pr[i].ProductID;
                lnkImageLinkTo.NavigateUrl = lnkProductTitle.NavigateUrl;
                imgProduct.ImageUrl = pr[i].ProductImageURL;
                lnkOrder.NavigateUrl = lnkProductTitle.NavigateUrl;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //There aren't anymore rowMobiles so, disable further action.
                btnPrev.Enabled = false;
                i++;
            }

            //Updating viewstate for next use.
            ViewState["rowMobile"] = i;
            
        }
    }

    protected void btnNextBook_Click(object sender, EventArgs e)
    {
        //Enable prev button if it's disabled.
        if (btnPrevBook.Enabled == false)
            btnPrevBook.Enabled = true;
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            List<Product> books = context.Products.Where(p => p.CategoryID == 4).ToList();
            int i = (int)ViewState["rowBooks"];

            //Get the next row 
            i++;
            try
            {
                lblBookPrice.Text = books[i].ProductPrice.ToString();
                lnkBookTitle.Text = books[i].ProductName;
                lnkBookTitle.NavigateUrl = "product.aspx?ProductID=" + books[i].ProductID;
                lnkImageLinkToBook.NavigateUrl = lnkBookTitle.NavigateUrl;
                imgProductBook.ImageUrl = books[i].ProductImageURL;
                lnkBookOrder.NavigateUrl = lnkBookTitle.NavigateUrl;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //There aren't anymore rows so, disable further action.
                btnNextBook.Enabled = false;
                i--;
            }

            //Updating viewstate for next use.
            ViewState["rowBooks"] = i;
        }
    }

    protected void btnPrevBook_Click(object sender, EventArgs e)
    {
        //Enable prev button if it's disabled.
        if (btnNextBook.Enabled == false)
            btnNextBook.Enabled = true;
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            List<Product> books = context.Products.Where(p => p.CategoryID == 4).ToList();
            int i = (int)ViewState["rowBooks"];

            //Get the next row Books 
            i--;
            try
            {
                lblBookPrice.Text = books[i].ProductPrice.ToString();
                lnkBookTitle.Text = books[i].ProductName;
                lnkBookTitle.NavigateUrl = "product.aspx?ProductID=" + books[i].ProductID;
                lnkImageLinkToBook.NavigateUrl = lnkBookTitle.NavigateUrl;
                imgProductBook.ImageUrl = books[i].ProductImageURL;
                lnkBookOrder.NavigateUrl = lnkBookTitle.NavigateUrl;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //There aren't anymore rows so, disable further action.
                btnPrevBook.Enabled = false;
                i++;
            }

            //Updating viewstate for next use.
            ViewState["rowBooks"] = i;
        }
    }
    protected void btnClothesNext_Click(object sender, EventArgs e)
    {
        //Enable prev button if it's disabled.
        if (btnClothesPrev.Enabled == false)
            btnClothesPrev.Enabled = true;
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            List<Product> clothes = context.Products.Where(p => p.CategoryID == 3).ToList();
            int i = (int)ViewState["rowClothes"];

            //Get the next row 
            i++;
            try
            {
                lblClothesPrice.Text = clothes[i].ProductPrice.ToString();
                lnkClothesTitle.Text = clothes[i].ProductName;
                lnkClothesTitle.NavigateUrl = "product.aspx?ProductID=" + clothes[i].ProductID;
                lnkImageLinkToClothes.NavigateUrl = lnkClothesTitle.NavigateUrl;
                imgProductClothes.ImageUrl = clothes[i].ProductImageURL;
                lnkClothesOrder.NavigateUrl = lnkClothesTitle.NavigateUrl;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //There aren't anymore rows so, disable further action.
                btnClothesNext.Enabled = false;
                i--;
            }

            //Updating viewstate for next use.
            ViewState["rowClothes"] = i;
        }
    }
    protected void btnClothesPrev_Click(object sender, EventArgs e)
    {
        //Enable prev button if it's disabled.
        if (btnClothesNext.Enabled == false)
            btnClothesNext.Enabled = true;
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            List<Product> clothes = context.Products.Where(p => p.CategoryID == 3).ToList();
            int i = (int)ViewState["rowClothes"];

            //Get the next row 
            i--;
            try
            {
                lblClothesPrice.Text = clothes[i].ProductPrice.ToString();
                lnkClothesTitle.Text = clothes[i].ProductName;
                lnkClothesTitle.NavigateUrl = "product.aspx?ProductID=" + clothes[i].ProductID;
                lnkImageLinkToBook.NavigateUrl = lnkClothesTitle.NavigateUrl;
                imgProductClothes.ImageUrl = clothes[i].ProductImageURL;
                lnkClothesOrder.NavigateUrl = lnkClothesTitle.NavigateUrl;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                //There aren't anymore rows so, disable further action.
                btnClothesPrev.Enabled = false;
                i++;
            }
                
            //Updating viewstate for next use.
            ViewState["rowClothes"] = i;
        }
    }
}