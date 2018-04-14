using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Click(object sender, EventArgs e)
    {
        string id = TextBox1.Text;
        string pw = TextBox2.Text;
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Teachers WHERE TID = @ID AND PassWd = @PW");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@ID", id);
        SqlParameter sqlpara2 = new SqlParameter("@PW", pw);
        cmd.Parameters.Add(sqlpara1);
        cmd.Parameters.Add(sqlpara2);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)                               //check if the id in table teachers
        {
            Session["userID"] = id;
            Server.Transfer("teacherhome.aspx");        //go to teacher's page
        }
        else
        {
            con.Close();
            cmd = new SqlCommand("SELECT * FROM dbo.Students WHERE StuID = @ID AND PassWd = @PW");
            cmd.Connection = con;
            sqlpara1 = new SqlParameter("@ID", id);
            sqlpara2 = new SqlParameter("@PW", pw);
            cmd.Parameters.Add(sqlpara1);
            cmd.Parameters.Add(sqlpara2);
            con.Open();
            data = cmd.ExecuteReader();
            if (data.Read())                           //check if the id in table students
            {
                Session["userID"] = id;
                Session["TID"] = data["TID"];
                Server.Transfer("studenthome.aspx");  //go to students page
            }
            else
                Response.Write("<script>alert('Wrong UserID or Wrong Passeword!!!')</script>");   
        }

    }
}