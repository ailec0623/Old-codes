<%@ Page Language="C#" AutoEventWireup="true" CodeFile="a_m.aspx.cs" Inherits="a_m" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <h2>Assiment managment</h2>
                <asp:Label ID="Label1" runat="server" Text="Select HID"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Text="HID"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="select" OnClick="Button_Click" />
                <br />
        </div>
    </form>
</body>
</html>
