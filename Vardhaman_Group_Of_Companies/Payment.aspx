<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

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
                    Enter Customer Id:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtcustid" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Customer Name:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtcname" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Complex Id:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtcid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Building Id:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbid" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Building Name:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbname" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Building No:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Wing:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtwing" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Flat Floor:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtfloor" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Flat No:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtfno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Flat Area:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtfarea" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Amount:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtamt" runat="server"></asp:TextBox>
                </td>
                <td>
                    Enter Total:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txttotal" runat="server"></asp:TextBox>
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
                </td>               <td>
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
