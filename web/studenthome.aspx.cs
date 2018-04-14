using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class studenthome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM Students WHERE StuID = @StuID");
        SqlParameter sqlpara1 = new SqlParameter("@StuID", Session["userID"]);
        cmd.Parameters.Add(sqlpara1);
        cmd.Connection = con;
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.Read())                                                      //get the id of user's teacher
        {
            Session["TID"] = data["TID"];
        }
        con.Close();

        cmd = new SqlCommand("SELECT * FROM dbo.HomeWork WHERE TID = @TID");
        sqlpara1 = new SqlParameter("@TID", Session["TID"]);
        cmd.Parameters.Add(sqlpara1);
        cmd.Connection = con;
        con.Open();
        data = cmd.ExecuteReader();
        Response.Write("<table align=\"center\" class=\"auto - style1\" style=\"border: 1px   dotted   #000000\">");
        Response.Write("<tr style=\"border: 1px   dotted   #000000\">");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">HID</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">name</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">score</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">StDate</td>");
        Response.Write("</tr>");
        while (data.Read())                                                 //get all the homework issued by the student's teacher
        {
            Response.Write("<tr style=\"border: 1px   dotted   #000000\">");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["HID"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["hname"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["TScore"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["StDate"] + "</td>");
            Response.Write("</tr>");
        }
        Response.Write("</table>");
        con.Close();
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        Session["HID"] = TextBox1.Text;
        Server.Transfer("assiment.aspx");                                 //select a homework id, and go to homework assiment page
    }
}