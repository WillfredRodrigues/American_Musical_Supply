<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="BS_P_L.aspx.cs" Inherits="BS_P_L" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
 <%if (Session["menu"].ToString() != "3") %>
            <%{ %>

 <div class="side-content fr" style="width:500px; margin-right:400px">
        <div class="content-module">
           
            <div class="content-module-main cf">
           <center> <asp:Button ID="bal" runat="server" Text="Balance Sheet" onclick="bal_Click" />&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="pl" Text="Profit & Loss" onclick="pl_Click" /></center>
            </div>
           
           
              
              
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
     <%} %>
</asp:Content>

