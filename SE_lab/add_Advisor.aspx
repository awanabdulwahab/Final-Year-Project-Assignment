<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="add_Advisor.aspx.cs" Inherits="SE_lab.add_Advisor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Advisor</h1>
        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="txt_FristName" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="txt_LastName" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label3" runat="server" Text="Rank"></asp:Label>
        <asp:TextBox ID="txt_Rank" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btn_Add_Advisor" runat="server" Text="Add" OnClick="btn_Add_Advisor_Click" />
        <asp:Button ID="btn_Update_Advisor" runat="server" Text="Update" OnClick="btn_Supdate_Click" />
        <br />
        <asp:GridView ID="Advisor_data" runat="server" Height="169px" Width="453px">
        </asp:GridView>
        <br />

    </div>
</asp:Content>
