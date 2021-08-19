using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminPages_KhrojKalaPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ResLabel.Visible = false;
    }
    protected void RegBtn_Click(object sender, EventArgs e)
    {
        DetailsViewRow footerRow = DetailsView1.FooterRow;
        TextBox NumOfKalaTBox = (TextBox)footerRow.Cells[0].FindControl("NumTBox");
        int InputNumOfKala = Convert.ToInt32(NumOfKalaTBox.Text);

        if (InputNumOfKala > 0)
        {
            GridViewRow rowView;
            rowView = GridView1.Rows[GridView1.SelectedIndex];
            int KalaCode = Int32.Parse(rowView.Cells[1].Text);
            int AnbarCode = Int32.Parse(rowView.Cells[2].Text);

            string StringConnection = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\DbAnbar.mdf;Integrated Security=True;User Instance=True";
            SqlConnection sqlcon = new SqlConnection(StringConnection);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlcon;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select Num From Kala Where Code = @Code ";
            cmd.Parameters.AddWithValue("@Code", KalaCode);
            sqlcon.Open();
            int NumOfKala = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            sqlcon.Close();
            if (InputNumOfKala <= NumOfKala)
            {
                SqlCommand Insertcmd = new SqlCommand();
                Insertcmd.Connection = sqlcon;
                Insertcmd.CommandType = CommandType.Text;
                Insertcmd.CommandText = "Insert Into KhrojKala (KalaCode,AnbarCode,Date,Num) Values (@KalaCode,@AnbarCode,@Date,@Num) ";
                Insertcmd.Parameters.AddWithValue("@KalaCode", KalaCode);
                Insertcmd.Parameters.AddWithValue("@AnbarCode", AnbarCode);
                Insertcmd.Parameters.AddWithValue("@Date", DateTime.Today.Date.ToShortDateString());
                Insertcmd.Parameters.AddWithValue("@Num", InputNumOfKala);

                SqlCommand Updatecmd = new SqlCommand();
                Updatecmd.Connection = sqlcon;
                Updatecmd.CommandType = CommandType.Text;
                Updatecmd.CommandText = "Update Kala Set Num=@Num Where Code =@Code And Anbar=@Anbar";
                Updatecmd.Parameters.AddWithValue("@Code", KalaCode);
                Updatecmd.Parameters.AddWithValue("@Anbar", AnbarCode);
                Updatecmd.Parameters.AddWithValue("@Num", NumOfKala - InputNumOfKala);


                sqlcon.Open();
                Insertcmd.ExecuteNonQuery();
                Updatecmd.ExecuteNonQuery();
                sqlcon.Close();
                ResLabel.Visible = true;
                ResLabel.Text = "ثبت با موفقیت صورت گرفت";
            }
            else if (InputNumOfKala > NumOfKala)
            {
                ResLabel.Visible = true;
                ResLabel.Text = "تعداد وارد شده بیشتر از تعداد موجود است";
            }
        }
        else
        {
            //num <= 0
            ResLabel.Visible = true;
            ResLabel.Text = "تعداد وارد شده اشتباه است";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.PageIndex = GridView1.SelectedIndex;
    }
}
