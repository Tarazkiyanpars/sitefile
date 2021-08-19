using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminPages_NewAnbarPage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorLabel.Visible = false;
    }

    private bool AddAnabr(string Name, string Admin)
    {
        try
        {
            string StringConnection = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\DbAnbar.mdf;Integrated Security=True;User Instance=True";
            SqlConnection sqlcon = new SqlConnection(StringConnection);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlcon;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Insert Into AnbarList (Name,Admin) Values (@Name,@Admin)";
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Admin", Admin);
            sqlcon.Open();
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            return true;
        }
        catch
        {
            return false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (AddAnabr(TBoxAnbarName.Text, DDLAnbarAdmin.Text))
        {
            //Response.Redirect("");
        }
        else
        {
            ErrorLabel.Visible = true;
        }
    }
}
