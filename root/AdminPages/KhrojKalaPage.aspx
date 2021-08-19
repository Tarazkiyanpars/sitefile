<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMPage.master" AutoEventWireup="true"
    CodeFile="KhrojKalaPage.aspx.cs" Inherits="AdminPages_KhrojKalaPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                ثبت خروج کالا
            </td>
        </tr>
        <tr>
            <td>
                انبار&nbsp; :&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AnbarListDs" DataTextField="Name"
                    DataValueField="Code" Width="227px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AnbarListDs" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [Name], [Code] FROM [AnbarList]"></asp:SqlDataSource>
                &nbsp;
                <asp:Button ID="Button1" runat="server" Text="انتخاب" />
            </td>
        </tr>
        <tr>
            <td>
                لیست کالا های انبار :
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                    DataSourceID="kalaListDS" AllowPaging="True" CellPadding="4" ForeColor="#333333"
                    GridLines="None" EmptyDataText="لیست خالی است" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Code" HeaderText="کد کالا" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" />
                        <asp:BoundField DataField="Anbar" HeaderText="کد انبار" 
                            SortExpression="Anbar" />
                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                        <asp:BoundField DataField="Price" HeaderText="قیمت" SortExpression="Price" />
                        <asp:BoundField DataField="Num" HeaderText="تعداد" SortExpression="Num" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="kalaListDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM Kala WHERE (Code = @Code)" SelectCommand="SELECT Code, Anbar, Name, Price, Num FROM Kala WHERE (Anbar = @Anbar)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Anbar" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Code" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                کالای انتخاب شده
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="264px" AutoGenerateRows="False"
                    CellPadding="4" DataKeyNames="Code" DataSourceID="kalaListDS" ForeColor="#333333"
                    GridLines="None" EmptyDataText="کالا انتخاب نشده است">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <FooterTemplate>
                        تعداد :
                        <asp:TextBox ID="NumTBox" runat="server">1</asp:TextBox>
                        &nbsp;<asp:Button ID="RegBtn" runat="server" OnClick="RegBtn_Click" Text="ثبت" />
                    </FooterTemplate>
                    <Fields>
                        <asp:BoundField DataField="Code" HeaderText="کد کالا" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" />
                        <asp:BoundField DataField="Anbar" HeaderText="کد انبار" 
                            SortExpression="Anbar" />
                        <asp:BoundField DataField="Name" HeaderText="نام کالا" SortExpression="Name" />
                        <asp:BoundField DataField="Price" HeaderText="قیمت" SortExpression="Price" />
                        <asp:BoundField DataField="Num" HeaderText="تعداد" SortExpression="Num" />
                    </Fields>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="ResLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
