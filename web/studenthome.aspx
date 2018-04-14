<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studenthome.aspx.cs" Inherits="studenthome" %>

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
                         <br />
                        <asp:Label ID="Label1" runat="server" Text="Select HID"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Text="HID"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="select" OnClick="Button_Click" />
                     </td>
                 </tr>
            </table>
        </div>
    </form>
</body>
</html>
