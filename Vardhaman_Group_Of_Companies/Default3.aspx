<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txtContactsSearch"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="TextBox1"
    ID="AutoCompleteExtender2" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
<asp:TextBox AutoComplete="off" ID="txtContactsSearch" runat="server"></asp:TextBox>
<asp:TextBox AutoComplete="off" ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>
