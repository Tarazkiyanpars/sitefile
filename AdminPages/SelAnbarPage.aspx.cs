using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminPages_SelAnbarPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string AnbarCode = Request.QueryString["SelAnbar"];
            Session.Add("AnbarCode", AnbarCode);

            string StringConnection = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\DbAnbar.mdf;Integrated Security=True;User Instance=True";
            SqlConnection sqlcon = new SqlConnection(StringConnection);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlcon;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select Name From AnbarList Where Code = @Code ";
            cmd.Parameters.AddWithValue("@Code", AnbarCode);
            sqlcon.Open();
            string AnbarName = cmd.ExecuteScalar().ToString();
            sqlcon.Close();
            AnbarNameLbl.Text = AnbarName;
            AnbarCodeLbl.Text = AnbarCode.ToString();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.PageIndex = GridView1.SelectedIndex;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }
}
