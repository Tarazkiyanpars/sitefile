<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/UserMPage.master" AutoEventWireup="true"
    CodeFile="AnbarList.aspx.cs" Inherits="AdminPages_AnbarList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                مشخصات انبار
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                لیست انبار ها
            </td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="Code" DataSourceID="AnbarListDS">
                    <ItemTemplate>
                        <tr style="background-color: #DCDCDC; color: #000000;">
                            <td>
                                <asp:Label ID="CodeLabel" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="AdminLabel" runat="server" Text='<%# Eval("Admin") %>' />
                            </td>
                            <td>
                                                               <a href='<%# "SelAnbarPage.aspx?SelAnbar="+Eval("Code")+"&AddToSession=Yes" %>'>
                                    موجودی انبار</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFF8DC;">
                            <td>
                                <asp:Label ID="CodeLabel" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="AdminLabel" runat="server" Text='<%# Eval("Admin") %>' />
                            </td>
                            <td>
                               <a href='<%# "SelAnbarPage.aspx?SelAnbar="+Eval("Code")+"&AddToSession=Yes" %>'>
                                    موجودی انبار</a>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                            border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>
                                    No data was returned.
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="AdminTextBox" runat="server" Text='<%# Bind("Admin") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                                        border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                                        font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                            <th runat="server">
                                            کد انبار
                                            </th>
                                            <th runat="server">
                                                نام انبار
                                            </th>
                                            <th runat="server">
                                                مدیر انبار
                                            </th>
                                            <th runat="server">
                                                اختیارات
                                            </th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                                    color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #008A8C; color: #FFFFFF;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="CodeLabel1" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="AdminTextBox" runat="server" Text='<%# Bind("Admin") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="CodeLabel" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="AdminLabel" runat="server" Text='<%# Eval("Admin") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="AnbarListDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM AnbarList WHERE (Code = @Code)" InsertCommand="INSERT INTO AnbarList(Name, Admin) VALUES (@Name, @Admin)"
                    
                    SelectCommand="SELECT Code, Name, Admin FROM AnbarList WHERE (Admin = @Admin)" 
                    UpdateCommand="UPDATE AnbarList SET Name = @Name, Admin = @Admin WHERE (Code = @Code)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Admin" SessionField="USER" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Code" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" />
                        <asp:Parameter Name="Admin" />
                        <asp:Parameter Name="Code" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" />
                        <asp:Parameter Name="Admin" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
