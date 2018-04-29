<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_Usage.aspx.cs" Inherits="Delete_Usage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" Runat="Server">

<script type = "text/javascript">
    function SelectName(url) {

        window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


    }
    function SelectName1(url) {

        window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


    }
    function total10() {

        var area = document.getElementById("<%=txtqty.ClientID %>");

        var rate = document.getElementById("<%=avail.ClientID %>");
        var k = document.getElementById("<%=txtbmat.ClientID %>");
        if (area.value.length == 0) {
            area.value = 0;
        }
        if (rate.value - area.value < 0) {
            area.value = 0;
            k.value = rate.value - area.value;
            alert("You Have Entered Value More Than Available");

        }
        else {
            var x = parseFloat(area.value);
            var y = parseFloat(rate.value);

            document.getElementById("<%=txtbmat.ClientID %>").value = y - x;
            document.getElementById("<%=bal.ClientID %>").value = y - x;
        }

    }
</script>
<div class="side-menu fl">
       
        <ul>
         <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Usage.aspx" class="active-tab dashboard-tab">Create Usage</a></li>
            <%} %>
             <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_usage1.aspx" class="active-tab dashboard-tab">Update Usage</a></li>
            <%} %>
             <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Usage1.aspx" class="active-tab dashboard-tab">Delete Usage</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
 <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
   
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers2" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtmname"
        ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtqtype"
        ID="AutoCompleteExtender3" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers4" MinimumPrefixLength="1"
        CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtuby"
        ID="AutoCompleteExtender4" runat="server" FirstRowSelected="false">
    </cc1:AutoCompleteExtender>
   
<div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete Usage Information</u></b></font></center></div>
           <br />
   <center> <table>
   <tr>
                           <td>
                     Material Name:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px"  
                        ID="txtmname" runat="server"></asp:TextBox>
                </td>
                            <td>Quantity Available:</td>
                            <td><asp:TextBox Enabled="false"  ID="avail" runat="server" ReadOnly="true"></asp:TextBox></td>
           
                </tr>
                <tr>
                <td>
                     Quantity:
                </td>
              
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px"  ID="txtqty" runat="server" onchange="total10()"></asp:TextBox>
                </td>
                
                <td>
                     Quantity Type:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px"  ID="txtqtype" runat="server"></asp:TextBox>
                </td>
           </tr>
                <tr>
                <td>
                     Used By:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px"  ID="txtuby" runat="server" ClientIDMode="Static"></asp:TextBox>
                 
                </td>
               
                <td>
                     Balance Material:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px"  ID="txtbmat" runat="server" ReadOnly="true"></asp:TextBox>
                    <asp:HiddenField ID="bal" runat="server" />
                </td>
                  </tr>
                <tr>
                
                <td>
                     Balance Material Type:
                </td>
                                <td>
                    <asp:DropDownList ID="type" runat="server" CssClass=" round" Width="180px" Height="25px" Enabled="false">
                        <asp:ListItem>Site</asp:ListItem>
                        <asp:ListItem>Office</asp:ListItem>
                    </asp:DropDownList>
                </td>
               
                <td>
                     Usage Date:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" CssClass=" round" Width="180px" Height="25px"  ID="txtudate" runat="server"></asp:TextBox>
                </td>
                  </tr>
                <tr>
                <td>
                     Comment:
                </td>
                <td>
                    <textarea id="txtcomment" runat="server" CssClass=" round" Width="180px" Height="25px" disabled="disabled" ></textarea>
                </td>
            </tr>
            <tr><td colspan="4"><center>
                <asp:Button CssClass="round" runat="server" ID="btnSub" 
                    Text="SUbmit" onclick="btnSub_Click"  /></center></td></tr>
        </table></center>
    <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

