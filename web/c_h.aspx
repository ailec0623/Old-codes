<%@ Page Language="C#" AutoEventWireup="true" CodeFile="c_h.aspx.cs" Inherits="c_h" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <h2>Creat new homework</h2><br />
    <table>
        <tr>
            <td>            
                <asp:Label ID="Label1" runat="server" Text="Homework name:"></asp:Label>              
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Text="Homework name"></asp:TextBox>           
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Question 1:"></asp:Label>  
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Text="Describe" Height="170px" Width="328px"></asp:TextBox>    
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" Text="Score"></asp:TextBox>    
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Question 2:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Text="Describe" Height="170px" Width="328px"></asp:TextBox>
            </td>
                        <td>
                <asp:TextBox ID="TextBox8" runat="server" Text="Score"></asp:TextBox>    
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Question 3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Text="Describe" Height="170px" Width="328px"></asp:TextBox>  
            </td>
                        <td>
                <asp:TextBox ID="TextBox9" runat="server" Text="Score"></asp:TextBox>    
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Question 4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Text="Describe" Height="170px" Width="328px"></asp:TextBox> 
            </td>
                        <td>
                <asp:TextBox ID="TextBox10" runat="server" Text="Score"></asp:TextBox>    
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Question 5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Text="Describe" Height="170px" Width="328px"></asp:TextBox> 
            </td>
                        <td>
                <asp:TextBox ID="TextBox11" runat="server" Text="Score"></asp:TextBox>    
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Text="Create" OnClick="Button_Click" style="margin-left: 250px" />
            </td>
        </tr>
    </table>
        </div>
    </form>

</body>
</html>
