<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_Task1.aspx.cs" Inherits="Delete_Task1" %>

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
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete Task Information</u></b></font></center>
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
                                Task Name:
                            </td>
                            <td> 
                                <asp:Textbox Enabled="false"    ID="name" runat="server" CssClass="round" AutoComplete="Off"></asp:Textbox >
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                From Date:
                            </td>
                            <td>
                                <asp:Textbox Enabled="false"    ID="frmdate" runat="server" CssClass="round" AutoComplete="Off"></asp:Textbox >
                                
      
      
                            </td>
                        </tr>
                        <tr>
                            <td>
                                To Date:
                            </td>
                            <td>
                                <asp:Textbox Enabled="false"    ID="todate" runat="server" CssClass="round" AutoComplete="Off"></asp:Textbox >
                                
      
      
                            </td>
                        </tr>
                         <tr>
                            <td>
                                About Task:
                            </td>
                            <td>
                                <textarea id="desc" runat="server" class="round" AutoComplete="Off" disabled="disabled"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Assigned To:
                            </td>
                            <td>
                                <asp:Textbox Enabled="false"    ID="ass" runat="server" CssClass="round" AutoComplete="Off"></asp:Textbox >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Status:
                            </td>
                            <td>
                                <asp:Textbox Enabled="false"    ID="stat" runat="server" CssClass="round" AutoComplete="Off"></asp:Textbox >
                            </td>
                        </tr>
                    </table>
                </center>
                <br />
                <center><asp:Button CssClass="round" runat="server" ID="Button1" Text="Delete" 
                                     onclick="Button1_Click" /></center>
            </asp:Panel>
            
            
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


