<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Assign_Project.aspx.cs" Inherits="SE_lab.Assign_Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Assign Project</h1>
        <asp:Label ID="Label1" runat="server" Text="Select A Group"></asp:Label>
        <asp:DropDownList ID="Select_Group" runat="server" DataSourceID="SqlDataSource1" DataTextField="GroupName" DataValueField="GroupName"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SEProjectConnectionString %>" SelectCommand="SELECT [GroupName] FROM [GroupFromation]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Select A Advisor"></asp:Label>
        <asp:DropDownList ID="Select_Advisor" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="FirstName"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SEProjectConnectionString %>" SelectCommand="SELECT [FirstName] FROM [Advisor]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Select A Project"></asp:Label>
        <asp:DropDownList ID="Select_Project" runat="server" DataSourceID="SqlDataSource3" DataTextField="ProjectName" DataValueField="ProjectName"></asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SEProjectConnectionString %>" SelectCommand="SELECT [ProjectName] FROM [AddProject]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" />
        <asp:GridView ID="Data_View" runat="server">
        </asp:GridView>
    </div>
</asp:Content>
