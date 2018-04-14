using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM Assiment WHERE HID = @HID AND StuID = @StuID");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@HID", Session["HID"]);
        SqlParameter sqlpara2 = new SqlParameter("@StuID", Session["SID"]);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();                        //get someone's assiment id of a homework
        if(data.Read())
        {
            Session["AID"] = data["AID"];
        }
        con.Close();

        cmd = new SqlCommand("SELECT * FROM Answers WHERE AID = @AID");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@AID", Session["AID"]);
        cmd.Parameters.Add(sqlpara1);
        con.Open();
        data = cmd.ExecuteReader();                                   //get someone's answers of the homework question
        int i = 1;
        while (data.Read())
        {
            string a;
            Label l = (Label)(this.FindControl("Label" + i.ToString()));
            l.Text = (string)data["ans"];
            //TextBox t = (TextBox)(this.FindControl("TextBox" + i.ToString()));
            //t.Text = Convert.ToString( data["Score"]);
            a = "ansid" + i.ToString();
            Session[a] = data["AnsID"];
            i++;
        }
    }



    protected void Button_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlParameter sqlpara1;
        SqlParameter sqlpara2;
        SqlParameter sqlpara3;
        TextBox t;
        Session["tt"] = "0";
        string a;
        int i = 1;
        while(i<=5)
        {


            con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
            cmd = new SqlCommand("UPDATE Answers SET Score = @score WHERE AnsID = @AnsID");
            cmd.Connection = con;
            a = "TextBox" + i.ToString();
            t = (TextBox)(this.FindControl(a));
            Session["tt"] = Convert.ToInt32(Session["tt"]) + Convert.ToInt32(t.Text);
            sqlpara1 = new SqlParameter("@score", t.Text);

            a = "ansid" + i.ToString();
            sqlpara2 = new SqlParameter("@AnsID", Session[a]);
            cmd.Parameters.Add(sqlpara1);
            cmd.Parameters.Add(sqlpara2);
            con.Open();
            cmd.ExecuteNonQuery();                                    //update the score of stduent's answers
            i++;
            con.Close();
        }

        con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        cmd = new SqlCommand("UPDATE Assiment SET Comment = @c, Score = @sc WHERE AID = @AID");
        cmd.Connection = con;
        sqlpara1 = new SqlParameter("@c", TextBox6.Text);
        sqlpara2 = new SqlParameter("@AID", Session["AID"]);
        sqlpara3 = new SqlParameter("@sc", Session["tt"]);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        con.Open();
        cmd.ExecuteNonQuery();                                       //update the comment and total score of a assiment
        Response.Write("<script>alert('Successed!!!')</script>");
    }
}