<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true"
    CodeFile="Project.aspx.cs" Inherits="Project_Registration" %>

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
            <li><a href="Create_Project.aspx" class="active-tab dashboard-tab">Create Project</a></li>
            <%} %>
            <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Project.aspx" class="active-tab dashboard-tab">Update Project</a></li>
            <%} %>
            <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Project.aspx" class="active-tab dashboard-tab">Delete Project</a></li>
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
                        Total Users
                    </th>
                    <th align="left">
                        Total Admin
                    </th>
                    <th align="left">
                        Total Operators
                    </th>
                    <th align="left">
                        Total Active Users
                    </th>
                    <th align="left">
                        Total Disabled
                    </th>
                    <th align="left">
                        Total Deleted Users
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select Project_Registration.proj_name,Project_Registration.proj_user_name,Project_Registration.proj_location,COUNT(user_management.type)as g,coalesce((select count(user_management.type) where user_management.type='project admin'),0)as g1,coalesce((select count(user_management.type) where user_management.type='user'),0)as g1,coalesce((select count(user_management.type) where user_management.user_status='active'),0)as g1,coalesce((select count(user_management.type) where user_management.user_status='disabled'),0)as g1,coalesce((select count(user_management.type) where user_management.deletion_date!=''),0)as g1 from Project_Registration left join user_management on Project_Registration.proj_regi_id=user_management.proj_id group by Project_Registration.proj_name,Project_Registration.proj_user_name,Project_Registration.proj_location,user_management.type,user_management.user_status,user_management.deletion_date"; %>
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
                        <%Response.Write(dr.GetString(0));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(1));%>
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
                        <%Response.Write(dr.GetValue(5));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(6));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(7));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(8));%>
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
