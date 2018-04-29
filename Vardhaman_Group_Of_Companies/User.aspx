<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<asp:Content ContentPlaceHolderID="side" runat="server">
<div class="side-menu fl">
				
				<h3>Quick Links</h3>
                <ul>
        
                <li><a href="dashboard.php" class="active-tab dashboard-tab">Payment</a></li>
                <li><a href="dashboard.php" class="active-tab dashboard-tab">Receipt</a></li>
                <li><a href="dashboard.php" class="active-tab dashboard-tab">Sales</a></li>
                <li><a href="dashboard.php" class="active-tab dashboard-tab">Purchase</a></li>
                 
                                </ul> 
			</div> <!-- end side-menu -->
            
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

			<div class="side-content fr">
			
				<div class="content-module">
				
					<div class="content-module-heading cf">
					
						<h3 class="fl">Statistics</h3>
						<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>
					
					</div> <!-- end content-module-heading -->
					
						<div class="content-module-main cf">
				
							<div style="float:left">
							<img src="upload/wel.jpg" />
				
				</div>
                <div style="float:left; margin-top: 50px;">
						<font style="font-family: 'Courier New', Courier, monospace; font-size: 20px; font-weight: lighter; color: #008000"><%=Session["logged_in2"].ToString() %></font> Saheb</div>
				
					</div> <!-- end content-module-main -->
							
				
				</div> <!-- end content-module -->
				
			    
		
		</div> <!-- end full-width --></asp:Content>
