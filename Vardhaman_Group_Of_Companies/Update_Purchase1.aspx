<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Update_Purchase1.aspx.cs" Inherits="Update_Purchase1" %>

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
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Purchase.aspx" class="active-tab dashboard-tab">Create Purchase</a></li>
            <%} %>
             <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Purchase1.aspx" class="active-tab dashboard-tab">Update Purchase</a></li>
            <%} %>
             <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Purchase1.aspx" class="active-tab dashboard-tab">Delete Purchase</a></li>
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
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="left">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Material  Name
                    </th>
                    <th align="left">
                        Quantity
                    </th>
                    <th align="left">
                        Quantity Type
                    </th>
                    <th align="left">
                        Rate
                    </th>
                    <th align="left">
                        Amount
                    </th>
                    <th align="left">
                         Vendor Name
                    </th>
                    <th align="left">
                        Vendor Mobile
                    </th>
                     <th align="left">
                        Purchased By
                    </th>
                     <th align="left">
                        Type
                    </th>
                    <th align="left">
                        Date
                    </th>
                     <th align="left">
                        Update
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select material_name,quantity,quantity_type,rate,amount,vendor_name,vendor_mobile,purchased_by,type_of_purchase,purchase_date,purchase_id from " + val + ""; %>
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
                        <%=i%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(0));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(1));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(2));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(4));%>
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
                        <%Response.Write(dr.GetString(9));%>
                    </td>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Purchase.aspx?id=<%=dr.GetString(10) %>" class="round blue my_button  text-upper">
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
            </table>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


