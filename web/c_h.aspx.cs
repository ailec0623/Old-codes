using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class c_h : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Click(object sender, EventArgs e)
    {
        string hn = TextBox1.Text;
        int hid = 0;
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("INSERT INTO HomeWork(hname, TID, StDate,TScore) VALUES (@hn, @tid, getdate(),@ts )");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@hn", hn);
        SqlParameter sqlpara2 = new SqlParameter("@tid", Session["userID"]);
        SqlParameter sqlpara3 = new SqlParameter("@ts",Convert.ToString(Convert.ToInt32(TextBox7.Text)+ Convert.ToInt32(TextBox8.Text) + Convert.ToInt32(TextBox9.Text) + Convert.ToInt32(TextBox10.Text) + Convert.ToInt32(TextBox11.Text)));
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();                                   //create new homework

        con.Close();
        cmd = new SqlCommand("SELECT * FROM HomeWork WHERE hname = @hn");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@hn", hn);
        cmd.Parameters.Add(sqlpara1);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.Read())
        {
            hid = Convert.ToInt32(data["HID"]);
        }
        con.Close();
        cmd = new SqlCommand("INSERT INTO Questions(HID, describe, Score) VALUES (@hid,@d,@s)");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@hid", hid);
        sqlpara2 = new SqlParameter("@d", TextBox2.Text);
        sqlpara3 = new SqlParameter("@s", TextBox7.Text);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();                                //create  new question for a homework

        con.Close();
        cmd = new SqlCommand("INSERT INTO Questions(HID, describe, Score) VALUES (@hid,@d,@s)");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@hid", hid);
        sqlpara2 = new SqlParameter("@d", TextBox3.Text);
        sqlpara3 = new SqlParameter("@s", TextBox8.Text);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        cmd = new SqlCommand("INSERT INTO Questions(HID, describe, Score) VALUES (@hid,@d,@s)");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@hid", hid);
        sqlpara2 = new SqlParameter("@d", TextBox4.Text);
        sqlpara3 = new SqlParameter("@s", TextBox9.Text);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        cmd = new SqlCommand("INSERT INTO Questions(HID, describe, Score) VALUES (@hid,@d,@s)");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@hid", hid);
        sqlpara2 = new SqlParameter("@d", TextBox5.Text);
        sqlpara3 = new SqlParameter("@s", TextBox10.Text);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        cmd = new SqlCommand("INSERT INTO Questions(HID, describe, Score) VALUES (@hid,@d,@s)");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@hid", hid);
        sqlpara2 = new SqlParameter("@d", TextBox6.Text);
        sqlpara3 = new SqlParameter("@s", TextBox11.Text);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();

        Response.Write("<script>alert('Successed!!!')</script>");
        Server.Transfer("teacherhome.aspx");
    }
}