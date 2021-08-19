using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USER"] != null)
            UserIDLbl.Text = Session["USER"].ToString();
        else
            Response.Redirect("..\\Pages\\Default.aspx");
    }
}
