<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Update_Customer.aspx.cs" Inherits="Update_Customer" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
<div class="side-menu fl">
        <h3>
            Quick Links</h3>
        <ul>
         <%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
        <li><a href="View_Customer.aspx" class="active-tab dashboard-tab">View Customer</a></li>
        <%} %>
         <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Customer_Entry.aspx" class="active-tab dashboard-tab">Create Customer</a></li>
            <%} %>
             <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Customer.aspx" class="active-tab dashboard-tab">Update Customer</a></li>
            <%} %>
             <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Customer.aspx" class="active-tab dashboard-tab">Delete Customer</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
 <%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
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

               
            </div>
            <asp:Panel ID="pan1" runat="server">
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="left">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Customer Name
                    </th>
                    <th align="left">
                        Mobile No
                    </th>
                    <th align="left">
                         Building Name
                    </th>
                    <th align="left">
                         Wing
                    </th>
                    <th align="left">
                         Flat Floor
                    </th>
                    <th align="left">
                       Flat No
                    </th>
                    <th align="left">
                       Flat Type
                    </th>
                    <th>
                      Area
                    </th>
                     <th width="10px">
                        Total
                    </th>
                    <th width="10px">
                        Paid
                    </th>
                    <th width="10px">
                        Balance 
                    </th>
                    <th width="10px">
                        Update
                    </th>
                </tr>
               
                <%int i = 1; %>
                <% string s = "select cust_id,cust_name,cust_mobile1,building_name,wing,flat_floor,flat_no,flat_type,flat_area,total,paid,balance from "+val1+"";%>
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
                        <%Response.Write(dr.GetString(1));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(2));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(4));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(5));%>
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
                    </td><td>
                        <%Response.Write(dr.GetValue(10));%>
                    </td><td>
                        <%Response.Write(dr.GetValue(11));%>
                    </td>
                    
                     <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Customer1.aspx?id=<%=dr.GetString(0) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
         
                                    </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table></asp:Panel>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
   <%} %>  
</asp:Content>

