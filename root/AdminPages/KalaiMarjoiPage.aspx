<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMPage.master" AutoEventWireup="true" CodeFile="KalaiMarjoiPage.aspx.cs" Inherits="AdminPages_KalaiMarjoiPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td colspan="2">
            ثبت کالای مرجوعی</td>
    </tr>
    <tr>
        <td>
            کد کالا :</td>
        <td>
            <asp:TextBox ID="TBKalaCode" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TBKalaCode" ErrorMessage="کد کالا را وارد کنید"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            کد انبار :</td>
        <td>
            <asp:TextBox ID="TBAnbarCode" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TBAnbarCode" ErrorMessage="کد انبار را وارد کنید"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            تعداد :</td>
        <td>
            <asp:TextBox ID="TBNum" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TBNum" ErrorMessage="تعداد را وارد کنید"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="ثبت" 
                Width="68px" />
            <br />
            <asp:Label ID="ResLabel" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

