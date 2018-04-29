<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Login to Control Panel</title>
	
	<!-- Stylesheets -->
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/cmxform.css">
	<link rel="stylesheet" href="js/lib/validationEngine.jquery.css">
	
	<!-- Scripts -->
	<script src="js/lib/jquery.min.js" type="text/javascript"></script>
	<script src="js/lib/jquery.validate.min.js" type="text/javascript"></script>
	
	<script>
	    /*$.validator.setDefaults({
	    submitHandler: function() { alert("submitted!"); }
	    });*/

	    $(document).ready(function () {

	        // validate signup form on keyup and submit
	        $("#loginform").validate({
	            rules: {
	                username: {
	                    required: true,
	                    minlength: 3
	                },
	                password: {
	                    required: true,
	                    minlength: 3
	                }
	            },
	            messages: {
	                username: {
	                    required: "Please enter a username",
	                    minlength: "Your username must consist of at least 3 characters"
	                },
	                password: {
	                    required: "Please provide a password",
	                    minlength: "Your password must be at least 3 characters long"
	                }
	            }
	        });

	    });

	</script>

	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
</head>
<body>

<!--    Only Index Page for Analytics   -->

	<!-- TOP BAR -->
	<div id="top-bar">
		
		<div class="page-full-width">
		
			<!--<a href="#" class="round button dark ic-left-arrow image-left ">See shortcuts</a>-->

		</div> <!-- end full-width -->	
	
	</div> 
	<!-- end top-bar -->
	
	
	
	<!-- HEADER -->
	<div id="header">
		
		<div class="page-full-width cf">
	
			<div id="login-intro" class="fl">
			
				<h1>Login to Dashboard</h1>
				<h5>Enter your credentials below</h5>
			
			</div> <!-- login-intro -->
    
			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 39px height. -->
			<a href="#" id="company-branding" class="fr"  target="blank" ><img src="upload/geobram -frnt.png" alt="Clarus World" /></a>
			
		</div> <!-- end full-width -->	

	</div> <!-- end header -->
	<br />
        <center><h1 style="font-family: Georgia;     font-weight: bold; font-size:30px; color: #0060BF">Vardhaman Group Of Companies</h1>
		</center>
	<!-- MAIN CONTENT -->
    <br />
	<div id="content">

		<form id="loginform"   runat="server" class="cmxform">
		
			<fieldset>
            <br />
            <p>
            <label>Select An Account</label>
            <asp:DropDownList id="type" runat="server" class="round full-width-input" 
                    Height="30px" Width="260px" AutoPostBack="true" 
                    onselectedindexchanged="type_SelectedIndexChanged">
   <asp:ListItem>Main_Admin</asp:ListItem>
   <asp:ListItem>Project_Admin</asp:ListItem>
   <asp:ListItem>User</asp:ListItem>
   </asp:DropDownList>
   <asp:TextBox AutoComplete="off" ID="txt1" runat="server" Visible="false"></asp:TextBox>
   <asp:TextBox AutoComplete="off" ID="txt2" runat="server" Visible="false"></asp:TextBox>
  </p>
  <p>
   <label runat="server" id="lbl">Select Project</label>
          <asp:ScriptManager ID="ScriptManager1" runat="server" 
EnablePageMethods = "true">
</asp:ScriptManager>

<asp:TextBox  ID="DropDownList1" runat="server"></asp:TextBox>
<cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" 
    MinimumPrefixLength="1"
    CompletionInterval="1" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="DropDownList1"
    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false">
</cc1:AutoCompleteExtender>

            </p>
				<p>
                                    <label>Username</label>
                                    <asp:TextBox  ID="txtid" runat="server" class="round full-width-input" placeholder="Enter Username"  autofocus></asp:TextBox>
                                        <%--<input type="text" id="login-username" class="round full-width-input" placeholder="Enter Username" name="username" autofocus  />--%>
				</p>

				<p>
                                <label>Password</label>
                                        <%--<input type="password" id="login-password" name="password" placeholder="Enter Password" class="round full-width-input"  />--%>
                                        <asp:TextBox ID="txtpass" runat="server" class="round full-width-input" placeholder="Enter Username"  autofocus TextMode="Password"></asp:TextBox>
				</p>
				
                                <a href="#" class="button ">Forgot your password?</a>
				
				<!--<a href="dashboard.php" class="button round blue image-right ic-right-arrow">LOG IN</a>-->
				<%--<input type="submit" class="button round blue image-right ic-right-arrow" name="submit" value="LOG IN" />--%>
                <asp:Button ID="btnlogin" runat="server" Text="LOGIN" 
                    class="button round blue image-right ic-right-arrow" 
                    onclick="btnlogin_Click"  />
   
				<p>&nbsp;&nbsp <a href="myform1.php" >Register</a></p>
                <br />
			</fieldset>

			<br/>
                        
                </form>
	</div> <!-- end content -->
     
	
	
	
	<!-- FOOTER -->
	<div id="footer">
    <h4 style="font-family: Georgia;     font-weight: bold; font-size:15px; color: #0060BF">
©2014 Clarus World Academy LLP. All rights reserved.


	</div> <!-- end footer -->
        
       
</body>
</html>