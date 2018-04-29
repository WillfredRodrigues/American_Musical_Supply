<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true"
    CodeFile="Update_Complex1.aspx.cs" Inherits="Update_Complex1" %>
      <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        <h3>
            Quick Links</h3>
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
 <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="cn1"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
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
            </div><center>     
                   <table>
                   <tr>
                    <td>
                        Search Complex Name:
                    </td>
                    <td>
                        <asp:TextBox ID="cn1" runat="server" AutoPostBack="true" 
                            ontextchanged="cn1_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Complex Name:
                    </td>
                    <td>
                        <asp:TextBox ID="cn" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Complex Location:
                    </td>
                    <td>
                        <asp:TextBox ID="cl" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Building Name:
                    </td>
                    <td>
                        <asp:TextBox ID="bn" runat="server"></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                            <td colspan="2">
                                <center>
                                    <asp:Button CssClass="round" runat="server" ID="btnSub" Text="Update" onclick="btnSub_Click" 
                                        /></center>
                            </td>
                        </tr>
            </table>
            </center>

            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
