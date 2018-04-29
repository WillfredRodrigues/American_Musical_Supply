<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true"
    CodeFile="Manage_Rights.aspx.cs" Inherits="Manage_Rights" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
<div class="side-menu fl">
       
        <ul>
        <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Create_User.aspx" class="active-tab dashboard-tab">Create User</a></li>
            <%} %>
            <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_User.aspx" class="active-tab dashboard-tab">Update User</a></li>
            <%} %>
            <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_User.aspx" class="active-tab dashboard-tab">Delete User</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
<%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
    <div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Manage Rights</u></b></font></center></div>
            <br />
            <div class="content-module-main cf">
            </div>
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="left">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Project Name
                    </th>
                    <th align="left">
                        Project User Name
                    </th>
                    <th align="left">
                        Project Location
                    </th>
                    <th align="left">
                        User Name
                    </th>
                    <th align="left">
                        User Type
                    </th>
                    <th>
                        View
                    </th>
                    <th>
                        Insert
                    </th>
                    <th width="10px">
                        Update
                    </th>
                    <th width="10px">
                        Delete
                    </th>
                    <th>
                        Manage
                    </th>
                </tr>
                <%string s1, w; %>
                <%if (Request.QueryString["id"] != null) %>
                <%{ %>
                <%s1 = Request.QueryString["id"].ToString(); %>
                <%} %>
                <%else
    { %>
                <%s1 = ""; %>
                <%} %>
                 <%if (Request.QueryString["id1"] != null) %>
                <%{ %>
                <%w = Request.QueryString["id1"].ToString(); %>
                <%} %>
                <%else
    { %>
                <%w = ""; %>
                <%} %>
                <%int i = 1; %>
                <% string s = "select project_registration.proj_name,project_registration.proj_location,project_registration.proj_user_name,rights.user_name,rights.view_r,rights.insert_r,rights.update_r,rights.delete_r,rights.user_type from project_registration left join rights on project_registration.proj_regi_id=rights.project_id where rights.user_id='" + w + "' and rights.project_id='" + s1 + "' "; %>
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
                        <%Response.Write(dr.GetString(1));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(2));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(8));%>
                    </td>
                    <%if (Convert.ToDouble(dr.GetValue(4)) == 1)
                      { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk1" Checked="true" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="Chk11" Checked="false" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%if (Convert.ToDouble(dr.GetValue(5)) == 1)
                      { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk2" Checked="true" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk22" Checked="false" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%if (Convert.ToDouble(dr.GetValue(6)) == 1)
                      { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk3" Checked="true" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk33" Checked="false" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%if (Convert.ToDouble(dr.GetValue(7)) == 1)
                      { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk4" Checked="true" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                        <center>
                            <asp:CheckBox runat="server" ID="chk44" Checked="false" Enabled="true" /></center>
                    </td>
                    <%} %>
                    <td>
                        <center>
                            <asp:Button ID="btnupdate" CssClass="round blue my_button  text-upper" runat="server"
                                Text="Update" OnClick="btnupdate_Click1" /></center>
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
            <!-- end content-module-heading -->
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
