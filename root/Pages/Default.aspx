<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 773px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table style="width: 100%; background-color: #FFFFCC;" dir="rtl" 
            cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" valign="middle" class="style1" 
                    style="border-style: groove; border-width: medium">
                &nbsp;&nbsp;<br />
                    <br />
                    <br />
&nbsp;<table style="border-style: double; width: '400px'; background-color: #99FF99;">
                        <tr>
                            <td>
            
                                نام کاربری :</td>
                            <td>
                             
                                <asp:TextBox ID="TBUserName" runat="server" 
                                    ontextchanged="TBUserName_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
   
                                رمز عبور :</td>
                            <td>
                                <asp:TextBox ID="TBPass" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;

                                <asp:Button ID="Button1" runat="server" Text="ورود" Width="106px" 
                                    onclick="Button1_Click" style="height: 26px" />
                            </td>
                        </tr>
                    </table> 
                    <asp:Label ID="ErrorLabel" runat="server" 
                        Text="نام کاربری یا رومز عبور اشتباه می باشد"></asp:Label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TBUserName" ErrorMessage="نام کاربری را وارد کنید"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TBPass" ErrorMessage="پسورد را وارد کنید"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
</asp:Content>

