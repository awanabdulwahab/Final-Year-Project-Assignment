<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Update_student.aspx.cs" Inherits="SE_lab.Update_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Update Student</h1>
        <asp:Label ID="Label1" runat="server" Text="Enter Your Registration No."></asp:Label>
        <asp:TextBox ID="txt_regNo" runat="server"></asp:TextBox>
        <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" /><br /><br />
        <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="txt_FirstName" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="txt_LastName" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Lable4" runat="server" Text="Registration No."></asp:Label>
        <asp:TextBox ID="txt_RegistrationNumber" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Lable5" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btn_Update" runat="server" Text="Update" OnClick="btn_Update_Click" /><br /><br />
        <asp:GridView ID="display_Student" runat="server"></asp:GridView>
    </div>
</asp:Content>
