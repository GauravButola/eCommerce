using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string notifyTitle = "Logged out";
        string message = "You have been logged out";
        string notification = string.Format("?notifyTitle={0}&notificationDescription={1}", notifyTitle, message);
            
        Session.Abandon();
        Response.Redirect("home.aspx" + notification);
    }
}