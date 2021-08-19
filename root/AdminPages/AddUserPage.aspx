<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMPage.master" AutoEventWireup="true" CodeFile="AddUserPage.aspx.cs" Inherits="AdminPages_AddUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div align="right" dir="rtl">
    
        <br />
        ثبت کاربر جدید<br />
        لطفا اطلاعات زیر را وارد کنید:<br />
        <table style="width:100%;">
            <tr>
                <td>
                    نام کاربری :</td>
                <td>
                    <asp:TextBox ID="TboxUserName" runat="server"></asp:TextBox>
&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TboxUserName" ErrorMessage="نام کاربری را وارد کنید"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    رمز عبور :</td>
                <td>
                    <asp:TextBox ID="TBoxPass" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TBoxPass" ErrorMessage="رمز عبور را وارد کنید"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    تکرار رمز عبور:</td>
                <td>
                    <asp:TextBox ID="TBoxRePass" runat="server"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TBoxRePass" ControlToValidate="TBoxPass" 
                        ErrorMessage="تکرار رمز عبور صحیح نیست"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    نوع کاربر:</td>
                <td>
&nbsp;
                    <asp:CheckBox ID="RBAdmin" runat="server" Text="کاربر به عنوان مدیر ثبت شود" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="BtnReg" runat="server" Text="ثبت کاربر" 
                        onclick="BtnReg_Click" />
                    &nbsp;
                    <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" 
                        Text="خطا در ثبت کاربر"></asp:Label>
                    <br />
                    <asp:Label ID="SuccessLabel" runat="server" ForeColor="#009900" 
                        Text="کاربر با موفقیت ثبت شد"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    
    </div>
</asp:Content>

