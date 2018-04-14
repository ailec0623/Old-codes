<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Assiment managment</h2><br />
              <%Response.Write("For " + Session["SID"] + "<br />"); %>
            <table class="auto - style1" style="border: 1px   dotted   #000000">
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label6" runat="server" Text="Answer"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label7" runat="server" Text="Score"></asp:Label>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label1" runat="server" Text="Ans1"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label2" runat="server" Text="Ans2"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label3" runat="server" Text="Ans3"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label4" runat="server" Text="Ans4"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label5" runat="server" Text="Ans5"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                    </td>
                </tr>

            </table>
            
        </div>
        <asp:TextBox ID="TextBox6" runat="server" Height="119px" Width="260px" Text="Comment"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Mark" Width="268px" OnClick="Button_Click" />
        </p>
    </form>
</body>
</html>
