<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true"
    CodeFile="Complex.aspx.cs" Inherits="Complex" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="server">
    <div class="side-menu fl">
        
        <ul>
        <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Complex.aspx" class="active-tab dashboard-tab">Create Complex</a></li>
            <%} %>
            <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Complex1.aspx" class="active-tab dashboard-tab">Update Complex</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
    <script type="text/javascript">
    function f() {
  
        var c = document.getElementById('<%=txtcmpname.ClientID %>').value;
        var d = document.getElementById('<%=txt.ClientID %>').value;
        var s = d.toString();
        var g = s.length;
      

    }
    function f1() {
        var c = document.getElementById('<%=txtbldname.ClientID %>').value;
        var d = document.getElementById('<%=txt.ClientID %>').value;
      
    }
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txtcmpname"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">

</cc1:AutoCompleteExtender>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers1" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txtbldname"
    ID="AutoCompleteExtender2" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers2" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txtwing"
    ID="AutoCompleteExtender3" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers3" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txtfloor"
    ID="AutoCompleteExtender4" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers5" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="txtcmplocation"
    ID="AutoCompleteExtender5" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>
    <div class="side-content fr">
        <div class="content-module">
       <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Add Complex Information</u></b></font></center></div>
           <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
              <asp:Panel ID="pancomp" runat="server"> <table>
                    <tr>
                        <td>
                             Complex Name:
                        </td>
                        <td class="style1">
                            <asp:TextBox AutoComplete="off" ID="txtcmpname" runat="server" 
                              ></asp:TextBox>
                        </td>
                        <td>
                             Complex Location:
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" ID="txtcmplocation" runat="server" 
                              ></asp:TextBox>
                        </td>
                        <td>
                             Building Name:
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" ID="txtbldname" runat="server" 
                                 ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             Building No:
                            
                        </td>
                        <td class="style1">
                            <asp:TextBox AutoComplete="off" ID="txtbldno" runat="server"></asp:TextBox>
                        </td>
                        <td>
                             Wing:
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" ID="txtwing" runat="server" 
                                ></asp:TextBox>
                        </td>
                        <td>
                             Flat Floor :
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" ID="txtfloor" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td colspan="6"> <p style="color:red; text-transform:capitalize">If No building No and wing is Given,The default Building No and wing Will Be Set To 1 and A respectively</p></td></tr>
                </table>
                <asp:TextBox AutoComplete="off" ID="txt" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox AutoComplete="off" ID="cmpid" runat="server" Visible="false" ></asp:TextBox>&nbsp;&nbsp;<asp:TextBox AutoComplete="off" ID="txtbid" runat="server" Visible="false"></asp:TextBox>
                <center><asp:Button ID="btnok" runat="server" Text="OK" onclick="btnok_Click" /></center>
                </asp:Panel> 
                <asp:Panel ID="mes" runat="server" Visible="false">
                <br />
                <center><font style="color:Red; font-size:12px">Add Flat Information Below</font></center>
                </asp:Panel>
                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server" Enabled="false"><center> <table>
                    <tr>
                        <td>
                             Flat No:
                        </td>
                        <td class="style1">
                            <asp:TextBox AutoComplete="off" ID="txtflatno" runat="server" ></asp:TextBox>
                        </td>
                        <td>
                             Flat Type:
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" ID="txttype" runat="server"></asp:TextBox>
                        </td>
                        <td>
                             Flat Area:
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" ID="txtarea" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton runat="server" ID="img1" OnClick="Unnamed1_Click" ImageUrl="~/images/add_new.png"/>
                        </td>
                    </tr>
                </table> </center><br />  </asp:Panel>
                <br />
                <br />
                <asp:Panel ID="sh" runat="server">
                <center>
                <table border="solid" >
                <tr>
                    <th align="left" style="width:auto">
                        Flat Number
                    </th>
                    <th align="left" style="width:auto">
                        Flat Type 
                    </th>
                    <th align="left" style="width:auto">
                        Area
                    </th>
                    <th style="width:auto">Remove</th>
                    </tr>
                    <%   string strquery = "select flat_no,flat_type,flat_area,ident,complex_id,building_id,building_no,wing,flat_floor from "+val+" where complex_id='" + cmpid.Text + "' and complex_name='" + txtcmpname.Text + "' and complex_location='" + txtcmplocation.Text + "' and building_id='" + txtbid.Text + "' and building_name='" + txtbldname.Text + "' and building_no='" + txtbldno.Text + "' and wing='" + txtwing.Text + "' and flat_floor='" + txtfloor.Text + "'";%>
                    <%   String strConnString = System.Configuration.ConfigurationManager
                  .ConnectionStrings["conString"].ConnectionString;%>
                    <% SqlConnection con = new SqlConnection(strConnString);%>
                    <% con.Open();%>
                    <% SqlDataReader dr;%>
                    <%  SqlCommand cmd = new SqlCommand(strquery, con);%>
                    <% dr = cmd.ExecuteReader();%>
                    <% while (dr.Read())%>
                    <% {%>
                    <tr>
                        <td>
                            <%Response.Write(dr.GetString(0)); %>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(1)); %>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(2)); %>
                        </td>
                        <td>
                            <a href="?id=<%=dr.GetValue(3) %>&id1=<%=dr.GetString(4)%>&id2=<%=dr.GetString(5)%>&id3=<%=dr.GetString(6)%>&id4=<%=dr.GetString(7)%>&id5=<%=dr.GetString(8)%>">
                                <img src="images/close_new.png" /></a>
                        </td>
                    </tr>
                    <% }%>
                    <%dr.Close();%>
                </table>
                </center>
                <br />
                <br />
               
               </asp:Panel>
               <center> <asp:Button ID="btndone" runat="server" Text="Continue Add" onclick="btndone_Click" />&nbsp;&nbsp;&nbsp;<asp:Button 
                       ID="btndo" runat="server" Text="Done With Adding" onclick="btndo_Click" /></center>
            </div>
            <!-- end content-module-main -->
        </div>
        <!-- end content-module -->
    </div>
    <!-- end full-width -->
    <%} %>
</asp:Content>
