using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminPages_KalaiMarjoiPage : System.Web.UI.Page
{
    public const string StringConnection = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\DbAnbar.mdf;Integrated Security=True;User Instance=True";
    SqlConnection sqlcon = new SqlConnection(StringConnection);


    protected void Page_Load(object sender, EventArgs e)
    {
        ResLabel.Visible = false;
    }

    protected bool UpdateKalaTable(int KalaCode, int AnbarCode, int Num)
    {
        try
        {
            SqlCommand Updatecmd = new SqlCommand();
            Updatecmd.Connection = sqlcon;
            Updatecmd.CommandType = CommandType.Text;
            Updatecmd.CommandText = "Update Kala Set Num=Num+@Num Where Code =@Code And Anbar=@Anbar";
            Updatecmd.Parameters.AddWithValue("@Code", KalaCode);
            Updatecmd.Parameters.AddWithValue("@Anbar", AnbarCode);
            Updatecmd.Parameters.AddWithValue("@Num", Num);


            sqlcon.Open();
            Updatecmd.ExecuteNonQuery();
            sqlcon.Close();
            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            sqlcon.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int kalaCode = Int32.Parse(TBKalaCode.Text);
        int anbarCode = Int32.Parse(TBAnbarCode.Text);
        int num = Int32.Parse(TBNum.Text);
        if (num > 0)
        {
            if (UpdateKalaTable(kalaCode, anbarCode, num))
            {
                SqlCommand Insertcmd = new SqlCommand();
                Insertcmd.Connection = sqlcon;
                Insertcmd.CommandType = CommandType.Text;
                Insertcmd.CommandText = "Insert Into Marjoii (KalaCode,AnbarCode,Date,Num) Values (@KalaCode,@AnbarCode,@Date,@Num) ";
                Insertcmd.Parameters.AddWithValue("@KalaCode", kalaCode);
                Insertcmd.Parameters.AddWithValue("@AnbarCode", anbarCode);
                Insertcmd.Parameters.AddWithValue("@Date", DateTime.Today.Date.ToShortDateString());
                Insertcmd.Parameters.AddWithValue("@Num", num);
                sqlcon.Open();
                Insertcmd.ExecuteNonQuery();
                sqlcon.Close();
                ResLabel.Visible = true;
                ResLabel.Text = "اطلاعات با موفقیت ثبت شد";
            }
            else
            {
                ResLabel.Visible = true;
                ResLabel.Text = "خطا هنگام ثبت کالای مرجوعی";
            }
        }
        else
        {
            // num <= 0
            ResLabel.Visible = true;
            ResLabel.Text = "خطا در تعداد وارد شده";
        }
    }
}
