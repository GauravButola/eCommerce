<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaserPage.master" AutoEventWireup="true" CodeFile="listUsers.aspx.cs" Inherits="Admin_listUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="EntityDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                ReadOnly="True" SortExpression="CustomerName" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" 
                SortExpression="UserName" />
            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" 
                SortExpression="Address" />
            <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" 
                SortExpression="email" />
            <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" 
                ReadOnly="True" SortExpression="ContactNumber" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=eCommerceDBEntities" 
        DefaultContainerName="eCommerceDBEntities" EnableFlattening="False" 
        EntitySetName="Customers" EntityTypeFilter="Customer" 
        Select="it.[CustomerName], it.[UserName], it.[Address], it.[email], it.[ContactNumber]">
    </asp:EntityDataSource>
</asp:Content>

