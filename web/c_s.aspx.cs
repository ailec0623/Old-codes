using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class c_s : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Click(object sender, EventArgs e)
    {
        string fn = TextBox1.Text;
        string ln = TextBox2.Text;
        string id = TextBox3.Text;
        string pw = TextBox4.Text;
        string em = TextBox5.Text;
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("INSERT INTO Students VALUES (@id, @pw, @fn, @ln, @em, @tid)");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@fn", fn);
        SqlParameter sqlpara2 = new SqlParameter("@ln", ln);
        SqlParameter sqlpara3 = new SqlParameter("@id", id);
        SqlParameter sqlpara4 = new SqlParameter("@pw", pw);
        SqlParameter sqlpara5 = new SqlParameter("@em", em);
        SqlParameter sqlpara6 = new SqlParameter("@tid", Session["userID"]);

        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        cmd.Parameters.Add(sqlpara3);
        cmd.Parameters.Add(sqlpara4);
        cmd.Parameters.Add(sqlpara5);
        cmd.Parameters.Add(sqlpara6);
        con.Open();
        int i = cmd.ExecuteNonQuery();                                          //create new student account
        if(i==1)
        {
            Response.Write("<script>alert('Successed!!!')</script>");
            Server.Transfer("teacherhome.aspx");
        }
        else
        {
            Response.Write("<script>alert('Error!!!')</script>");
        }
        con.Close();
        Response.Write("<script>alert('Successed!!!')</script>");
    }
}