<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Task_Sub.aspx.cs" Inherits="Task_Sub" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">

    <div class="side-menu fl">
        
        <ul>
       
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Task_Main.aspx" class="purchase-tab">Main Task</a></li>
             <li><a href="Task_Sub.aspx" class="purchase-tab">Sub Task</a></li>
            
            <%} %>
             <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Task.aspx" class="purchase-tab">Update Task</a></li>
            <%} %>
              <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Task.aspx" class="purchase-tab">Delete Task</a></li>
            <%} %>
        </ul>
    </div>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="maint"
        ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
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
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Sub Task Assignment</u></b></font></center>
            </div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
           
            </div>
            <asp:Panel ID="pan1" runat="server" style="margin-top:5px">
         <center>
                    <table>
                    <tr>
                            <td>
                                Main Task:
                            </td>
                            <td>
                                <asp:TextBox ID="maint" runat="server" CssClass="round"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Task Name:
                            </td>
                            <td> 
                                <asp:TextBox ID="name" runat="server" CssClass="round" AutoComplete="Off"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                From Date:
                            </td>
                            <td>
                                <asp:TextBox ID="frmdate" runat="server" CssClass="round" AutoComplete="Off"></asp:TextBox>
                                
      
        <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender3" TargetControlID="frmdate" runat="server">
        </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                To Date:
                            </td>
                            <td>
                                <asp:TextBox ID="todate" runat="server" CssClass="round" AutoComplete="Off"></asp:TextBox>
                                
      
        <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" TargetControlID="todate" runat="server">
        </cc1:CalendarExtender>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                About Task:
                            </td>
                            <td>
                                <textarea id="desc" runat="server" class="round" AutoComplete="Off"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Assigned To:
                            </td>
                            <td>
                                <asp:TextBox ID="ass" runat="server" CssClass="round" AutoComplete="Off"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </center>
                <br />
                <center><asp:Button CssClass="round" runat="server" ID="Button1" Text="Create" 
                                     onclick="Button1_Click" /></center>
            </asp:Panel>
            
            
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


