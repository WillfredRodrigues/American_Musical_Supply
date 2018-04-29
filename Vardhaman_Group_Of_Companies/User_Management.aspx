<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Management.aspx.cs"
    Inherits="User_Management" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Welcome : <%=Session["project_admin_name"].ToString()%><br />
  <asp:Label  runat="server" Text="ADMIN ID:"></asp:Label> <asp:Label ID="id" runat="server"> <%=Session["project_admin_id"].ToString()%></asp:Label><br />
    <asp:Label  runat="server" Text="ADMIN NAME:"></asp:Label>
                <asp:Label id="name" runat="server"><%=Session["project_admin_name"].ToString()%></asp:Label><br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="search Project:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtsearchproj" runat="server" AutoPostBack="true" 
                        ontextchanged="txtsearchproj_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:ListBox ID="lstproj" AutoPostBack="true" runat="server" 
                        onselectedindexchanged="lstproj_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td>
                    &nbsp;</td>
                <%--<td>
                    <asp:TextBox AutoComplete="off" ID="txtsearchadmin" runat="server" AutoPostBack="true" 
                        ontextchanged="txtsearchadmin_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:ListBox ID="Lstadmin" AutoPostBack="true" runat="server" 
                        onselectedindexchanged="Lstadmin_SelectedIndexChanged"></asp:ListBox>
                </td>--%>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Project Id:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtprojid" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Project Location:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtlocation" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Project User Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtprojuser" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                                <td>
                    <asp:Label ID="Label5" runat="server" Text="Site Master Name:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="sitemaster" runat="server">
                    </asp:DropDownList>
                </td>
           
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Enter User's Full Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtuserfullname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Enter User's User Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtusername" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Enter User's Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtuserpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            <td>
                    <asp:Label ID="Label13" runat="server" Text="Enter User's Status:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="status" runat="server">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Disabled</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Enter User's Rights:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="userright" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnadd" runat="server" Text="Create User" 
            onclick="btnadd_Click" />
    </div>
    </form>
</body>
</html>
