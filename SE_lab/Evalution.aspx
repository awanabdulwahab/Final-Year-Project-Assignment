<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Evalution.aspx.cs" Inherits="SE_lab.Evalution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Evalution</h1>
        <asp:Label ID="Label1" runat="server" Text="Select Group"></asp:Label>
        <asp:DropDownList ID="Select_Group" runat="server" DataSourceID="SqlDataSource1" DataTextField="GroupName" DataValueField="GroupName"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SEProjectConnectionString %>" SelectCommand="SELECT [GroupName] FROM [GroupFromation]"></asp:SqlDataSource><br />
        <asp:Label ID="Label4" runat="server" Text="Select Date:"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <asp:Label ID="Label2" runat="server" Text="Total Marks:"></asp:Label>
        <asp:TextBox ID="txt_totalMarks" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Obtained Marks"></asp:Label>
        <asp:TextBox ID="txt_ObtainedMarks" runat="server"></asp:TextBox>
        <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" />
        <asp:GridView ID="display_Evalution" runat="server"></asp:GridView>
    </div>
</asp:Content>
