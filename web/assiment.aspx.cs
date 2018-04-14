using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class assiment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM Questions WHERE HID = @HID");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@HID", Session["HID"]);
        cmd.Parameters.Add(sqlpara1);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();
        int i = 1;
        while (data.Read())
        {
            string a;
            a = "Label" + i.ToString();
            Label l = (Label)(this.FindControl(a));
            l.Text = (string)data["describe"];                       //get all question describe of a homework

            a = "qid" + i.ToString();
            Session[a] = data["QID"];
            i++;
        }

    }

    protected void Button_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlParameter sqlpara1;
        SqlParameter sqlpara2;
        TextBox t;
        string a;
        int i = 1;
        con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        cmd = new SqlCommand("INSERT INTO Assiment(StuID, AsDate, HID) VALUES(@StuID, getdate(),@HID)");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@StuID", Session["userID"]);
        sqlpara2 = new SqlParameter("@HID", Session["HID"]);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        con.Open();
        cmd.ExecuteNonQuery();                                            //create an new assiment
        con.Close();

        cmd = new SqlCommand("SELECT * FROM Assiment WHERE StuID = @StuID AND HID = @HID");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@StuID", Session["userID"]);
        sqlpara2 = new SqlParameter("@HID", Session["HID"]);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();                        //get the new assiment id
        if (data.Read())
        {
            Session["AID"] = data["AID"];
        }
        con.Close();

        while (i <= 5)
        {
            t = (TextBox)(this.FindControl("TextBox" + i.ToString()));
            a = "ansid" + i.ToString();
            con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
            cmd = new SqlCommand("INSERT INTO Answers(AID, ans) VALUES(@AID, @ans)");
            cmd.Connection = con;
            sqlpara1 = new SqlParameter("@ans", t.Text);
            sqlpara2 = new SqlParameter("@AID", Session["AID"]);
            cmd.Parameters.Add(sqlpara1);
            cmd.Parameters.Add(sqlpara2);
            con.Open();
            cmd.ExecuteNonQuery();                                          //create new answers for the new assiment
            i++;
            con.Close();
        }
        Response.Write("<script>alert('Successed!!!')</script>");

    }
}