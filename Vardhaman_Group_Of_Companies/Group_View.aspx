<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Group_View.aspx.cs" Inherits="Group_View" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="Server">
    <%if (Session["menu"].ToString() != "3") %>
    <%{ %>
    <% string s = "select proj_name from project_registration where proj_regi_id='" + proj + "'"; %>
    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con = new SqlConnection(strConnString); %>
    <% con.Open(); %>
    <% SqlDataReader dr;%>
    <%SqlCommand cmd = new SqlCommand(s, con);%>
    <% dr = cmd.ExecuteReader();%>
    <%while (dr.Read())%>
    <%{ %>
    <%name = dr.GetString(0); %>
    <%} %>
    <%dr.Close(); %>
    <div class="side-content fr" style="width: 1300px; float: left; margin-right: 50px">
        <div class="content-module">
            <div class="content-module-main cf">
                <table width="1260px" style="border: 1px solid black">
                    <tr>
                        <th colspan="2">
                            <font size="3px">Elongated View</font> <font style="margin-left: 470px" size="3px">
                               <%=name %> </font>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <%if (o==1)
                              {%>Ledger Group<%} %>
                            <%else
                                { %>Ledger<%} %>
                        </td>
                       
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <%if (q==1)
                        { %>   
                        <tr>
                        <asp:Panel ID="pan1" runat="server" style="margin-top:5px">
         <center>   <table style="caption-side: inherit; empty-cells: inherit;"
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
                <% string s = "select * from " + va + "  where name='" + k + "' union select * from " + va1 + " where name='" + k + "' union select * from " + va2 + " where name='" + k + "' order by date desc, name asc"; %>
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
                    
                   
                        <% Response.Write(dr.GetValue(2).ToString());%>
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
            </asp:Panel>   </tr> 
                    <%} %>
                   <%else  if (gl == 1) %>
                    <%{ %>
                    
                    <table style="caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center" width="100%">
                <tr>
                    <th align="left" style="width:10%">
                        No
                    </th>
                   
                    <th align="left" style="width:45%">
                        Name
                    </th>
                    
                   
                   
                   
                    <th align="left" style="width:45%">
                      Balance
                    </th>
                    
                </tr><%int i = 1; %>
                <%if (sa == 1) %>
                <%{ %>
                   <%  s1 = "select * from " + val1 + " where ledger_name='" + d + "' or (coming_from='"+val78+"' or coming_from='"+val79+"')"; %><%} %>
                   <% else
                    { %><%  s1 = "select * from " + val1 + " where ledger_name='" + d + "'"; %><%} %>
    <%String strConnString1 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con1 = new SqlConnection(strConnString); %>
    <% con1.Open(); %>
    <% SqlDataReader dr1;%>
    <%SqlCommand cmd1 = new SqlCommand(s1, con1);%>
    <% dr1 = cmd1.ExecuteReader();%>
    <%while (dr1.Read())%>
    <%{ %>
     <tr>
                    <td>
                        <%=i%>
                    </td>
                    
                    <td>
                    
                   
                        <a href="Group_View.aspx?id=<%Response.Write(dr1.GetString(1)); %>">
    <%Response.Write(dr1.GetString(1)); %></a>
                    </td>
                   
                    
                   
                    
                   
                    <td>
                      
                        <%Response.Write(dr1.GetValue(6));%>
                      
                    </td>
                    
                   
                </tr>
                <%i++; %>
                <%} %>
                <%dr1.Close(); %>
                <%con.Close(); %>
                
               
  <%} %>
                   <%else if (o == 1) %>
                    <%{ %>
                    <table style="caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center" width="100%">
                <tr>
                    <th align="left" style="width:10%">
                        No
                    </th>
                   
                    <th align="left" style="width:45%">
                        Name
                    </th>
                    
                   
                   
                   
                    <th align="left" style="width:45%">
                      Balance
                    </th>
                    
                </tr><%int i = 1; %>
                   <% string s1 = "select distinct(ledger_name),sum(balance) from " + val1 + " where main_name='" + d + "' group by ledger_name"; %>
    <%String strConnString1 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con1 = new SqlConnection(strConnString); %>
    <% con1.Open(); %>
    <% SqlDataReader dr1;%>
    <%SqlCommand cmd1 = new SqlCommand(s1, con1);%>
    <% dr1 = cmd1.ExecuteReader();%>
    <%while (dr1.Read())%>
    <%{ %>
   <tr>
                    <td>
                        <%=i%>
                    </td>
                    
                    <td>
                    
                   
                        <a href="Group_View.aspx?id=<%Response.Write(dr1.GetString(0)); %>">
    <%Response.Write(dr1.GetString(0)); %></a>
                    </td>
                   
                    
                   
                    
                   
                    <td>
                      
                        <%Response.Write(dr1.GetValue(1));%>
                      
                    </td>
                    
                   
                </tr>
                <%i++; %>
                <%} %>
                <%dr1.Close(); %>
                <%con.Close(); %>
               
  <%} %>
                    <%else if (q == 0) %>
                    <%{ %>
                    
                    <table style="caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center" width="100%">
                <tr>
                    <th align="left" style="width:10%">
                        No
                    </th>
                   
                    <th align="left" style="width:45%">
                        Name
                    </th>
                    
                   
                   
                   
                    <th align="left" style="width:45%">
                      Balance
                    </th>
                    
                </tr><%int i = 1; %>
                  <%if (sa == 1) %>
                <%{ %>
                   <%  s1 = "select * from " + val1 + " where ledger_name='" + d + "' or (coming_from='"+val78+"' or coming_from='"+val79+"')"; %><%} %>
                   <% else
                    { %><%  s1 = "select * from " + val1 + " where ledger_name='" + d + "'"; %><%} %>
    <%String strConnString1 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con1 = new SqlConnection(strConnString); %>
    <% con1.Open(); %>
    <% SqlDataReader dr1;%>
    <%SqlCommand cmd1 = new SqlCommand(s1, con1);%>
    <% dr1 = cmd1.ExecuteReader();%>
    <%while (dr1.Read())%>
    <%{ %>
     <tr>
                    <td>
                        <%=i%>
                    </td>
                    
                    <td>
                    
                   
                        <a href="Group_View.aspx?id=<%Response.Write(dr1.GetString(1)); %>">
    <%Response.Write(dr1.GetString(1)); %></a>
                    </td>
                   
                    
                   
                    
                   
                    <td>
                      
                        <%Response.Write(dr1.GetValue(6));%>
                      
                    </td>
                    
                   
                </tr>
                <%i++; %>
                <%} %>
                <%dr1.Close(); %>
                <%con.Close(); %>
               
  <%} %>
  
            
                </table>
            </div>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
