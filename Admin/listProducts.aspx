<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaserPage.master" AutoEventWireup="true" CodeFile="listProducts.aspx.cs" Inherits="listProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataSourceID="EntityDataSource1" ForeColor="#333333" 
    GridLines="None" CellSpacing="10">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" 
                ReadOnly="True" SortExpression="ProductName" />
            <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" 
                ReadOnly="True" SortExpression="ProductDescription" />
            <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" 
                ReadOnly="True" SortExpression="ProductPrice" />
            <asp:BoundField DataField="Discount" HeaderText="Discount" ReadOnly="True" 
                SortExpression="Discount" />
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
    EntitySetName="Products" 
    Select="it.[ProductName], it.[ProductDescription], it.[ProductPrice], it.[Discount]">
</asp:EntityDataSource>
</asp:Content>

