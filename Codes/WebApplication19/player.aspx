﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="player.aspx.cs" Inherits="WebApplication19.player1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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

        <asp:Label ID="Label3" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Font-Size="Medium" ForeColor="#000046" style="margin-left: 23px; margin-top: 0px; margin-bottom: 0px" Text="ID" Width="30px"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" BackColor="White" BorderColor="#00004A" ForeColor="#000066" OnTextChanged="TextBox1_TextChanged1" style="margin-left: 93px" Width="134px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button17" runat="server" BackColor="#000035" BorderColor="White" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Medium" ForeColor="White" Height="33px" OnClick="Button1_Click1" style="margin-left: 0px" Text="INSERT" Width="165px" />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Font-Size="Medium" ForeColor="#000046" style="margin-left: 21px; margin-top: 0px; margin-bottom: 0px" Text="ID-City" Width="101px"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="#00004A" ForeColor="#000066" OnTextChanged="TextBox1_TextChanged1" style="margin-left: 25px" Width="134px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button18" runat="server" BackColor="#000035" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Medium" ForeColor="White" Height="36px" OnClick="Button4_Click" style="margin-left: 2px; margin-right: 25px; margin-bottom: 0px" Text="Edit" Width="162px" />
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Font-Size="Medium" ForeColor="#000046" style="margin-left: 0px; margin-top: 0px; margin-bottom: 0px" Text="Name" Width="48px"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" BackColor="White" BorderColor="#00004A" ForeColor="#000066" OnTextChanged="TextBox1_TextChanged1" style="margin-left: 51px" Width="134px"></asp:TextBox>
        <asp:Button ID="Button19" runat="server" BackColor="#000033" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Medium" ForeColor="White" Height="36px" OnClick="Button3_Click" style="margin-left: 28px" Text="Delete" Width="161px" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#000048" Text="Last Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" BorderColor="#000066" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
&nbsp;
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#000066" Text="BirthYear"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" BorderColor="#000066" OnTextChanged="TextBox6_TextChanged" style="margin-left: 73px"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#000066" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox7" runat="server" BorderColor="#000066" OnTextChanged="TextBox7_TextChanged" style="margin-left: 0px"></asp:TextBox>
&nbsp;<br />
&nbsp;
        <br />
&nbsp;
        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#000066" Text="Date Start Football"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server" BorderColor="#000066" OnTextChanged="TextBox8_TextChanged" style="margin-left: 8px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" style="margin-left: 11px" Width="159px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton4" runat="server" Height="16px" ImageUrl="http://dopro.ir/blog/wp-content/uploads/2017/03/1-ZimH1QT0zKfzzgocMfpYOA-2.png" OnClick="ImageButton4_Click" style="margin-left: 5px" Width="26px" />
&nbsp;&nbsp;
        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Arial" Text="Search by ID Player"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" BorderColor="#000066" BorderStyle="Double" Font-Size="Small" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
        <br />
&nbsp;&nbsp;
    
    </div>
    
    </div>
    </form>
</body>
</html>
