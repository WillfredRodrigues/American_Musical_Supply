<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="View_Customer1.aspx.cs" Inherits="View_Customer1" %>

 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
 
        <script type="text/javascript">

            function total1() {

                var area = document.getElementById("<%=txtarea.ClientID %>");

                var rate = document.getElementById("<%=txtrate.ClientID %>");
                var k = parseFloat(area.value);
                var k1 = parseFloat(rate.value);
                var m = (k * k1).toString();
                document.getElementById("<%=txtamount.ClientID %>").value = m;

                document.getElementById("<%=txtam.ClientID %>").value = m;
            }
            function total2() {

                var area = document.getElementById("<%=txtdevchrg.ClientID %>");
                var area1 = document.getElementById("<%=txtsctchrg.ClientID %>");
                var area2 = document.getElementById("<%=txtstvat.ClientID %>");
                var area3 = document.getElementById("<%=txtagree.ClientID %>");
                var area4 = document.getElementById("<%=txtdocu.ClientID %>");
                var area5 = document.getElementById("<%=txtmain10.ClientID %>");
                var area6 = document.getElementById("<%=txtduty.ClientID %>");
                var area7 = document.getElementById("<%=txtother.ClientID %>");
                var area8 = document.getElementById("<%=txtamount.ClientID %>");
                if (area.value.length == 0) {
                    area.value = 0;
                }
                if (area1.value.length == 0) {
                    area1.value = 0;
                }
                if (area2.value.length == 0) {
                    area2.value = 0;
                }
                if (area3.value.length == 0) {
                    area3.value = 0;
                }
                if (area4.value.length == 0) {
                    area4.value = 0;
                }
                if (area5.value.length == 0) {
                    area5.value = 0;
                }
                if (area6.value.length == 0) {
                    area6.value = 0;
                }
                if (area7.value.length == 0) {
                    area7.value = 0;
                }
                var x = parseFloat(area.value);
                var y = parseFloat(area1.value);
                var y1 = parseFloat(area2.value);
                var y2 = parseFloat(area3.value);
                var y3 = parseFloat(area4.value);
                var y4 = parseFloat(area5.value);
                var y5 = parseFloat(area6.value);
                var y6 = parseFloat(area7.value);
                var y7 = parseFloat(area8.value);
                var h = (x + y + y1 + y2 + y3 + y4 + y5 + y6 + y7).toString();
                document.getElementById("<%=txttotal.ClientID %>").value = h;
                document.getElementById("<%=txtam1.ClientID %>").value = h;

            }
            function total10() {

                var area = document.getElementById("<%=TextBox1.ClientID %>");

                var rate = document.getElementById("<%=txttotal.ClientID %>");
                var k = document.getElementById("<%=TextBox2.ClientID %>");
                if (rate.value - area.value < 0) {
                    area.value = 0;
                    k.value = rate.value - area.value;
                    alert("You Have Entered Value More Than Total");

                }
                else {
                    var x = parseFloat(area.value);
                    var y = parseFloat(rate.value);
                    var j = (y - x).toString();
                    document.getElementById("<%=TextBox2.ClientID %>").value = j;
                    document.getElementById("<%=txtam2.ClientID %>").value = j;
                }

            }
            function SelectName1(url) {

                window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


            }
           
        </script>
       <div class="side-menu fl">
        <h3>
            Quick Links</h3>
        <ul>
       <%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
        <li><a href="View_Customer.aspx" class="active-tab dashboard-tab">View Customer</a></li>
        <%} %>
         <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Customer_Entry.aspx" class="active-tab dashboard-tab">Create Customer</a></li>
            <%} %>
             <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Customer.aspx" class="active-tab dashboard-tab">Update Customer</a></li>
            <%} %>
             <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Customer.aspx" class="active-tab dashboard-tab">Delete Customer</a></li>
            <%} %>
        </ul>
    </div>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="Server">
 <%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="ledger"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>

    <div class="side-content fr" >
        <div class="content-module">
            <div class="content-module-heading cf">
                <h3 class="fl">
                    Sales</h3>
                <span class="fr expand-collapse-text">Click to collapse</span> <span class="fr expand-collapse-text initial-expand">
                    Click to expand</span>
            </div>
            
            <asp:Panel ID="en" runat="server">
                <center>
                    <table>
                        <tr>
                            <td>
                                Select Ledger Group:(<a href="#" onclick="SelectName1('AddGroup.aspx'); return false;">Create New Group</a>)
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="ledger" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <asp:HiddenField ID="ledgerid" runat="server" ClientIDMode="Static" />
                                <asp:HiddenField ID="ledstatus" runat="server" ClientIDMode="Static" />
                            </td>
                            <td>
                                Complex name:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="cn" runat="server" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Building Name:
                            </td>
                            <td>
                               <asp:TextBox Enabled="false" ID="bn" runat="server" ></asp:TextBox>
                            </td>
                            <td>
                                Building No:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" ID="txtbldgno" runat="server" class="round" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Wing:
                            </td>
                            <td>
                               <asp:TextBox Enabled="false" ID="wing" runat="server" ></asp:TextBox>
                            </td>
                            <td>
                                Flat Floor:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="ff" runat="server" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Flat No:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="fn" runat="server" ></asp:TextBox>
                            </td>
                            <td>
                                Flat Type:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtflattype"
                                    runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Flat Area:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtarea"
                                    runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td>
                                Rate:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtrate"
                                    runat="server" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Amount:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false"  CssClass=" round" Width="180px" Height="25px" ID="txtamount" 
                                    runat="server" ></asp:TextBox>
                                    <asp:HiddenField ID="txtam" runat="server" />
                            </td>
                            <td>
                                Booking Date:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtbdate"
                                    runat="server" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtname"
                                    runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                Mobile No(1):
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob1"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mobile(2):<br />
                                (optional)
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob2"
                                    runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Email:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtemail"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Current Address:
                            </td>
                            <td>
                                <textarea Disabled="true" id="txtcaddress" runat="server" style="width: 180px; height: 25px"></textarea>
                            </td>
                            <td>
                                Permanent address:
                            </td>
                            <td>
                                <textarea Disabled="true" id="txtpaddress" runat="server" style="width: 180px; height: 25px"></textarea><br />
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Development Charge:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtdevchrg"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                            <td>
                                Society Charge:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtsctchrg"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Stvat:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtstvat"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                            <td>
                                Agreement Charge:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtagree"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Document Charge:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtdocu"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                            <td>
                                Maintainence:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmain10"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Stamp Duty:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtduty"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                            <td>
                                Other:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtother"
                                    runat="server" onchange="total2()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Total:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txttotal"
                                    runat="server" ReadOnly="true" ></asp:TextBox>
                                    <asp:HiddenField ID="txtam1" runat="server" />
                            </td>
                            <td>
                                Paid:
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="TextBox1"
                                    runat="server" onchange="total10()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Balance:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="TextBox2"
                                    runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="txtam2" runat="server" />
                            </td>
                            <td>
                                Aggrement Value:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="av"
                                    runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="hav" runat="server" />
                            </td>
                            </tr>
                            <tr>
                            <td>
                                OCR:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="ocr"
                                    runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                            </td>
                            <td>
                                Em:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="em"
                                    runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                            </td>
                            </tr>
                            <tr>
                             <td>
                                Loan:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="loan"
                                    runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="HiddenField3" runat="server" />
                            </td>
                            <td>
                                Comment:
                            </td>
                            <td>
                                <textarea id="txtcomment" runat="server" disabled="disabled"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <center>
                                 <asp:Button CssClass="round" runat="server" ID="btned" Text="Edit" 
                                        onclick="btned_Click" />
                                    <asp:Button CssClass="round" runat="server" ID="btnSub" Text="OK" 
                                        /></center>
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


