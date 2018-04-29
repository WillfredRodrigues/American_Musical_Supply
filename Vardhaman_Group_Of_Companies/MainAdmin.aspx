<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true"
    CodeFile="MainAdmin.aspx.cs" Inherits="Default3" %>

<%-- Add content controls here --%>
<asp:Content ContentPlaceHolderID="side" runat="server">
     <div class="side-menu fl">
        
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
    <!-- end side-menu -->
</asp:Content>
<asp:Content ContentPlaceHolderID="main" runat="server">
    <div class="side-content fr">
        <div class="content-module">
           <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
                <div style="float: left">
                    <img src="upload/wel.jpg" />
                </div>
                <div style="float: left; margin-top: 50px;">
                    <font style="font-family: 'Courier New', Courier, monospace; font-size: 20px; font-weight: lighter;
                        color: #008000">
                        <%=Session["logged_in"].ToString() %></font></div>
                       
            </div>
            <!-- end content-module-main -->
        </div>
        <!-- end content-module -->
    </div>
    <!-- end full-width -->
</asp:Content>
