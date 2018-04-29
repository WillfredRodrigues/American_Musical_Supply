<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_Usage1.aspx.cs" Inherits="Delete_Usage1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
<div class="side-menu fl">
        
        <ul>
        <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Usage.aspx" class="active-tab dashboard-tab">Create Usage</a></li>
            <%} %>
            <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_usage1.aspx" class="active-tab dashboard-tab">Update Usage</a></li>
            <%} %>
            <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Usage1.aspx" class="active-tab dashboard-tab">Delete Usage</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
<%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
<div class="side-content fr">
        <div class="content-module">
            <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete Usage Information</u></b></font></center></div>
        <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
               
            </div>
            <center>
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" >
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
                        Used By
                    </th>
                    <th align="left">
                        Balance Material
                    </th>
                    <th align="left">
                         Material Type
                    </th>
                    <th align="left">
                        Date
                    </th>
                    <th align="left">
                        Delete
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select material_name,quantity,quantity_type,used_by,balance_material,balance_material_type,use_date,use_id from " + val + ""; %>
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
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Usage.aspx?id=<%=dr.GetString(7) %>" class="round blue my_button  text-upper">
                                Delete</a>
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
            </table></center>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


