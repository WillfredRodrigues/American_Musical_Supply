<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddGroup.aspx.cs" Inherits="Add" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
     <script type="text/javascript">
         function mname() {
             var name = document.getElementById('txt1').value;
             var c = document.getElementById('<%=txttt.ClientID %>').value;
             window.opener.document.getElementById('ledger').value = name;
             window.opener.document.getElementById('ledstatus').value = 'true';
             window.opener.document.getElementById('ledgerid').value = c;
             window.opener.document.getElementById('ledger').setAttribute('disabled', 'disabled');
             window.close()

         }
    </script>

</head>
<body>
    <form id="frm" runat="server">
    
   
     <asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txt"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
    <table><tr><td>
                New Group:&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox  Text="" ID="txt1" runat="server" ClientIDMode="Static" AutoComplete="off"></asp:TextBox>
                <asp:HiddenField ID="txttt" runat="server" />
            </td>
        </tr>
        <tr><td>Select Sub Group:&nbsp;</td>
        <td><asp:TextBox ID="txt" runat="server"></asp:TextBox></td></tr>
     <tr><td colspan="2"><p style="color:Red; text-transform:capitalize">If no sub group is selected,the new group will be considered as master group</p></td></tr>
        <tr>
            <td colspan="2">
                <center>
                    <asp:Button ID="btn2" runat="server"  Text="Submit" onclick="btn2_Click1" 
                        /></center>
                       
            </td>
        </tr>
</table>
    </form>
</body>
</html>
