<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 113px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Login"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                  <table style="height: 119px; width: 375px">
                    <tr>
                        <td class="auto-style1">                
                            <asp:Label ID="Label1" runat="server" Text="UserName:"></asp:Label>
                        </td>
                        <td>                               
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>                
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">                
                            <asp:Label ID="Label2" runat="server" Text="PassWord:"></asp:Label>
                        </td>
                        <td>                               
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>                
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Login" style="margin-left: 121px" OnClick ="Button_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>     
    </form>
</body>
</html>
