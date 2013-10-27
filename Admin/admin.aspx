<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaserPage.master" AutoEventWireup="true"
    CodeFile="admin.aspx.cs" Inherits="Admin_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <div class="adminMessage">
        <center>
            <h3>
                Welcome to Admin Panel | CMS for eCommerce
                </h3> <br />
        </center>
        <p>
            This here is the Content Management System for the eCommerce (Onlinw Shopping) web
            application. From this admin panel, you can change various aspects of the websites
            like managing users and products. Uploading new products and updating user information
            etc.
         </p>
         <br />
         <p>Only an admin user can have access to this content management panel for sucurity reasons.
         A normal user will not see a link to get in the admin panel.</p>
    </div>
</asp:Content>
