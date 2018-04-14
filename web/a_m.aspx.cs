using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class a_m : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data Source=.\\MSSQLSERVER2;Initial Catalog=ClassProject;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM HomeWork WHERE TID = @TID");
        cmd.Connection = con;
        SqlParameter sqlpara1 = new SqlParameter("@TID", Session["userID"]);
        cmd.Parameters.Add(sqlpara1);
        con.Open();
        SqlDataReader data = cmd.ExecuteReader();                              //get the teacher's all homework
        Response.Write("<table align=\"center\" class=\"auto - style1\" style=\"border: 1px   dotted   #000000\">");
        Response.Write("<tr style=\"border: 1px   dotted   #000000\">");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">HID</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">name</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">assiment number</td>");
        Response.Write("<td style=\"border: 1px   dotted   #000000\">StDate</td>");
        Response.Write("</tr>");
        while (data.Read())
        {
            int i = 1;
            Response.Write("<tr style=\"border: 1px   dotted   #000000\">");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["HID"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["hname"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["ass_nub"] + "</td>");
            Response.Write("<td style=\"border: 1px   dotted   #000000\">" + data["StDate"] + "</td>");
            Response.Write("</tr>");
            i++;
        }
        Response.Write("</table>");

    }

    protected void Button_Click(object sender, EventArgs e)
    {
        Session["HID"] = TextBox1.Text;
        Server.Transfer("homework.aspx");                                  //select a homework for more details
    }
}