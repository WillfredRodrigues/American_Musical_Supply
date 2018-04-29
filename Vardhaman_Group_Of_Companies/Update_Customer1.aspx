<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true" CodeFile="Update_Customer1.aspx.cs" Inherits="Update_Customer1" %>
  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
 
        <script type="text/javascript">
            function SelectName(url) {

                window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


            }
            function total1() {

                var area10 = document.getElementById("<%=txtarea.ClientID %>");
                var rate = document.getElementById("<%=txtrate.ClientID %>");
                var area = document.getElementById("<%=txtdevchrg.ClientID %>");
                var area1 = document.getElementById("<%=txtsctchrg.ClientID %>");
                var area2 = document.getElementById("<%=txtstvat.ClientID %>");
                var area3 = document.getElementById("<%=txtagree.ClientID %>");
                var area4 = document.getElementById("<%=txtdocu.ClientID %>");
                var area5 = document.getElementById("<%=txtmain10.ClientID %>");
                var area6 = document.getElementById("<%=txtduty.ClientID %>");
                var area7 = document.getElementById("<%=txtother.ClientID %>");

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
                if (area10.value.length == 0) {
                    area10.value = 0;
                }
                if (rate.value.length == 0) {
                    rate.value = 0;
                }
                var k = parseFloat(area10.value);
                var k1 = parseFloat(rate.value);
                var x = parseFloat(area.value);
                var y = parseFloat(area1.value);
                var y1 = parseFloat(area2.value);
                var y2 = parseFloat(area3.value);
                var y3 = parseFloat(area4.value);
                var y4 = parseFloat(area5.value);
                var y5 = parseFloat(area6.value);
                var y6 = parseFloat(area7.value);

                var m = (k * k1).toString();
                var h = (x + y + y1 + y2 + y3 + y4 + y5 + y6).toString();
                var tot = parseFloat(m) + parseFloat(h);
                document.getElementById("<%=txtamount.ClientID %>").value = m;

                document.getElementById("<%=txtam.ClientID %>").value = m;
                document.getElementById("<%=txttotal.ClientID %>").value = tot;
                document.getElementById("<%=txtam1.ClientID %>").value = tot;

            }


            function SelectName1(url) {

                window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


            }
            function chk() {
                var d = document.getElementById('<%=txtcaddress.ClientID %>').value;
                document.getElementById('<%=txtpaddress.ClientID %>');
                var f = document.getElementById('<%=chk1.ClientID %>');
                if (f.checked == true) {
                    document.getElementById('<%=txtpaddress.ClientID %>').value = d;
                }
                document.getElementById("<%=txtdevchrg.ClientID %>").focus();
            }
            function tot() {

                var area = document.getElementById("<%=txtamount.ClientID %>");

                var rate = document.getElementById("<%=av.ClientID %>");
                var k = document.getElementById("<%=em.ClientID %>");
                if (area.value - rate.value < 0) {
                    rate.value = 0;
                    k.value = area.value - rate.value;
                    alert("You Have Entered Value More Than Total");

                }
                else {
                    var x = parseFloat(area.value);
                    var y = parseFloat(rate.value);
                    var j = (x - y).toString();
                    document.getElementById("<%=em.ClientID %>").value = j;
                    document.getElementById("<%=hem.ClientID %>").value = j;
                }

            }
            function tot1() {

                var area = document.getElementById("<%=av.ClientID %>");

                var rate = document.getElementById("<%=loan.ClientID %>");
                var k = document.getElementById("<%=ocr.ClientID %>");
                if (area.value - rate.value < 0) {
                    rate.value = 0;
                    k.value = area.value - rate.value;
                    alert("You Have Entered Value More Than Total");

                }
                else {
                    var x = parseFloat(area.value);
                    var y = parseFloat(rate.value);
                    var j = (x - y).toString();
                    document.getElementById("<%=ocr.ClientID %>").value = j;
                    document.getElementById("<%=hocr.ClientID %>").value = j;
                }

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

<%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
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
                                Complex name:
                            </td>
                            <td>
                                <asp:DropDownList Height="25px" Width="180px" ID="complex" runat="server" AutoPostBack="true"
                                    CssClass="round" OnSelectedIndexChanged="complex_SelectedIndexChanged">
                                    <asp:ListItem Text="---Select Complex---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                Building Name:
                            </td>
                            <td>
                                <asp:DropDownList Height="25px" Width="180px" ID="building" runat="server" AutoPostBack="true"
                                    CssClass="round" OnSelectedIndexChanged="building_SelectedIndexChanged">
                                    <asp:ListItem Text="---Select Building---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                             </tr>
                        <tr>
                            <td>
                                Building No:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" ID="txtbldgno" runat="server" class="round" ReadOnly="true"></asp:TextBox>
                            </td>
                       
                            <td>
                                Wing:
                            </td>
                            <td>
                                <asp:DropDownList Height="25px" Width="180px" ID="wing" runat="server" AutoPostBack="true"
                                    CssClass="round" OnSelectedIndexChanged="wing_SelectedIndexChanged">
                                    <asp:ListItem Text="---Select Wing---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                             </tr>
                        <tr>
                            <td>
                                Flat Floor:
                            </td>
                            <td>
                                <asp:DropDownList Height="25px" Width="180px" ID="floor" runat="server" AutoPostBack="true"
                                    CssClass="round" OnSelectedIndexChanged="floor_SelectedIndexChanged">
                                    <asp:ListItem Text="---Select Floor---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                       
                            <td>
                                Flat No:
                            </td>
                            <td>
                                <asp:DropDownList Height="25px" Width="180px" ID="flatno" runat="server" AutoPostBack="true"
                                    CssClass="round" OnSelectedIndexChanged="flatno_SelectedIndexChanged">
                                    <asp:ListItem Text="---Select Flat No---" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                Flat Type:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtflattype"
                                    runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                        
                        
                            <td>
                                Flat Area:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtarea"
                                    runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                Rate:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtrate"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                        
                        
                            <td>
                                Amount:
                            </td>
                           
                            <td>
                                <asp:TextBox  CssClass=" round" Width="180px" Height="25px" ID="txtamount" Enabled="false"
                                    runat="server" ></asp:TextBox>
                                    <asp:HiddenField ID="txtam" runat="server" />
                            </td>
                             </tr>
                            <tr>
                            <td>
                                Booking Date:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtbdate"
                                    runat="server"></asp:TextBox>
                            </td>
                       
                            <td>
                                Name:(<a href="#" onclick="SelectName('Add_Ledger1.aspx?id=txtname&id1=nid&id2=nname&id3=cname'); return false;">Create
                                    New</a>)
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtname"
                                    runat="server" ClientIDMode="Static" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField id="cname" runat="server" ClientIDMode="Static" />
                                   <asp:HiddenField id="nid" runat="server" ClientIDMode="Static" />
                                   <asp:HiddenField id="nname" runat="server" ClientIDMode="Static" />
                            </td>
                             </tr>
                        <tr>
                            <td>
                                Mobile No(1):
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob1"
                                    runat="server"></asp:TextBox>
                            </td>
                        
                            <td>
                                Mobile(2):<br />
                                (optional)
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmob2"
                                    runat="server"></asp:TextBox>
                            </td>
                            </tr>
                        <tr>
                            <td>
                                Email:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtemail"
                                    runat="server"></asp:TextBox>
                            </td>
                      
                            <td>
                                Current Address:
                            </td>
                            <td>
                                <textarea id="txtcaddress" runat="server" style="width: 180px; height: 25px"></textarea>
                            </td>
                              </tr>
                        <tr>
                            <td>
                                Permanent address:
                            </td>
                            <td>
                                <textarea id="txtpaddress" runat="server" style="width: 180px; height: 25px"></textarea><br />
                                <asp:CheckBox ID="chk1" runat="server"  onchange="chk()" />Same
                                As Current
                            </td>
                       
                            <td>
                                Development Charge:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtdevchrg"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                             </tr>
                        <tr>
                            <td>
                                Society Charge:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtsctchrg"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                        
                            <td>
                                Stvat:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtstvat"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                            </tr>
                        <tr>
                            <td>
                                Agreement Charge:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtagree"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                       
                            <td>
                                Document Charge:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtdocu"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                             </tr>
                        <tr>
                            <td>
                                Maintainence:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtmain10"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                       
                            <td>
                                Stamp Duty:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtduty"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                             </tr>
                        <tr>
                            <td>
                                Other:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txtother"
                                    runat="server" onchange="total1()"></asp:TextBox>
                            </td>
                       
                            <td>
                                Total:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="txttotal"
                                    runat="server" ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="txtam1" runat="server" />
                            </td>
                             </tr>
                        <tr>
                               <td>
                                Aggrement Value:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="av"
                                    runat="server" onchange="tot()"></asp:TextBox>
                                    <asp:HiddenField ID="hav" runat="server" />
                            </td>
                            
                            <td>
                                Em:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="em"
                                    runat="server" ></asp:TextBox>
                                    <asp:HiddenField ID="hem" runat="server" />
                            </td>
                            </tr>
                            <tr>
                            
                            
                            
                             <td>
                                Loan:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="loan"
                                    runat="server" onchange="tot1()"></asp:TextBox>
                                    <asp:HiddenField ID="HiddenField3" runat="server" />
                            </td>
                            
                            <td>
                                OCR:
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="ocr"
                                    runat="server" ></asp:TextBox>
                                    <asp:HiddenField ID="hocr" runat="server" />
                            </td>
                            </tr>
                            <tr>
                            <td>
                                Comment:
                            </td>
                            <td>
                                <textarea id="txtcomment" runat="server"></textarea>
                            </td>
                        
                        </tr>
                            <td colspan="6">
                                <center>
                                    <asp:Button CssClass="round" runat="server" ID="btnSub" Text="Update" OnClick="btnSub_Click" /></center>
                            </td>
                        
                    </table>
                </center>
            </asp:Panel>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
  <asp:HiddenField ID="cn" runat="server" />
   <asp:HiddenField ID="bn" runat="server" />
    <asp:HiddenField ID="wingn" runat="server" />
     <asp:HiddenField ID="floorn" runat="server" />
      <asp:HiddenField ID="flatnon" runat="server" />
       <asp:HiddenField ID="total" runat="server" />
        <asp:HiddenField ID="amount" runat="server" />
         <asp:HiddenField ID="ledid" runat="server" />
          <asp:HiddenField ID="ledname" runat="server" />
            <%} %>
</asp:Content>
