<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Update_Payment_Entry1.aspx.cs" Inherits="Update_Payment_Entry1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
<script type="text/javascript">
    function SelectName1(url) {

        window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=400,height=250,left=490,top=300');


    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
 <div class="side-menu fl">
        <h3>
            Quick Links</h3>
        <ul>
        <%if (Session["rightView"].ToString() == "1") %>
            <%{ %>
            <li><a href="Day_Book.aspx" class="active-tab dashboard-tab">Day Book</a></li>
            <%} %>
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
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
     <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtacc"
        ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
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
              
            </div>

            <center><table>
            <tr>
                <asp:HiddenField ID="x1" runat="server" />
                <asp:HiddenField ID="y1" runat="server" />
                <asp:HiddenField ID="y2" runat="server" />
                
                <td>
                   Account:(<a href="#" onclick="SelectName1('Add_Account.aspx'); return false;">Create New</a>)
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtacc" runat="server" AutoPostBack="true" 
                        ontextchanged="txtacc_TextChanged"></asp:TextBox>
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
                    Name:(<a href="#" onclick="SelectName('Add_Ledger.aspx?id=txtname&id1=<%=val %>&id2=Payment'); return false;">Create
                                    New</a>)
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtname" runat="server" AutoPostBack="true" 
                        ontextchanged="txtname_TextChanged"></asp:TextBox>
                        <asp:HiddenField ID="name" runat="server" />
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
                    <asp:TextBox AutoComplete="off" ID="txtdate" runat="server"></asp:TextBox>
                </td>
                <td>
                    Amount:
                </td>
                <td>
                    <asp:TextBox AutoComplete="off" ID="txtamt" runat="server"></asp:TextBox>
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
                        <asp:Button ID="submit" runat="server" Text="Update"  
                            CssClass="round blue my_button  text-upper" onclick="submit_Click" />
                       
                    </center>
             <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

