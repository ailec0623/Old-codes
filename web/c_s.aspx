<%@ Page Language="C#" AutoEventWireup="true" CodeFile="c_s.aspx.cs" Inherits="c_s" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 106px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <h2>Creat new student account</h2><br />
    <table>
        <tr>
            <td>            
                <asp:Label ID="Label1" runat="server" Text="First name:"></asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Text="First name"></asp:TextBox>           
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Last name:"></asp:Label>  
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Text="Last name"></asp:TextBox>    
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Student ID:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Text="Student ID"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Password:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Text="Password"></asp:TextBox>  
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="E-mail"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Text="E-mail"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Text="Submit" OnClick="Button_Click" />
            </td>
        </tr>
    </table>
    </form>
    </body>
</html>
