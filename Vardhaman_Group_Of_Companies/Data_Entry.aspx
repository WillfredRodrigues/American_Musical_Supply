<%@ Page Title="" Language="C#" MasterPageFile="~/Interface.master" AutoEventWireup="true"
    CodeFile="Data_Entry.aspx.cs" Inherits="Data_Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="side" runat="Server">
    <div class="side-menu fl">
        <h3>
            Quick Links</h3>
        <ul>
            <li><a href="Complex_Entry.aspx" class="active-tab dashboard-tab">Complex</a></li>
            <li><a href="Customer_Entry.aspx" class="active-tab dashboard-tab">Customer</a></li>
            <li><a href="Purchase_Entry.aspx" class="active-tab dashboard-tab">Purchase</a></li>
            <li><a href="Payment_Entry.aspx" class="active-tab dashboard-tab">Payment</a></li>
            <li><a href="Purchase_Payment_Entry.aspx" class="active-tab dashboard-tab">Purchase-Payment</a></li>
            <li><a href="Usage_Entry.aspx" class="active-tab dashboard-tab">Usage</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
 <script type="text/javascript">
     function right() {
         //            var x = document.getElementsByName("rd").item;
         //            alert(x);
         alert('No User Present.Please Go To Add User Section To Create New User');
     }
    </script>
    <div class="side-content fr">
        <div class="content-module">
            <div class="content-module-heading cf">
                <h3 class="fl">
                    Sales</h3>
                <span class="fr expand-collapse-text">Click to collapse</span> <span class="fr expand-collapse-text initial-expand">
                    Click to expand</span>
            </div>
            <!-- end content-module-heading -->
            <center>Select an option to feed the data in database from quick links!!!!</center>
            
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
</asp:Content>
