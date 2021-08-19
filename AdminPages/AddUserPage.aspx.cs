using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminPages_AddUserPage : System.Web.UI.Page
{
    public string StringConnection = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\DbAnbar.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorLabel.Visible = false;
        SuccessLabel.Visible = false;
    }
    private bool AddUser(string ID, string Pass, bool IsAdmin)
    {
        try
        {
            SqlConnection sqlcon = new SqlConnection(StringConnection);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlcon;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Insert Into Users (ID,Pass,IsAdmin) Values (@ID,@Pass,@IsAdmin)";
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Pass", Pass);
            cmd.Parameters.AddWithValue("@IsAdmin", IsAdmin);
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
    protected void BtnReg_Click(object sender, EventArgs e)
    {
        bool t;
        if (RBAdmin.Checked)
            t = true;
        else
            t = false;
        if (AddUser(TboxUserName.Text, TBoxPass.Text, t))
        {
            SuccessLabel.Visible = true;
        }
        else
        {
            ErrorLabel.Visible = true;
        }
    }
}
