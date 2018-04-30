<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <hr />
    <asp:Button ID="btnEncrypt" Text="Encrypt File" runat="server" OnClick="EncryptFile" />
    <asp:Button ID="btnDecrypt" Text="Decrypt File" runat="server" OnClick="DecryptFile" />
    </form>
</body>
</html>
