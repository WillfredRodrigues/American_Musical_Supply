<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login1.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <asp:DropDownList id="type" runat="server">
   <asp:ListItem>Main_Admin</asp:ListItem>
   <asp:ListItem>Project_Admin</asp:ListItem>
   <asp:ListItem>User</asp:ListItem>
   </asp:DropDownList>
   <asp:TextBox AutoComplete="off" ID="txt1" runat="server" Visible="false"></asp:TextBox>
   <asp:TextBox AutoComplete="off" ID="txt2" runat="server" Visible="false"></asp:TextBox>
   <table>
   <tr><td>   <asp:label runat="server" Text="Enter Login Id:"></asp:label></td>
   <td><asp:TextBox AutoComplete="off" ID="txtid" runat="server"></asp:TextBox></td>
   </tr>
   <tr>
   <td>
   <asp:Label runat="server" text="Enter Password:"></asp:Label>
   </td>
   <td><asp:TextBox AutoComplete="off" ID="txtpass" runat="server" TextMode="Password"></asp:TextBox></td>
   </tr>
   </table>
   <asp:Button ID="btnlogin" runat="server" Text="LOGIN" onclick="btnlogin_Click" 
            style="height: 26px" />
    </div>
    </form>
</body>
</html>
