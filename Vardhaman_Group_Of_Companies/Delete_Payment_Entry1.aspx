<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_Payment_Entry1.aspx.cs" Inherits="Delete_Payment_Entry1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
<script type="text/javascript">
    function SelectName(url) {

        window.open(url, 'Popup', 'toolbar=no,location=no,statusbar=no,menubar=no,resizable=0,width=350,height=200,left=490,top=300');


    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
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
<%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
           
  <div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete Payment Information</u></b></font></center></div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
              
            </div>

            <center><table>
            <tr>
                
                
                <td>
                   Account:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" ID="txtacc" runat="server" 
                        ></asp:TextBox>
                </td>
                  <td>
                    Name:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" ID="txtname" runat="server" ></asp:TextBox>
                        <asp:HiddenField ID="name" runat="server" />
                </td>
                 </tr>
            
                 
                <tr>
                <td>
                    Payment Date:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" ID="txtdate" runat="server"></asp:TextBox>
                </td>
                <td>
                    Amount:
                </td>
                <td>
                    <asp:TextBox Enabled="false"  AutoComplete="off" ID="txtamt" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                
                           <td>
                     Narration:
                </td>
                <td>
                    <textarea id="txtnara" runat="server" disabled="disabled"></textarea>
                </td>
                

                              <td>
                     Description:
                </td>
                <td>
                    <textarea id="txtdesc" runat="server" disabled="disabled"></textarea>
                </td>
            </tr>
           
        </table></center>
                    <center>
                        <asp:Button ID="submit" runat="server" Text="Delete"  
                            CssClass="round blue my_button  text-upper" onclick="submit_Click"  />
                       
                    </center>
             <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

