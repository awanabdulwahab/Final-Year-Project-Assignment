<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SE_lab.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 100px 10px 10px 20px;">
            </div>
    <div style="padding-left:25px;">  
        <h1>Report</h1><br />
        <asp:Button ID="btn_Report" runat="server" Text="Download Report" OnClick="btn_Report_Click" /><br />
        <asp:GridView ID="display_Evalution" runat="server"></asp:GridView>
    </div>
</asp:Content>
