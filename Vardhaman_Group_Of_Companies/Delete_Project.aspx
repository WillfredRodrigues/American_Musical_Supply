<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Delete_Project.aspx.cs" Inherits="Delete_Project" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
<%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
    <script type="text/javascript">
        function proj() {
            alert('New Project Successfully Created');
        }
        function table() {
            alert('Tables Successfully Created');
        }
    </script>
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="DropDownList1"
        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
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
                                <asp:Label ID="Label14" runat="server" Text="SEARCH PROJECT"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DropDownList1" runat="server" AutoPostBack="true" OnTextChanged="DropDownList1_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 241px; height: 56px;">
                                <asp:Label ID="Label7" runat="server" Text="Project Name:"></asp:Label>
                            </td>
                            <td style="width: 241px; height: 56px;">
                                <asp:TextBox AutoComplete="off" ID="TextBox1" runat="server" AccessKey="P" CssClass=" round"
                                    Width="210px" Height="25px" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 241px; height: 56px;">
                                <asp:Label ID="Label9" runat="server" Text="Project Location:"></asp:Label>
                            </td>
                            <td style="width: 241px; height: 56px;">
                                <asp:TextBox AutoComplete="off" ID="TextBox3" Enabled="false" runat="server" CssClass=" round" Width="210px"
                                    Height="25px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 241px; height: 56px;">
                                <asp:Label ID="Label1" runat="server" Text="Status:"></asp:Label>
                            </td>
                            <td style="width: 241px; height: 56px;">
                                <asp:TextBox ID="TextBox4" Enabled="false" runat="server" CssClass=" round" Width="210px" Height="25px" ReadOnly="true">
                                    
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </center>
                <center>
                    <asp:Button ID="submit" runat="server" Text="Delete" 
                        CssClass="round blue my_button  text-upper" onclick="submit_Click"  />
                </center>
            </div>
            <!-- end content-module-main -->
        </div>
        <!-- end content-module -->
    </div>
    <%} %>
</asp:Content>
