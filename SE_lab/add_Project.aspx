<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="add_Project.aspx.cs" Inherits="SE_lab.add_Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Add Project</h1>
        <asp:Label ID="Label1" runat="server" Text="Project Name"></asp:Label>
        <asp:TextBox ID="txt_ProjectName" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label2" runat="server" Text="Project Description"></asp:Label>
        <asp:TextBox ID="txt_ProjectDescription" runat="server"></asp:TextBox><br />
        <asp:Button ID="btn_addProject" runat="server" Text="Add" OnClick="btn_addProject_Click" /><br /><br />

        <asp:GridView ID="projectData" runat="server">
        </asp:GridView>

        </div>
</asp:Content>
