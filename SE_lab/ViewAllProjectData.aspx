<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ViewAllProjectData.aspx.cs" Inherits="SE_lab.ViewAllProjectData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>View All Data</h1><br>
        <asp:Button ID="btn_Data" runat="server" Text="View All Data" OnClick="btn_Data_Click" />
        <asp:GridView ID="Grid_Data" runat="server"></asp:GridView>
    </div>
</asp:Content>
