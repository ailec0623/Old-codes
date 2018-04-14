using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class homework : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM Assiment JOIN Students ON Assiment.StuID = Students.StuID WHERE HID = @HID");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@HID", Session["HID"]);
        cmd.Parameters.Add(sqlpara1);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();                                 //get all assiment for a homework
        Response.Write("<table align=\"center\" class=\"auto - style1\" style=\"border: 1px   dotted   #000000\">");
        Response.Write("<tr style=\"border: 1px   dotted   #000000\">");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">SID</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">Student name</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">AsDate</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">Score</td>");
        Response.Write("</tr>");
        while (data.Read())
        {
            int i = 1;
            Response.Write("<tr style=\"border: 1px   dotted   #000000\">");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["StuID"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["FName"] + " " + data["LName"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["AsDate"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["Score"] + "</td>");
            Response.Write("</tr>");
            i++;
        }
        Response.Write("</table>");
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        Session["SID"] = TextBox1.Text;
        Server.Transfer("manage.aspx");
    }
}