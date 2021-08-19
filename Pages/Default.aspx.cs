using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Pages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorLabel.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string StringConnection = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\DbAnbar.mdf;Integrated Security=True;User Instance=True";
        SqlConnection conn = new SqlConnection(StringConnection);
        SqlCommand sc = new SqlCommand("select ID,Pass,IsAdmin From Users Where ID =@ID and Pass=@Pass", conn);
        sc.Parameters.AddWithValue("@ID", TBUserName.Text);
        sc.Parameters.AddWithValue("@Pass", TBPass.Text);
        conn.Open();
        SqlDataReader dr = sc.ExecuteReader();

        if (dr.Read())
        {
            if (Convert.ToBoolean(dr["IsAdmin"]) == true)
            {
                //go to the admin page
                Session.Add("USER", TBUserName.Text);
                Response.Redirect("../AdminPages/AdminDefaultPage.aspx");
            }
            else
            {
                //go to the user page
                Session.Add("USER", TBUserName.Text);
                Response.Redirect("../UserPages/UserDefaultPage.aspx");
            }
        }
        else
        {
            ErrorLabel.Visible = true;
            return;
        }
        conn.Close();
    }
    protected void TBUserName_TextChanged(object sender, EventArgs e)
    {

    }
}
