<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Day_Book.aspx.cs" Inherits="Day_Book" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
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
<%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
    <script type="text/javascript">
        function right() {
            //            var x = document.getElementsByName("rd").item;
            //            alert(x);
            alert('No User Present.Please Go To Add User Section To Create New User');
        }
    </script>
    <div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Data Entry Information</u></b></font></center></div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
          <center>  <table>
                    <tr>
                        <td style="width: 170px; text-align: center">
                            Search Date
                        </td>
                       
                        
                        <td rowspan="2" style="width: 170px; text-align: center">
                            <center>
                                <asp:Button CssClass="round" runat="server" ID="btnSub" Text="Search" OnClick="btnSub_Click" /></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
      <asp:TextBox AutoComplete="off" CssClass=" round" Width="180px" Height="25px" ID="from"
                                    runat="server"></asp:TextBox>
        <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" TargetControlID="from" runat="server">
        </cc1:CalendarExtender>
                        </td>
                       
                        
                    </tr>
                    
                </table></center>
            </div>
            <asp:Panel ID="pan1" runat="server">
            <center>   <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center" width="100%">
                <tr>
                    <th align="left" style="width:5%">
                        No
                    </th>
                    <th align="left" style="width:8%">
                        Date
                    </th>
                    
                    <th align="left" style="width:37%">
                        Name
                    </th>
                    
                   
                   
                    <th align="left" style="width:10%">
                        Debit
                    </th>
                    <th align="left" style="width:10%">
                        Credit
                    </th>
                    <th align="left" style="width:10%">
                      Type
                    </th>
                     <th align="left" style="width:10%">
                      Update
                    </th>
                     <th align="left" style="width:10%">
                      Delete
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select * from " + val + " union select * from " + val1 + " union select * from " + val2 + " order by date desc,name asc"; %>
                <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                <%SqlConnection con = new SqlConnection(strConnString); %>
                <% con.Open(); %>
                <% SqlDataReader dr;%>
                <%SqlCommand cmd = new SqlCommand(s, con);%>
                <% dr = cmd.ExecuteReader();%>
                <%while (dr.Read())%>
                <%{ %>
                <tr>
                    <td>
                        <%=i %>
                    </td>
                    
                    <td>
                        <%Response.Write(dr.GetValue(2).ToString());%>
                    </td>
                   
                    <td>
                        <%Response.Write(dr.GetString(4));%>
                    </td>
                   
                    
                   
                    <td>
                      <%if (dr.GetValue(9).ToString() == "0.0000" && dr.GetString(14)!="Journal") %>
                    <%{ %>

                    <%} %>
                   <%else if (dr.GetValue(5).ToString() != "0.0000" && dr.GetString(14) == "Journal")
                       {%>
                        <%Response.Write(dr.GetValue(5));%>
                        <%} %>
                        <%else 
                       {%>
                        <%Response.Write(dr.GetValue(9));%>
                        <%} %>
                    </td>
                    <td>
                         <%if (dr.GetValue(10).ToString() == "0.0000" && dr.GetString(14)!="Contra" && dr.GetString(14)!="Journal") %>
                    <%{ %>

                    <%} %>
                   <%else if (dr.GetValue(5).ToString() != "0.0000" && dr.GetString(14) == "Contra" && dr.GetString(14) != "Journal")
                       {%>
                        <%Response.Write(dr.GetValue(5));%>
                        <%} %>
                        <%else if (dr.GetValue(5).ToString() != "0.0000" && dr.GetString(14) == "Journal" && dr.GetString(14) != "Contra")
                       {%>
                       
                        <%} %>
                        <%else 
                       {%>
                        <%Response.Write(dr.GetValue(10));%>
                        <%} %>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(14));%>
                    </td>
                    <%if (dr.GetString(14) == "Payment") %>
                    <%{ %>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Payment_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                   <%else if (dr.GetString(14) == "Receipt") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Receipt_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                     <%else if (dr.GetString(14) == "Journal") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Journal.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                    <%else 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Contra1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                    <%if (dr.GetString(14) == "Payment") %>
                    <%{ %>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Payment_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                   <%else if (dr.GetString(14) == "Receipt") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Receipt_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                     <%else if (dr.GetString(14) == "Journal") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Journal.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                    <%else 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Contra1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table>  </center>
            </asp:Panel>
            <asp:Panel ID="pan2" runat="server">
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center">
                <tr>
                    <th align="left" style="width:5%">
                        No
                    </th>
                    <th align="left" style="width:8%">
                        Date
                    </th>
                    
                    <th align="left" style="width:37%">
                        Name
                    </th>
                    
                   
                   
                    <th align="left" style="width:10%">
                        Debit
                    </th>
                    <th align="left" style="width:10%">
                        Credit
                    </th>
                    <th align="left" style="width:10%">
                      Type
                    </th>
                     <th align="left" style="width:10%">
                      Update
                    </th>
                     <th align="left" style="width:10%">
                      Delete
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select * from " + val + " where date ='" + from.Text + "' union select * from " + val1 + " where date='" + from.Text + "' union select * from " + val2 + " where date='" + from.Text + "' order by date desc,name asc"; %>
                <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                <%SqlConnection con = new SqlConnection(strConnString); %>
                <% con.Open(); %>
                <% SqlDataReader dr;%>
                <%SqlCommand cmd = new SqlCommand(s, con);%>
                <% dr = cmd.ExecuteReader();%>
                <%while (dr.Read())%>
                <%{ %>
                <tr>
                    <td>
                        <%=i %>
                    </td>
                    
                    <td>
                        <%Response.Write(dr.GetValue(2).ToString());%>
                    </td>
                   
                    <td>
                        <%Response.Write(dr.GetString(4));%>
                    </td>
                   
                    
                   
                    <td>
                      <%if (dr.GetValue(9).ToString() == "0.0000" && dr.GetString(14)!="Journal") %>
                    <%{ %>

                    <%} %>
                   <%else if (dr.GetValue(5).ToString() != "0.0000" && dr.GetString(14) == "Journal")
                       {%>
                        <%Response.Write(dr.GetValue(5));%>
                        <%} %>
                        <%else 
                       {%>
                        <%Response.Write(dr.GetValue(9));%>
                        <%} %>
                    </td>
                    <td>
                         <%if (dr.GetValue(10).ToString() == "0.0000" && dr.GetString(14)!="Contra" && dr.GetString(14)!="Journal") %>
                    <%{ %>

                    <%} %>
                   <%else if (dr.GetValue(5).ToString() != "0.0000" && dr.GetString(14) == "Contra" && dr.GetString(14) != "Journal")
                       {%>
                        <%Response.Write(dr.GetValue(5));%>
                        <%} %>
                        <%else if (dr.GetValue(5).ToString() != "0.0000" && dr.GetString(14) == "Journal" && dr.GetString(14) != "Contra")
                       {%>
                       
                        <%} %>
                        <%else 
                       {%>
                        <%Response.Write(dr.GetValue(10));%>
                        <%} %>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(14));%>
                    </td>
                    <%if (dr.GetString(14) == "Payment") %>
                    <%{ %>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Payment_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                   <%else if (dr.GetString(14) == "Receipt") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Receipt_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                     <%else if (dr.GetString(14) == "Journal") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Journal.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                    <%else 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Contra1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <%} %>
                    <%if (dr.GetString(14) == "Payment") %>
                    <%{ %>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Payment_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                   <%else if (dr.GetString(14) == "Receipt") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Receipt_Entry1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                     <%else if (dr.GetString(14) == "Journal") 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Journal.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                    <%else 
                        { %>
                   <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Contra1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                    <%} %>
                </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table>
            </asp:Panel>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


