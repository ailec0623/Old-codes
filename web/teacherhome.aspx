<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherhome.aspx.cs" Inherits="teacherhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                 <tr>
                     <td>
                         <%Response.Write("Welcome " + Session["userID"]); %>
                     </td>
                 </tr>
                <tr>
                    <td>
                        <a href="c_s.aspx">Create student accounts</a>
                     </td>
                </tr>
                <tr>
                    <td>
                        <a href="c_h.aspx">Create homeworks</a>
                     </td>
                </tr>
                <tr>
                    <td>
                        <a href="a_m.aspx">Assiment marking</a>
                     </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>