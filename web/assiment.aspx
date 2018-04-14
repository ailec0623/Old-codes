<style type="text/css">
    .auto-style1 {
        width: 231px;
    }
    .auto-style2 {
        width: 231px;
        height: 134px;
    }
    </style>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assiment.aspx.cs" Inherits="assiment" %>

<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><title></title></head><body><form id="form1" runat="server">
        <div>
            <h2>Assiment submit</h2><br />
            <%Response.Write("For " + Session["HID"] + "<br />"); %>
            <table class="auto - style1" style="border: 1px   dotted   #000000">
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000" class="auto-style1">

                        <asp:Label ID="Label6" runat="server" Text="Describe"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000">

                        <asp:Label ID="Label7" runat="server" Text="Answer"></asp:Label>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:Label ID="Label1" runat="server" Text="Des1"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:TextBox ID="TextBox1" runat="server" Height="129px" Width="226px"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:Label ID="Label2" runat="server" Text="Des2"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:TextBox ID="TextBox2" runat="server" Height="129px" Width="226px"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:Label ID="Label3" runat="server" Text="Des3"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:TextBox ID="TextBox3" runat="server" Height="129px" Width="226px"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:Label ID="Label4" runat="server" Text="Des4"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:TextBox ID="TextBox4" runat="server" Height="129px" Width="226px"></asp:TextBox>

                    </td>
                </tr>
                <tr style="border: 1px   dotted   #000000">
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:Label ID="Label5" runat="server" Text="Des5"></asp:Label>

                    </td>
                    <td style="border: 1px   dotted   #000000" class="auto-style2">

                        <asp:TextBox ID="TextBox5" runat="server" Height="129px" Width="226px"></asp:TextBox>

                    </td>
                </tr>

            </table>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Submit" Width="467px" OnClick="Button_Click" />
        </p>
        </div>
    </form>
</body>
</html>
