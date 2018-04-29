<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="BS_P_L.aspx.cs" Inherits="BS_P_L" %>

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

 <div class="side-content fr" style="width:1300px">
        <div class="content-module">
           
            <div class="content-module-main cf">
             <asp:Panel ID="Panel1" runat="server" style="float:left; width:600px; margin-bottom:25px; margin-left:25px; margin-top:25px; text-align:center" >
           
           hfjsdhfgshdhsdig<br />
           dbfjsdbfj<br />
           </asp:Panel>
           <div style="float:left; width:1px; height:auto"><img src="images/line.png" /></div>
               <asp:Panel ID="Panel2" runat="server" style="float:right; width:600px; margin-bottom:25px; margin-right:25px; margin-top:25px; text-align:center">
           
           hfjsdhfgshdhsdig<br />
           dbfjsdbfj<br />
           hfjsdhfgshdhsdig<br />
           dbfjsdbfj<br />
           hfjsdhfgshdhsdig<br />
           dbfjsdbfj<br />
           hfjsdhfgshdhsdig<br />
           dbfjsdbfj<br />
           </asp:Panel>
            </div>
            
          
              
              
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
     <%} %>
</asp:Content>

