<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Update_Complex.aspx.cs" Inherits="Update_Complex" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        
        <ul>
        <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Complex.aspx" class="active-tab dashboard-tab">Create Complex</a></li>
            <%} %>
            <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Complex1.aspx" class="active-tab dashboard-tab">Update Complex</a></li>
         <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="Server">
<%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
    <div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Update Complex Information</u></b></font></center></div>
            <br />
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
                           Complex Name
                        </th>
                        <th align="left">
                           Complex Location
                        </th>
                        <th align="left">
                            Building Name
                        </th>
                        <th align="left">
                            Wing
                        </th>
                        <th align="left">
                            Floor
                        </th>
                        <th>
                            Flat NO
                        </th>
                        <th width="10px">
                            Flat Type
                        </th>
                        <th width="10px">
                            Area
                        </th>
                        <th width="10px">
                          Customer Name
                        </th>
                        <th width="10px">
                           Status
                        </th>
                        <th width="10px">
                           Update
                        </th>
                    </tr>
                    <%int i = 1; %>
                    <% string s = "select complex_id,complex_name,complex_location,building_id,building_name,wing,flat_floor,flat_no,flat_type,flat_area,cust_name,cust_id from " + val + "  order by complex_name asc,building_name asc, wing asc, flat_floor asc,flat_no asc";%>
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
                            <%Response.Write(dr.GetString(9));%>
                        </td>
                        
                         <td>
                            <%Response.Write(dr.GetString(10));%>
                        </td>
                        <td>
                            <%if (dr.GetString(10) == "") %>
                            <%{ %>
                            Unsold
                            <%} %>
                            <%else
                                { %>
                            sold
                            <%} %>
                        </td>
                         <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Complex1.aspx?id=<%=dr.GetString(0) %>&id1=<%=dr.GetString(3) %>&id2=<%=dr.GetString(5) %>&id3=<%=dr.GetString(6) %>&id4=<%=dr.GetString(7) %>&id5=<%=dr.GetString(11)%>" class="round blue my_button  text-upper">
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
            </asp:Panel>
            
            
            
            
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
