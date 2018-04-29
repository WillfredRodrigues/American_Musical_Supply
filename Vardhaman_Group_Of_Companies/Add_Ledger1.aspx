﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Ledger1.aspx.cs" Inherits="Add_Ledger1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        function mname() {
            var name = document.getElementById('txt1').value;
            var c = document.getElementById('hf').value;
            var c1 = document.getElementById('txt').value;
            var c2 = document.getElementById('mainid1').value;
            var c3 = document.getElementById('mainname1').value;
            var text = document.getElementById('<%=txttt.ClientID %>').value;
            var text1 = document.getElementById('<%=txttt1.ClientID %>').value;
            var text2 = document.getElementById('<%=txttt2.ClientID %>').value;
            var text3 = document.getElementById('<%=gf1.ClientID %>').value;
            var text4 = document.getElementById('<%=tp1.ClientID %>').value;
            var text5 = document.getElementById('<%=tp2.ClientID %>').value;
            window.opener.document.getElementById(text).value = name;
            window.opener.document.getElementById(text3).value = name;
            window.opener.document.getElementById(text1).value = c;
            window.opener.document.getElementById(text2).value = c1;
            window.opener.document.getElementById(text4).value = c2;
            window.opener.document.getElementById(text5).value = c3;
            window.close()

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txt"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers3" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txt1"
    ID="AutoCompleteExtender2" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
    <div>
       <table><tr><td>
                New Entry:&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox  Text="" ID="txt1" runat="server" ClientIDMode="Static" AutoComplete="off"></asp:TextBox>
                <asp:HiddenField ID="txttt" runat="server" ClientIDMode="Static" />
                 <asp:HiddenField ID="txttt1" runat="server" ClientIDMode="Static" />
                  <asp:HiddenField ID="txttt2" runat="server" ClientIDMode="Static" />
                  <asp:HiddenField ID="hf" runat="server" ClientIDMode="Static" />
                  <asp:HiddenField ID="gf1" runat="server" ClientIDMode="Static" />
                   <asp:HiddenField ID="mainid1" runat="server" ClientIDMode="Static" />
                  <asp:HiddenField ID="mainname1" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="tp" runat="server" ClientIDMode="Static" />
                  <asp:HiddenField ID="tp1" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="tp2" runat="server" ClientIDMode="Static" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
            runat="server" ErrorMessage="Required" ControlToValidate="txt1" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr><td>Select Sub Group:&nbsp;</td>
        <td><asp:TextBox ID="txt" runat="server"
                ClientIDMode="Static"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            runat="server" ErrorMessage="Required" ControlToValidate="txt" ForeColor="Red"></asp:RequiredFieldValidator></td></tr>
     <tr><td>&nbsp;</td></tr>
        <tr>
            <td colspan="2">
                <center>
                    <asp:Button ID="btn2" runat="server"  Text="Submit" onclick="btn2_Click" 
                        /></center>
                       
            </td>
        </tr>
</table>
    </div>
    </form>
</body>
</html>
