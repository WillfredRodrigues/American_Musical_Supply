<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_Purchase.aspx.cs" Inherits="Delete_Purchase" %>

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
   <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
    <div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete Purchase Information</u></b></font></center></div>
          <br />
            <asp:Panel ID="en" runat="server" ClientIDMode="Static">
                <center>
                    <table>
                        <asp:HiddenField ID="i11" runat="server" />
                         <asp:HiddenField ID="mat1" runat="server" />
                         <asp:HiddenField ID="vn1" runat="server" />
                          <asp:HiddenField ID="pb1" runat="server" />
                          <asp:HiddenField ID="bp1" runat="server" />
                        <tr>
                            <td>
                                Material Name:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmname"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                Quantity:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtqty"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Quantity Type:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtqtype"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                Rate:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtrate"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Amount:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtamt"
                                    runat="server" ReadOnly="true"></asp:TextBox>
                                    <asp:HiddenField ID="amt" runat="server" />
                            </td>
                            <td>
                                Vendor Name:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtvname"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                     
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Vendor Address:
                            </td>
                            <td>
                                <textarea id="txtadd" runat="server" cssclass=" round" width="180px" height="25px" disabled="disabled"></textarea>
                            </td>
                            <td>
                                Vendor Mobile:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Purchased By:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtpurby"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                                   
                            </td>
                            
                       
                       
                      
                       
                            <td>
                                Type Of Purchase:
                            </td>
                            <td>
                                <asp:DropDownList ID="type" runat="server" CssClass=" round" Width="180px" Height="25px" Enabled="false">
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
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtpdate"
                                    runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Challan No:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="challan"
                                    runat="server"></asp:TextBox>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                Bill No:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="bill"
                                    runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Comment:
                            </td>
                            <td>
                                <textarea id="txtcomment" runat="server" cssclass=" round" width="180px" height="25px" disabled="disabled"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <center>
                                    <asp:Button CssClass="round" runat="server" ID="btnSub" Text="Delete" 
                                        onclick="btnSub_Click"  /></center>
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
