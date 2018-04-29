<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true"
    CodeFile="Complex_Home.aspx.cs" Inherits="Complex_Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        <h3>
            Quick Links</h3>
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
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="Server">
<%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
    <div class="side-content fr">
        <div class="content-module">
            <div class="content-module-heading cf">
                <h3 class="fl">
                    Sales</h3>
                <span class="fr expand-collapse-text">Click to collapse</span> <span class="fr expand-collapse-text initial-expand">
                    Click to expand</span>
            </div>
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
            
                <table>
                    <tr>
                        <td style="width: 170px; text-align: center">
                            Complex Name
                        </td>
                        <td style="width: 170px; text-align: center">
                            Building Name
                        </td>
                        <td style="width: 170px; text-align: center">
                            Wing
                        </td>
                        <td style="width: 170px; text-align: center">
                            Flat Floor
                        </td>
                        <td style="width: 170px; text-align: center">
                            View
                        </td>
                        <td rowspan="2" style="width: 170px; text-align: center">
                            <center>
                                <a href="?id=<%=cn.SelectedItem.Text %>&id1=<%=bn.SelectedItem.Text %>&id2=<%=wing.SelectedItem.Text %>&id3=<%=floor.SelectedItem.Text %>&id4=<%=view.SelectedItem.Text %>"
                                    class="round">Search</a></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="cn" runat="server" AutoPostBack="true" Style="width: 170px;
                                height: 25px" OnSelectedIndexChanged="cn_SelectedIndexChanged">
                                <asp:ListItem>---Select Complex---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="bn" runat="server" AutoPostBack="true" Style="width: 170px;
                                height: 25px" OnSelectedIndexChanged="bn_SelectedIndexChanged">
                                <asp:ListItem>---Select Building---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="wing" runat="server" AutoPostBack="true" Style="width: 170px;
                                height: 25px" OnSelectedIndexChanged="wing_SelectedIndexChanged">
                                <asp:ListItem>---Select Wing---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="floor" AutoPostBack="true" runat="server" Style="width: 170px;
                                height: 25px">
                                <asp:ListItem>---Select Floor---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="view" AutoPostBack="true" runat="server" Style="width: 170px;
                                height: 25px">
                                <asp:ListItem>---Select One---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr><td colspan="6">You Searched For:<%if ((s == "---Select Complex---" && s1 == "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 == "---Select One---") || (s == null && s1 == null && s2 == null && s3 == null && s4 == null))%><%{ %>Nothing<%} %><%else
                { %><%if (s != "---Select Complex---")%> <%{ %><%=s%>--><%} %><%if (s1 != "---Select Building---")%> <%{ %><%=s1%>--><%} %><%if (s2 != "---Select Wing---")%> <%{ %><%=s2%>--><%} %><%if (s3 != "---Select Floor---")%> <%{ %><%=s3%>--><%} %><%if (s4 != "---Select One---")%> <%{ %><%=s4%><%} %><%} %></td></tr>
                </table>
                
            </div>
            <asp:Panel ID="pan1" runat="server">
           
               
                <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                    border="solid" align="left">
                    <tr>
                        <th align="left">
                            No
                        </th>
                        <th align="left">
                            Wing
                        </th>
                        <th align="left">
                            Flat Floor
                        </th>
                        <th align="left">
                            Flat No
                        </th>
                        <th align="left">
                            Flat Type
                        </th>
                        <th>
                            Area
                        </th>
                        <th width="10px">
                            Customer Name
                        </th>
                        <th width="10px">
                            Booking Date
                        </th>
                        <th width="10px">
                            Total
                        </th>
                        <th width="10px">
                            Paid
                        </th>
                        <th width="10px">
                            Balance
                        </th>
                        <th width="10px">
                            Status
                        </th>
                    </tr>
                    <%int i = 1; %>
                    <% string s5 = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                    <%SqlConnection con = new SqlConnection(strConnString); %>
                    <% con.Open(); %>
                    <% SqlDataReader dr;%>
                    <%SqlCommand cmd = new SqlCommand(s5, con);%>
                    <% dr = cmd.ExecuteReader();%>
                    <%while (dr.Read())%>
                    <%{ %>
                    <tr>
                        <td>
                            <%=i %>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(0));%>
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
                            <%Response.Write(dr.GetValue(4));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(5));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(6));%>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(7));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(8));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(9));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetString(5) == "-") %>
                            <%{ %>
                            Unsold
                            <%} %>
                            <%else
                                { %>
                            sold
                            <%} %>
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
            <asp:Panel ID="pan2" runat="server">
            
                <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                    border="solid" align="left">
                    <tr>
                        <th align="left">
                            No
                        </th>
                        <th align="left">
                            Wing
                        </th>
                        <th align="left">
                            Flat Floor
                        </th>
                        <th align="left">
                            Flat No
                        </th>
                        <th align="left">
                            Flat Type
                        </th>
                        <th>
                            Area
                        </th>
                        <th width="10px">
                            Customer Name
                        </th>
                        <th width="10px">
                            Booking Date
                        </th>
                        <th width="10px">
                            Total
                        </th>
                        <th width="10px">
                            Paid
                        </th>
                        <th width="10px">
                            Balance
                        </th>
                        <th width="10px">
                            Status
                        </th>
                    </tr>
                    <%int i = 1; %>
                    <% string s5 = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and " + val + ".building_name='" + s1 + "' and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                    <%SqlConnection con = new SqlConnection(strConnString); %>
                    <% con.Open(); %>
                    <% SqlDataReader dr;%>
                    <%SqlCommand cmd = new SqlCommand(s5, con);%>
                    <% dr = cmd.ExecuteReader();%>
                    <%while (dr.Read())%>
                    <%{ %>
                    <tr>
                        <td>
                            <%=i %>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(0));%>
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
                            <%Response.Write(dr.GetValue(4));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(5));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(6));%>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(7));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(8));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(9));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetString(5) == "-") %>
                            <%{ %>
                            Unsold
                            <%} %>
                            <%else
                                { %>
                            sold
                            <%} %>
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
            <asp:Panel ID="pan3" runat="server">
                <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                    border="solid" align="left">
                    <tr>
                        <th align="left">
                            No
                        </th>
                        <th align="left">
                            Wing
                        </th>
                        <th align="left">
                            Flat Floor
                        </th>
                        <th align="left">
                            Flat No
                        </th>
                        <th align="left">
                            Flat Type
                        </th>
                        <th>
                            Area
                        </th>
                        <th width="10px">
                            Customer Name
                        </th>
                        <th width="10px">
                            Booking Date
                        </th>
                        <th width="10px">
                            Total
                        </th>
                        <th width="10px">
                            Paid
                        </th>
                        <th width="10px">
                            Balance
                        </th>
                        <th width="10px">
                            Status
                        </th>
                    </tr>
                    <%int i = 1; %>
                    <% string s5 = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and " + val + ".building_name='" + s1 + "' and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "' and " + val + ".cust_id!='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc " ;%>
                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                    <%SqlConnection con = new SqlConnection(strConnString); %>
                    <% con.Open(); %>
                    <% SqlDataReader dr;%>
                    <%SqlCommand cmd = new SqlCommand(s5, con);%>
                    <% dr = cmd.ExecuteReader();%>
                    <%while (dr.Read())%>
                    <%{ %>
                    <tr>
                        <td>
                            <%=i %>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(0));%>
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
                            <%Response.Write(dr.GetValue(4));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(5));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(6));%>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(7));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(8));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(9));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetString(5) == "-") %>
                            <%{ %>
                            Unsold
                            <%} %>
                            <%else
                                { %>
                            sold
                            <%} %>
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
            <asp:Panel ID="pan4" runat="server">
                <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                    border="solid" align="left">
                    <tr>
                        <th align="left">
                            No
                        </th>
                        <th align="left">
                            Wing
                        </th>
                        <th align="left">
                            Flat Floor
                        </th>
                        <th align="left">
                            Flat No
                        </th>
                        <th align="left">
                            Flat Type
                        </th>
                        <th>
                            Area
                        </th>
                        <th width="10px">
                            Customer Name
                        </th>
                        <th width="10px">
                            Booking Date
                        </th>
                        <th width="10px">
                            Total
                        </th>
                        <th width="10px">
                            Paid
                        </th>
                        <th width="10px">
                            Balance
                        </th>
                        <th width="10px">
                            Status
                        </th>
                    </tr>
                    <%int i = 1; %>
                    <% string s5 = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and " + val + ".building_name='" + s1 + "' and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "' and " + val + ".cust_id='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                    <%SqlConnection con = new SqlConnection(strConnString); %>
                    <% con.Open(); %>
                    <% SqlDataReader dr;%>
                    <%SqlCommand cmd = new SqlCommand(s5, con);%>
                    <% dr = cmd.ExecuteReader();%>
                    <%while (dr.Read())%>
                    <%{ %>
                    <tr>
                        <td>
                            <%=i %>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(0));%>
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
                            <%Response.Write(dr.GetValue(4));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(5));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(6));%>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(7));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(8));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(9));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetString(5) == "-") %>
                            <%{ %>
                            Unsold
                            <%} %>
                            <%else
                                { %>
                            sold
                            <%} %>
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
            <asp:Panel ID="pan5" runat="server">
                <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                    border="solid" align="left">
                    <tr>
                        <th align="left">
                            No
                        </th>
                        <th align="left">
                            Wing
                        </th>
                        <th align="left">
                            Flat Floor
                        </th>
                        <th align="left">
                            Flat No
                        </th>
                        <th align="left">
                            Flat Type
                        </th>
                        <th>
                            Area
                        </th>
                        <th width="10px">
                            Customer Name
                        </th>
                        <th width="10px">
                            Booking Date
                        </th>
                        <th width="10px">
                            Total
                        </th>
                        <th width="10px">
                            Paid
                        </th>
                        <th width="10px">
                            Balance
                        </th>
                        <th width="10px">
                            Status
                        </th>
                    </tr>
                    <%if (s != "---Select Complex---" && s1 == "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 == "---Select One---") %>
                    <%{ %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 == "---Select One---") %>
                    <%{ %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and  " + val + ".building_name='" + s1 + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 != "---Select Wing---" && s3 == "---Select Floor---" && s4 == "---Select One---") %>
                    <%{ %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and  " + val + ".building_name='" + s1 + "' and " + val + ".wing='" + s2 + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 != "---Select Wing---" && s3 != "---Select Floor---" && s4 == "---Select One---") %>
                    <%{ %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and  " + val + ".building_name='" + s1 + "' and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "'group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 == "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 != "---Select One---") %>
                    <%{ %>
                    <%if (s4 == "View Sold")
                      { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and " + val + ".cust_id!='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s4 == "View Unsold")
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and " + val + ".cust_id='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 != "---Select One---") %>
                    <%{ %>
                    <%if (s4 == "View Sold")
                      { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "' and " + val + ".building_name='" + s1 + "'  and " + val + ".cust_id!='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s4 == "View Unsold")
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "' and " + val + ".cust_id='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 != "---Select Wing---" && s3 == "---Select Floor---" && s4 != "---Select One---") %>
                    <%{ %>
                    <%if (s4 == "View Sold")
                      { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "'  and " + val + ".wing='" + s2 + "' and " + val + ".cust_id!='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s4 == "View Unsold")
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "'  and " + val + ".wing='" + s2 + "'  and " + val + ".cust_id='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "'  and " + val + ".wing='" + s2 + "'  group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%} %>
                    <%else if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 != "---Select Wing---" && s3 != "---Select Floor---" && s4 != "---Select One---") %>
                    <%{ %>
                    <%if (s4 == "View Sold")
                      { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "'  and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "'  and " + val + ".cust_id!='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s4 == "View Unsold")
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "'  and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "' and " + val + ".cust_id='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where " + val + ".complex_name='" + s + "'  and " + val + ".building_name='" + s1 + "'  and " + val + ".wing='" + s2 + "' and " + val + ".flat_floor='" + s3 + "' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%} %>
                    <%else if (s == "---Select Complex---" && s1 == "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 != "---Select One---") %>
                    <%{ %>
                    <%if (s4 == "View Sold")
                      { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where  " + val + ".cust_id!='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else if (s4 == "View Unsold")
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id where  " + val + ".cust_id='' group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%else
                        { %>
                    <%d = "select " + val + ".wing," + val + ".flat_floor," + val + ".flat_no," + val + ".flat_type," + val + ".flat_area,coalesce(" + val1 + ".cust_name,'-')as cust,coalesce(" + val1 + ".cust_booking_date,'-')as date, coalesce(  " + val1 + ".total,'') as tot,coalesce(" + val1 + ".paid,' ')as paid,coalesce(" + val1 + ".balance,' ')as bal from " + val + " left join " + val1 + " on " + val + ".cust_id=" + val1 + ".cust_id group by  " + val + ".wing, " + val + ".flat_floor, " + val + ".flat_no, " + val + ".flat_type, " + val + ".flat_area, " + val1 + ".cust_name," + val1 + ".cust_booking_date," + val1 + ".total," + val1 + ".paid," + val1 + ".balance  order by " + val + ".wing asc, " + val + ".flat_floor asc," + val + ".flat_no asc ";%>
                    <%} %>
                    <%} %>
                    <%int i = 1; %>
                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                    <%SqlConnection con = new SqlConnection(strConnString); %>
                    <% con.Open(); %>
                    <% SqlDataReader dr;%>
                    <%SqlCommand cmd = new SqlCommand(d, con);%>
                    <% dr = cmd.ExecuteReader();%>
                    <%while (dr.Read())%>
                    <%{ %>
                    <tr>
                        <td>
                            <%=i%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(0));%>
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
                            <%Response.Write(dr.GetValue(4));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(5));%>
                        </td>
                        <td>
                            <%Response.Write(dr.GetString(6));%>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(7));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(8));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetValue(7).ToString() == "0.0000") %>
                            <%{ %>
                            -
                            <%} %>
                            <%else
                                { %>
                            <%Response.Write(dr.GetValue(9));%>
                            <%} %>
                        </td>
                        <td>
                            <%if (dr.GetString(5) == "-") %>
                            <%{ %>
                            Unsold
                            <%} %>
                            <%else
                                { %>
                            sold
                            <%} %>
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
