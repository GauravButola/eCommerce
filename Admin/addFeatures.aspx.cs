using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eCommerceDBModel;

public partial class Admin_addFeatures : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtProductID.Text =  Request.QueryString["ProductID"];

            //Fill the list from table
            using (eCommerceDBEntities context = new eCommerceDBEntities())
            {
                List<MetaFeature> mf = context.MetaFeatures.ToList();
                ddlFeatureName.DataSource = mf;
                ddlFeatureName.DataTextField = "FeatureName";
                ddlFeatureName.DataValueField = "MetaFeatureID";
                ddlFeatureName.DataBind();
            }
        }
    }
    protected void rdoChooseFeature_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Enable or disable dropdownlist and/or textbox based on context
        if (rdoChooseFeature.SelectedValue == "1")
        {
            ddlFeatureName.Visible = true;
            txtFeatureName.Visible = false;
            txtBoxFeatureValue.Enabled = true;
        }
        else if (rdoChooseFeature.SelectedValue == "2")
        {
            ddlFeatureName.Visible = false;
            txtFeatureName.Visible = true;
            txtBoxFeatureValue.Enabled = true;
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (eCommerceDBEntities context = new eCommerceDBEntities())
        {
            if (rdoChooseFeature.SelectedValue == "1")
            {
                Feature fr = new Feature()
                {
                    MetaFeatureID = Convert.ToInt16(ddlFeatureName.SelectedValue),
                    ProductID = Convert.ToInt16(txtProductID.Text),
                    FeatureDescription = txtBoxFeatureValue.Text
                };
                context.Features.AddObject(fr);
            }
            else if (rdoChooseFeature.SelectedValue == "2")
            {
                //Show error on empty textbox
                if (string.IsNullOrEmpty(txtFeatureName.Text))
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = "Please add a feature name.";
                }
                else
                {
                    //Check if the feature already exists
                    MetaFeature mr = context.MetaFeatures.Where(i => i.FeatureName == txtFeatureName.Text).FirstOrDefault();
                    int id;
                    //If not found, create new row
                    if (mr == null)
                    {
                        MetaFeature mfr = new MetaFeature()
                        {
                            FeatureName = txtFeatureName.Text
                        };

                        context.MetaFeatures.AddObject(mfr);
                        context.SaveChanges();
                        //get the ID which is just created
                        id = mfr.MetaFeatureID;

                        Feature fr = new Feature()
                        {
                            MetaFeatureID = id,
                            ProductID = Convert.ToInt16(txtProductID.Text),
                            FeatureDescription = txtBoxFeatureValue.Text
                        };
                        context.Features.AddObject(fr);
                    }
                    //if found, update row.
                    else
                    {
                        id = mr.MetaFeatureID;
                        Feature fUpdate = context.Features.Where(i => i.MetaFeatureID == id).FirstOrDefault();
                        fUpdate.FeatureDescription = txtBoxFeatureValue.Text;
                     }
                }
            }
            context.SaveChanges();
            lblStatus.ForeColor = System.Drawing.Color.Green;
            lblStatus.Text = "Feature added successfully. You can add more!";       
        }
    }
}