<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Delete_Contra.aspx.cs" Inherits="Delete_Contra" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
  <div class="side-menu fl">
        
        <ul>
        <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Contra.aspx" class="active-tab dashboard-tab">Create Contra</a></li>
            <%} %>
            <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Contra.aspx" class="active-tab dashboard-tab">Delete Contra</a></li>
            <%} %>
            <li><a href="Data_Entry_Home.aspx" class="active-tab dashboard-tab">Data Entry</a></li>
            
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
<%if (Session["rightdelete"].ToString() == "1") %>
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
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Delete Contra Information</u></b></font></center></div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
              
            </div>
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Date
                    </th>
                    <th align="left">
                        Account
                    </th>
                    <th align="left">
                        Name
                    </th>
                    
                    <th align="left">
                        Amount
                    </th>
                    <th align="left">
                        Cheque No
                    </th>
                     <th align="left">
                        Cheque Date
                    </th>
                     <th align="left">
                        Bank Name
                    </th>
                    <th align="left">
                        Debit
                    </th>
                    <th align="left">
                        Credit
                    </th>
                    
                    <th align="left">
                        Narration
                    </th>
                    <th align="left">
                       Delete
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select * from "+val+""; %>
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
                        <%Response.Write(dr.GetString(2));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(4));%>
                    </td>
                   
                    <td>
                        <%Response.Write(dr.GetValue(5));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(6));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(7));%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(8));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(9));%>
                    </td>
                    
                    <td>
                        <%Response.Write(dr.GetValue(11));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(12));%>
                    </td>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Contra1.aspx?id=<%=dr.GetString(1) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

