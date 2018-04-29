﻿<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_User.aspx.cs" Inherits="Delete_User" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
<%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="DropDownList1"
        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
<div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete User Information</u></b></font></center></div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
                                   <center>
                        <table>
            <tr>
                            <td style="width: 241px; height: 56px;">
                                <asp:Label ID="Label14" runat="server" Text="Search User"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DropDownList1" runat="server" AutoPostBack="true" 
                                    ontextchanged="DropDownList1_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
            
           <tr>           <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text=" User's Full Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtuserfullname" runat="server" Enabled="false"></asp:TextBox>
                </td>
               
                </tr>
                
                <tr><td>User Type:</td><td><asp:TextBox AutoComplete="off" ID="type" runat="server" Enabled="false"></asp:TextBox></td></tr>
                <tr>
            <td>
                    <asp:Label ID="Label13" runat="server" Text=" User's Status:"></asp:Label>
                </td>
                <td>
                   <asp:TextBox AutoComplete="off" Enabled="false" ID="status" runat="server"></asp:TextBox>
                </td>
                 </tr>
           
        </table>
                    </center>
                    <center>
                        <asp:Button ID="submit" runat="server" Text="Delete"  
                            CssClass="round blue my_button  text-upper" onclick="submit_Click"   />
                       
                    </center>
                
            </div>
            <!-- end content-module-main -->
        </div>
        <!-- end content-module -->
    </div>
    <%} %>
</asp:Content>


