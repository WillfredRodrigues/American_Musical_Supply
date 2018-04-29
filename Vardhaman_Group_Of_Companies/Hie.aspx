<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hie.aspx.cs" Inherits="Hie" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 <asp:TreeView  
  ID="TreeView1"
ExpandDepth="0"
PopulateNodesFromClient="true" ShowExpandCollapse="false"
OnTreeNodePopulate="TreeView1_TreeNodePopulate"
runat="server" 
        onselectednodechanged="TreeView1_SelectedNodeChanged"/>
        <asp:TextBox AutoComplete="off" ID="txtnode" runat="server" ></asp:TextBox>
</form>
</body>
</html>
