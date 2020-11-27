<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stadium.aspx.cs" Inherits="WebApplication19.stadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 470px; width: 1240px">
    
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#0000128" BorderColor="White" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" Text="Main Page" Width="143px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button2_Click" Text="Country" Width="143px" />
        <asp:Button ID="Button22" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button22_Click" Text="City" Width="143px" />
        <asp:Button ID="Button20" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button20_Click" Text="Stadium" Width="143px" />
        <asp:Button ID="Button5" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button5_Click" Text="Personel" Width="143px" />
        <asp:Button ID="Button6" runat="server" BackColor="#0000128" BorderColor="White" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button6_Click" Text="Team" Width="143px" />
        <asp:Button ID="Button7" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" Font-Strikeout="False" ForeColor="White" OnClick="Button7_Click" Text="Player" Width="143px" />
        <asp:Button ID="Button8" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" Height="31px" OnClick="Button8_Click" Text="Player-Team" Width="143px" style="margin-top: 0px" />
        <asp:Button ID="Button9" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button9_Click" Text="Coach" Width="143px"  />
        <asp:Button ID="Button10" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" Font-Underline="False" ForeColor="White" OnClick="Button10_Click" Text="Coach_Team" Width="143px" />
        <asp:Button ID="Button11" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button11_Click" Text="Referee" Width="143px" />
        <asp:Button ID="Button12" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button12_Click" Text="Match" Width="143px" />
        <asp:Button ID="Button13" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button13_Click" Text="Detail After Match" Width="143px" />
        <asp:Button ID="Button14" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button14_Click" Text="Detail Goal" Width="143px" />
        <asp:Button ID="Button15" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" Height="32px" OnClick="Button15_Click" Text="Detail Warning" Width="143px" />
        <asp:Button ID="Button16" runat="server" BackColor="#0000128" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" OnClick="Button16_Click" Text="Season" Width="143px" />
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="#000046" style="margin-left: 18px; margin-top: 0px; margin-bottom: 0px" Text="ID" Width="36px"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" BackColor="White" BorderColor="#00004A" ForeColor="#0000128" OnTextChanged="TextBox1_TextChanged1" style="margin-left: 0px" Width="134px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button17" runat="server" BackColor="#000035" BorderColor="White" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" Height="27px" OnClick="Button1_Click1" style="margin-left: 0px" Text="INSERT" Width="152px" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="#000046" style="margin-left: 4px; margin-top: 0px; margin-bottom: 0px" Text="Name" Width="48px"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="#000042" ForeColor="#0000128" Height="16px" OnTextChanged="TextBox2_TextChanged" style="margin-left: 0px; margin-bottom: 0px" Width="133px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button18" runat="server" BackColor="#000035" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" Height="28px" OnClick="Button4_Click" style="margin-left: 5px; margin-bottom: 0px" Text="Edit" Width="149px" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" ForeColor="#0000128" Text="ID_City"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server" BorderColor="#0000128" OnTextChanged="TextBox4_TextChanged" style="margin-left: 0px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button19" runat="server" BackColor="#000033" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="White" Height="29px" OnClick="Button3_Click" style="margin-left: 9px" Text="Delete" Width="146px" />
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" ForeColor="#0000128" Text="Capacity"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" BorderColor="#0000128" OnTextChanged="TextBox5_TextChanged" style="margin-left: 32px; margin-bottom: 0px"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" style="margin-left: 11px" Width="159px"></asp:TextBox>
&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" Height="16px" ImageUrl="http://dopro.ir/blog/wp-content/uploads/2017/03/1-ZimH1QT0zKfzzgocMfpYOA-2.png" OnClick="ImageButton4_Click" style="margin-left: 5px" Width="26px" />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Text="Search by Name Stadium"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#0000128" BorderStyle="Double" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="#0000128" Height="53px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-left: 27px; margin-top: 0px" Width="16px">
        </asp:GridView>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
