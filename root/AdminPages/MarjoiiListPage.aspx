<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMPage.master" AutoEventWireup="true" CodeFile="MarjoiiListPage.aspx.cs" Inherits="MarjoiiListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td>
            لیست کالا های مرجوعی</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="MarjoiiListDS" ForeColor="#333333" GridLines="None" Width="559px">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="کد" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="KalaCode" HeaderText="کد کالا" 
                        SortExpression="KalaCode" />
                    <asp:BoundField DataField="AnbarCode" HeaderText="کد انبار" 
                        SortExpression="AnbarCode" />
                    <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                    <asp:BoundField DataField="Num" HeaderText="تعداد" SortExpression="Num" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="MarjoiiListDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT [id], [KalaCode], [AnbarCode], [Date], [Num] FROM [Marjoii]">
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

