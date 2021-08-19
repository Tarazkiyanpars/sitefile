<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMPage.master" AutoEventWireup="true" CodeFile="NewAnbarPage.aspx.cs" Inherits="AdminPages_NewAnbarPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td colspan="2">
            <br />
            <br />
            ثبت انبار جدید<br />
            لطفا اطلاعات زیر را وارد کنید:</td>
    </tr>
    <tr>
        <td>
            نام انبار :</td>
        <td>
            <asp:TextBox ID="TBoxAnbarName" runat="server" Width="172px"></asp:TextBox>
&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="نام انبار را وارد کنید" ControlToValidate="TBoxAnbarName"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            مدیر انبار :</td>
        <td>
            <asp:DropDownList ID="DDLAnbarAdmin" runat="server" DataSourceID="UserListDS" 
                DataTextField="ID" DataValueField="ID" Height="17px" Width="175px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="مدیر انبار را انتخاب کنید" ControlToValidate="DDLAnbarAdmin"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="UserListDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [ID] FROM [Users]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="ثبت انبار" Width="91px" />
&nbsp;<asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Text="خطا هنگام ثبت انبار"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

