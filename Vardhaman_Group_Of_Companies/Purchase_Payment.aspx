<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Purchase_Payment.aspx.cs" Inherits="Purchase_Payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
    <tr>
                <td>
                    Enter Purchase Id:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtpid" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Purchased By:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtpby" runat="server"></asp:TextBox>
                </td>
                            </tr>
            <tr>
                <td>
                    Enter Material Name:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtmname" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Quantity:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtqty" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Quantity Type:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtqtype" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Rate:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtrate" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Amount:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtamt" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Vendor Name:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtvname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Vendor Mobile:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtmob" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    Enter Paid:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtpaid" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Balance:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbal" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Mode Of Payment:
                </td>
                <td>
                    <asp:DropDownList ID="mode" runat="server">
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>DD</asp:ListItem>
                        <asp:ListItem>NEFT</asp:ListItem>
                        <asp:ListItem>RTGS</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Cheque/DD No:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtchkddno" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Cheque/DD Date:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtchkdddate" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Bank Name:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbn" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td>
                    Enter Type Of Purchase:
                </td>
                <td>
                    <asp:DropDownList ID="type" runat="server">
                        <asp:ListItem>Site</asp:ListItem>
                        <asp:ListItem>Office</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    Enter Pay Date:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtpdate" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Comment:
                </td>
                <td>
                    <textarea id="txtcomment" runat="server"></textarea>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
