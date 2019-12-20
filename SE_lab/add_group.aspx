<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="add_group.aspx.cs" Inherits="SE_lab.add_group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Add Group</h1>
        <asp:Label ID="Label1" runat="server" Text="Group Name"></asp:Label>
        <asp:TextBox ID="txt_GroupName" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label2" runat="server" Text="Select A Member"></asp:Label>
        <asp:DropDownList ID="Assign_Group" runat="server" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="FirstName"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SEProjectConnectionString %>" SelectCommand="SELECT [FirstName] FROM [Student]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btn_addMember" runat="server" Text="Add Member" OnClick="btn_addMember_Click" />

        <asp:Button ID="btn_FormGroup" runat="server" Text="Form Group" OnClick="btn_FormGroup_Click" />
        <asp:GridView ID="Group_Formation" runat="server"></asp:GridView>
        </div>
</asp:Content>
