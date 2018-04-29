<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Project_User.aspx.cs" Inherits="Project_User" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        <h3>
            Quick Links</h3>
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
                <input name="searchtxt" type="text" class="round my_text_box" placeholder="Search">
                &nbsp;&nbsp;<input name="Search" type="submit" class="my_button round blue   text-upper"
                    value="Search">
                Page per Record<input name="limit" type="text" class="round my_text_box" id="search_limit"
                    style="margin-left: 5px;" size="3" maxlength="3">
                <input name="go" type="button" value="Go" class=" round blue my_button  text-upper"
                    onclick="return confirmLimitSubmit()">
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
                         User Type
                    </th>
                    <th align="left">
                        status
                    </th>
                    <th align="left">
                        User Name
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
                    <th width="10px">
                        Rights
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select project_registration.proj_regi_id,project_registration.proj_name,project_registration.proj_user_name,project_registration.proj_location,user_management.type,user_management.user_status,user_management.user_name,rights.view_r,rights.insert_r,rights.update_r,rights.delete_r,rights.user_id from Project_Registration  left join user_management on user_management.proj_id=project_registration.proj_regi_id  left join rights on user_management.user_id=rights.user_id where user_management.user_status='active' and project_registration.proj_status='active'"; %>
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
                    <%if (Convert.ToDouble(dr.GetValue(7)) == 1) %>
                    <%{ %>
                    <td>
                       <center> <img src="images/right.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                       <center> <img src="images/wrong.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                    <%if (Convert.ToDouble(dr.GetValue(8)) == 1) %>
                    <%{ %>
                    <td>
                       <center> <img src="images/right.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                       <center> <img src="images/wrong.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                    <%if (Convert.ToDouble(dr.GetValue(9)) == 1) %>
                    <%{ %>
                    <td>
                       <center> <img src="images/right.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                       <center> <img src="images/wrong.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                   <%if (Convert.ToDouble(dr.GetValue(10)) == 1) %>
                    <%{ %>
                    <td>
                       <center> <img src="images/right.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                    <%else
    { %>
                    <td>
                       <center> <img src="images/wrong.jpg" width="30px" height="30px" /></center>
                    </td>
                    <%} %>
                     <%if (dr.GetString(4) == "n/a") %>
                    <%{ %>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="#" class="round blue my_button  text-upper" onclick="right();">
                                Rights</a>
                        </center>
                    </td>
                    <%} %>
                    <%else
    { %>
                         <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Manage_Rights.aspx?id=<%=dr.GetString(0) %>&id1=<%=dr.GetString(11) %>" class="round blue my_button  text-upper">
                                Rights</a>
                        </center>
                    </td>
                    <%} %>
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

