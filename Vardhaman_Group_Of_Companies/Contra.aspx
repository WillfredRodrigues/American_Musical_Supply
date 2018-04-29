﻿<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Contra.aspx.cs" Inherits="Contra" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
<script type="text/javascript">
    function SelectName1(url) {

        window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=410,height=180,left=490,top=300');


    }
</script>
    <div class="side-menu fl">
        
        <ul>
       <%if (Session["rightView"].ToString() == "1") %>
            <%{ %>
           <li><a href="Data_Entry_Home.aspx" class="active-tab dashboard-tab">Day Book</a></li>
            <%} %>
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Purchase_Home.aspx" class="purchase-tab">Purchase</a></li>
             <li><a href="Sales_Home.aspx" class="purchase-tab">Sales</a></li>
            <li><a href="Payment_Entry.aspx" class="active-tab dashboard-tab">Payment</a></li>
            <li><a href="Receipt_Entry.aspx" class="active-tab dashboard-tab">Receipt</a></li>
            <li><a href="Contra.aspx" class="active-tab dashboard-tab">Contra</a></li>
            <li><a href="Journal.aspx" class="active-tab dashboard-tab">Journal</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
<%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtname"
        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
     <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtacc"
        ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
  <div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Add Contra Information</u></b></font></center></div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
              
            </div>

            <center><table>
            <tr>
                
                
                <td>
                   Account:(<a href="#" onclick="SelectName1('Add_Account.aspx'); return false;">Create New</a>)
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtacc" runat="server" AutoPostBack="true" 
                        ontextchanged="txtacc_TextChanged"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
            runat="server" ErrorMessage="Required" ControlToValidate="txtacc" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                 <td>
                   Balance:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtaccbal" runat="server" Enabled="false"></asp:TextBox>
                      
                </td>
                 </tr>
                <tr>
                <td>
                    Name:(<a href="#" onclick="SelectName1('Add_Account.aspx'); return false;">Create New</a>)
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtname" runat="server" AutoPostBack="true" 
                        ontextchanged="txtname_TextChanged"></asp:TextBox>
                        <asp:HiddenField ID="name" runat="server" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            runat="server" ErrorMessage="Required" ControlToValidate="txtname" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
                <td>
                   Balance:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbal" runat="server" Enabled="false"></asp:TextBox>
                </td>
                 </tr>
                <tr>
                <td>
                    Payment Date:
                </td>
                <td>
                 
        
      <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtdate"
                                    runat="server" ></asp:TextBox>
        <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" TargetControlID="txtdate" runat="server">
        </cc1:CalendarExtender>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            runat="server" ErrorMessage="Required" ControlToValidate="txtdate" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    Amount:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtamt" runat="server" ></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
            runat="server" ErrorMessage="Required" ControlToValidate="txtamt" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td>
                    Mode Of Payment:
                </td>
                <td>
                    <asp:DropDownList ID="mode" runat="server" Width="175px" Height="25px">
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>DD</asp:ListItem>
                        <asp:ListItem>NEFT</asp:ListItem>
                        <asp:ListItem>RTGS</asp:ListItem>
                    </asp:DropDownList>
                </td>
           
                <td>
                     Cheque/DD No:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtchkddno" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td>
                   Cheque/DD Date:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtchkdddate" runat="server"></asp:TextBox>
                </td>
                
                <td>
                    Bank Name:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtbn" runat="server"></asp:TextBox>
                </td>    
                 </tr>
                <tr>
                
                           <td>
                     Narration:
                </td>
                <td>
                    <textarea id="txtnara" runat="server"></textarea>
                </td>
                

                              <td>
                     Description:
                </td>
                <td>
                    <textarea id="txtdesc" runat="server"></textarea>
                </td>
            </tr>
         
        </table></center>
                    <center>
                        <asp:Button ID="submit" runat="server" Text="Submit"  
                            CssClass="round blue my_button  text-upper" onclick="submit_Click" />
                       
                    </center>
             <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
