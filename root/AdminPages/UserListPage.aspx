<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMPage.master" AutoEventWireup="true" CodeFile="UserListPage.aspx.cs" Inherits="AdminPages_UserListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td style="background-color: #99CC00">
            مشخسات کاربر</td>
    </tr>
    <tr>
        <td>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                DataKeyNames="ID" DataSourceID="UserDS" Height="50px" Width="489px" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <RowStyle BackColor="#EFF3FB" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="نام کاربری" ReadOnly="True" 
                        SortExpression="ID" />
                    <asp:BoundField DataField="Pass" HeaderText="رمز عبور" SortExpression="Pass" />
                    <asp:CheckBoxField DataField="IsAdmin" HeaderText="ثبت کاربر به عنوان مدیر" 
                        SortExpression="IsAdmin" />
                    <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" 
                        InsertText="درج" NewText="جدید" SelectText="انتخاب" ShowDeleteButton="True" 
                        ShowEditButton="True" UpdateText="ثبت ویرایش" />
                </Fields>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="UserDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM Users WHERE (ID = @ID)" 
                InsertCommand="INSERT INTO Users(ID, Pass, IsAdmin) VALUES (@ID, @Pass, @IsAdmin)" 
                SelectCommand="SELECT ID, Pass, IsAdmin FROM Users" 
                UpdateCommand="UPDATE Users SET ID = @ID, Pass = @Pass, IsAdmin = @IsAdmin">
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" />
                    <asp:Parameter Name="Pass" />
                    <asp:Parameter Name="IsAdmin" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" />
                    <asp:Parameter Name="Pass" />
                    <asp:Parameter Name="IsAdmin" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="background-color: #99CC00">
            لیست کاربران</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="ID" DataSourceID="UserDS" ForeColor="#333333" GridLines="None" 
                Width="508px" onselectedindexchanged="GridView1_SelectedIndexChanged">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField DeleteText="حذف" SelectText="انتخاب" 
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="نام کاربری" ReadOnly="True" 
                        SortExpression="ID" />
                    <asp:BoundField DataField="Pass" HeaderText="رمز عبور" SortExpression="Pass" />
                    <asp:CheckBoxField DataField="IsAdmin" HeaderText="مدیر" 
                        SortExpression="IsAdmin" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>

