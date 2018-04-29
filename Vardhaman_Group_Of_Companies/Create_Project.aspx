<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Create_Project.aspx.cs" Inherits="Create_Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="side" Runat="Server">

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
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
<%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
    <script type="text/javascript">
    function proj() {
        alert('New Project Successfully Created');
    }
    function table() {
        alert('Tables Successfully Created');
    }
        </script>
 <div class="side-content fr">
        <div class="content-module">
            <div class="content-module-heading cf">
                <h3 class="fl">
                    Add Sales</h3>
                <span class="fr expand-collapse-text">Click to collapse</span> <span class="fr expand-collapse-text initial-expand">
                    Click to expand</span>
            </div>
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
                                   <center>
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 241px; height: 56px;">
                                    Project Name:
                                </td>
                                <td style="height: 56px; width: 247px">
                                    <asp:TextBox AutoComplete="off" ID="txtprojname" runat="server" AccessKey="p" CssClass=" round"
                                        Width="210px" Height="25px"></asp:TextBox>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="width: 241px; height: 56px;">
                                    Project Location:
                                </td>
                                <td style="height: 56px; width: 247px">
                                    <asp:TextBox AutoComplete="off" ID="txtprojlocation" runat="server" CssClass=" round"
                                        Width="210px" Height="25px"></asp:TextBox>
                                </td>
                                
                            </tr>
                            <tr>
                            <td>Project description</td>
                            <td>
                                <textarea runat="server" id="des" style=" width:210px; height:25px"></textarea>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <center>
                        <asp:Button ID="submit" runat="server" Text="Submit" onclick="submit_Click" CssClass="round blue my_button  text-upper" />
                       
                    </center>
                
            </div>
            <!-- end content-module-main -->
        </div>
        <!-- end content-module -->
    </div>
   <%} %>
</asp:Content>

