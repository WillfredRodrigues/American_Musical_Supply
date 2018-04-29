<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true"
    CodeFile="Purchase.aspx.cs" Inherits="Purchase" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
    <script type="text/javascript">


        function total1() {

            var area = document.getElementById("<%=txtqty.ClientID %>").value;

            var rate = document.getElementById("<%=txtrate.ClientID %>").value;

            document.getElementById("<%=txtamt.ClientID %>").value = area * rate;
            document.getElementById("<%=amt.ClientID %>").value = area * rate;

        }
       
        function SelectName(url) {

            window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


        }
        function SelectName1(url) {

            window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


        }
    
    </script>
    <div class="side-menu fl">
        <h3>
            Quick Links</h3>
        <ul>
        <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Purchase.aspx" class="active-tab dashboard-tab">Create Purchase</a></li>
            <%} %>
           <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Purchase1.aspx" class="active-tab dashboard-tab">Update Purchase</a></li>
            <%} %>
            <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Purchase1.aspx" class="active-tab dashboard-tab">Delete Purchase</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
<%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtmname"
        ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers2" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtqtype"
        ID="AutoCompleteExtender3" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers3" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtvname"
        ID="AutoCompleteExtender4" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers4" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtpurby"
        ID="AutoCompleteExtender5" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
    
    <div class="side-content fr">
        <div class="content-module">
            <div class="content-module-heading cf">
                <h3 class="fl">
                    Sales</h3>
                <span class="fr expand-collapse-text">Click to collapse</span> <span class="fr expand-collapse-text initial-expand">
                    Click to expand</span>
            </div>
            <asp:Panel ID="en" runat="server" ClientIDMode="Static">
                <center>
                    <table>
                        
                        <tr>
                            <td>
                                Material Name:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmname"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                Quantity:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtqty"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Quantity Type:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtqtype"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                Rate:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtrate"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Amount:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtamt"
                                    runat="server" ReadOnly="true"></asp:TextBox>
                                    <asp:HiddenField ID="amt" runat="server" />
                            </td>
                            <td>
                                Vendor Name:(<a href="#" onclick="SelectName('Add_Ledger.aspx?id=txtvname&id1=<%=val %>&id2=Vendor'); return false;">Create
                                    New</a>)
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtvname"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                     
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Vendor Address:
                            </td>
                            <td>
                                <textarea id="txtadd" runat="server" cssclass=" round" width="180px" height="25px"></textarea>
                            </td>
                            <td>
                                Vendor Mobile:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Purchased By:(<a href="#" onclick="SelectName('Add_Ledger.aspx?id=txtpurby&id1=<%=val %>&id2=Purchaser'); return false;">Create
                                    New</a>)
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtpurby"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                   
                            </td>
                            
                       
                       
                      
                       
                            <td>
                                Type Of Purchase:
                            </td>
                            <td>
                                <asp:DropDownList ID="type" runat="server" CssClass=" round" Width="180px" Height="25px">
                                    <asp:ListItem>Site</asp:ListItem>
                                    <asp:ListItem>Office</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Purchase Date:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtpdate"
                                    runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Challan No:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="challan"
                                    runat="server"></asp:TextBox>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                Bill No:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="bill"
                                    runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Comment:
                            </td>
                            <td>
                                <textarea id="txtcomment" runat="server" cssclass=" round" width="180px" height="25px"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <center>
                                    <asp:Button CssClass="round" runat="server" ID="btnSub" Text="SUbmit" OnClick="btnSub_Click" /></center>
                            </td>
                        </tr>
                    </table>
                </center>
            </asp:Panel>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
