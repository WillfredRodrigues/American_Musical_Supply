<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales" %>

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

            window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=380,height=150,left=490,top=300');


        }
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
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Add Sales Information</u></b></font></center></div>
           <br />
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
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            runat="server" ErrorMessage="Required" ControlToValidate="txtmname" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Quantity:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtqty"
                                    runat="server" onchange="total1()" ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
            runat="server" ErrorMessage="Required" ControlToValidate="txtqty" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Quantity Type:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtqtype"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            runat="server" ErrorMessage="Required" ControlToValidate="txtqtype" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Rate:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtrate"
                                    runat="server" onchange="total1()" ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
            runat="server" ErrorMessage="Required" ControlToValidate="txtrate" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                Buyer Name:(<a href="#" onclick="SelectName('Add_Ledger.aspx?id=txtvname&id1=<%=val %>&id2=Buyer'); return false;">Create
                                    New</a>)
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtvname"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
            runat="server" ErrorMessage="Required" ControlToValidate="txtvname" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Buyer Address:
                            </td>
                            <td>
                                <textarea id="txtadd" runat="server" cssclass=" round" width="180px" height="25px"></textarea>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
            runat="server" ErrorMessage="Required" ControlToValidate="txtadd" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Buyer Mobile:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob"
                                    runat="server"  ></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                Sold By:(<a href="#" onclick="SelectName('Add_Ledger.aspx?id=txtpurby&id1=<%=val %>&id2=Seller'); return false;">Create
                                    New</a>)
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtpurby"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
            runat="server" ErrorMessage="Required" ControlToValidate="txtpurby" ForeColor="Red"></asp:RequiredFieldValidator>
                                   
                            </td>
                            
                       
                       
                      
                       
                            <td>
                                Type Of Sale:
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
                                Sale Date:
                            </td>
                            <td>
                                
        
      <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtpdate"
                                    runat="server"></asp:TextBox>
        <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" TargetControlID="txtpdate" runat="server">

        </cc1:CalendarExtender>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
            runat="server" ErrorMessage="Required" ControlToValidate="txtpdate" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Challan No:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="challan"
                                    runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
            runat="server" ErrorMessage="Required" ControlToValidate="challan" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                Bill No:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="bill"
                                    runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
            runat="server" ErrorMessage="Required" ControlToValidate="bill" ForeColor="Red"></asp:RequiredFieldValidator>
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
