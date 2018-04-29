<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Day_Book.aspx.cs" Inherits="Day_Book" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        <h3>
            Quick Links</h3>
        <ul>
        <%if (Session["rightView"].ToString() == "1") %>
            <%{ %>
            <li><a href="Day_Book.aspx" class="active-tab dashboard-tab">Day Book</a></li>
            <%} %>
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Payment_Entry.aspx" class="active-tab dashboard-tab">Payment</a></li>
            <li><a href="Receipt_Entry.aspx" class="active-tab dashboard-tab">Receipt</a></li>
            <li><a href="Contra.aspx" class="active-tab dashboard-tab">Contra</a></li>
            <li><a href="Journal.aspx" class="active-tab dashboard-tab">Journal</a></li>
            <%} %>
        </ul>
    </div>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
<%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
    <script type="text/javascript">
        function right() {
            //            var x = document.getElementsByName("rd").item;
            //            alert(x);
            alert('No User Present.Please Go To Add User Section To Create New User');
        }
    </script>
    <div class="side-content fr">
        <div class="content-module">
            <div class="content-module-heading cf">
                <h3 class="fl">
                    Sales</h3>
                <span class="fr expand-collapse-text">Click to collapse</span> <span class="fr expand-collapse-text initial-expand">
                    Click to expand</span>
            </div>
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
          <center>  <table>
                    <tr>
                        <td style="width: 170px; text-align: center">
                            From Date
                        </td>
                       
                        
                        <td rowspan="2" style="width: 170px; text-align: center">
                            <center>
                                <asp:Button CssClass="round" runat="server" ID="btnSub" Text="Search" OnClick="btnSub_Click" /></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="from" runat="server"></asp:TextBox>
                        </td>
                       
                        
                    </tr>
                    
                </table></center>
            </div>
            <asp:Panel ID="pan1" runat="server">
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Date
                    </th>
                    <th align="left">
                        Account
                    </th>
                    <th align="left">
                        Name
                    </th>
                    
                    <th align="left">
                        Amount
                    </th>
                    <th align="left">
                        Cheque No
                    </th>
                     <th align="left">
                        Cheque Date
                    </th>
                     <th align="left">
                        Bank Name
                    </th>
                    <th align="left">
                        Debit
                    </th>
                    <th align="left">
                        Credit
                    </th>
                    <th align="left">
                       Account Balance
                    </th>
                    
                </tr>
                <%int i = 1; %>
                <% string s = "select * from "+val+" union select * from "+val1+""; %>
                <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                <%SqlConnection con = new SqlConnection(strConnString); %>
                <% con.Open(); %>
                <% SqlDataReader dr;%>
                <%SqlCommand cmd = new SqlCommand(s, con);%>
                <% dr = cmd.ExecuteReader();%>
                <%while (dr.Read())%>
                <%{ %>
                <tr>
                    <td>
                        <%=i %>
                    </td>
                    
                    <td>
                        <%Response.Write(dr.GetValue(2).ToString());%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(4));%>
                    </td>
                   
                    <td>
                        <%Response.Write(dr.GetValue(5));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(6));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(7));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(8));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(9));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(10));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(11));%>
                    </td>
                   
                </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table>
            </asp:Panel>
            <asp:Panel ID="pan2" runat="server">
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Date
                    </th>
                    <th align="left">
                        Account
                    </th>
                    <th align="left">
                        Name
                    </th>
                    
                    <th align="left">
                        Amount
                    </th>
                    <th align="left">
                        Cheque No
                    </th>
                     <th align="left">
                        Cheque Date
                    </th>
                     <th align="left">
                        Bank Name
                    </th>
                    <th align="left">
                        Debit
                    </th>
                    <th align="left">
                        Credit
                    </th>
                    <th align="left">
                       Account Balance
                    </th>
                    
                </tr>
                <%int i = 1; %>
                <% string s = "select * from " + val + " where convert(varchar(10),date,103) = convert(varchar(10),'" + from.Text + "',103) union select * from " + val1 + " where convert(varchar(10),date,103) = (varchar(10),'" + from.Text + "',103)"; %>
                <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                <%SqlConnection con = new SqlConnection(strConnString); %>
                <% con.Open(); %>
                <% SqlDataReader dr;%>
                <%SqlCommand cmd = new SqlCommand(s, con);%>
                <% dr = cmd.ExecuteReader();%>
                <%while (dr.Read())%>
                <%{ %>
                <tr>
                    <td>
                        <%=i %>
                    </td>
                    
                    <td>
                        <%Response.Write(dr.GetValue(2).ToString());%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(4));%>
                    </td>
                   
                    <td>
                        <%Response.Write(dr.GetValue(5));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(6));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(7));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(8));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(9));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(10));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(11));%>
                    </td>
                   
                </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table>
            </asp:Panel>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


