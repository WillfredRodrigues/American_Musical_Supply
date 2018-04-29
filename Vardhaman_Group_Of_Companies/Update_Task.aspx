<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Update_Task.aspx.cs" Inherits="Update_Task" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        
        <ul>
       
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Task_Main.aspx" class="purchase-tab">Main Task</a></li>
             <li><a href="Task_Sub.aspx" class="purchase-tab">Sub Task</a></li>

            
            <%} %>
              <%if (Session["rightupdate"].ToString() == "1") %>
            <%{ %>
            <li><a href="Update_Task.aspx" class="purchase-tab">Update Task</a></li>
            <%} %>
              <%if (Session["rightdelete"].ToString() == "1") %>
            <%{ %>
            <li><a href="Delete_Task.aspx" class="purchase-tab">Delete Task</a></li>
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
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Update Task Information</u></b></font></center>
            </div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
           
            </div>
            <asp:Panel ID="pan1" runat="server" style="margin-top:5px">
        <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="center" width="100%">
                <tr>
                    <th align="left">
                        No
                    </th>
                    
                    <th align="left">
                        Name
                    </th>
                     <th align="left">
                        Description
                    </th>
                    <th align="left">
                        From Date
                    </th>
                    <th align="left">
                        To Date
                    </th>
                    <th align="left">
                        Assigned To
                    </th>
                     <th align="left">
                        Status
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
                        <%Response.Write(dr.GetString(1));%>
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
                        <%Response.Write(dr.GetValue(7));%>
                    </td>
                     
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Task1.aspx?id=<%=dr.GetValue(0) %>" class="round blue my_button  text-upper">
                                Update</a>
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
            </asp:Panel>
            
            
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>


