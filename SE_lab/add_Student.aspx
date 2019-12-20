<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="add_Student.aspx.cs" Inherits="SE_lab.images.add_Student" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Student</h1>
        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="txt_SFristName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt_SFristName" ValidationGroup="btn_Sadd"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="txt_SLastName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txt_SLastName" ValidationGroup="btn_Sadd"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label3" runat="server" Text="Reg. No."></asp:Label>
        <asp:TextBox ID="txt_RegistraitonNo" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txt_Semail" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btn_Sadd" runat="server" Text="Add" OnClick="btn_Sadd_Click" />
        <asp:Button ID="btn_Supdate" runat="server" Text="Update" OnClick="btn_Supdate_Click" />
        <br />
        <asp:GridView ID="std_data" runat="server" Height="169px" Width="453px">
        </asp:GridView>
        <br />

    </div>    
</asp:Content>
