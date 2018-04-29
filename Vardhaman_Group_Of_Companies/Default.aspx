<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>jQuery UI Datepicker - Default functionality</title>
<link type="text/css" href="css1/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js1/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js1/jquery-ui-1.8.19.custom.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#txtDate").datepicker();
    });
</script>
<style type="text/css">
.ui-datepicker { font-size:8pt !important}
</style>
<script type="text/javascript">

    function SelectName() {

        window.open('Add.aspx', 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=100,height=100,left=490,top=300');


    }
  
</script>
</head>

<body>
<form id="fohgfrm1" runat="server">

<b>Date:</b> <asp:TextBox AutoComplete="off" ID="txtDate" runat="server" ReadOnly="true"/>
<asp:TextBox AutoComplete="off" Text="" ID="txt" runat="server" ClientIDMode="Static"></asp:TextBox><asp:Button ID="btn1" runat="server" CausesValidation="false" OnClientClick="SelectName(); return false;" TabIndex="13" />
</div>
</form>
</body>
</html>
