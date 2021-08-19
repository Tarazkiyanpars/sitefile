<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/UserMPage.master" AutoEventWireup="true" CodeFile="SelAnbarPage.aspx.cs" Inherits="AdminPages_SelAnbarPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td style="background-color: #9999FF">
            لیست کالاهای موجود در انبار&nbsp;
            <asp:Label ID="AnbarNameLbl" runat="server" Text="Label"></asp:Label>
            <br />
            کد انبار :
            <asp:Label ID="AnbarCodeLbl" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="background-color: #0099FF">
            مشخصات کالا
            <br />
            برای ثبت کالای جدید&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">اینجا</asp:LinkButton>
&nbsp;کلیک کنید</td>
    </tr>
    <tr>
        <td>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataKeyNames="Code" DataSourceID="AnbarContentDS" 
                ForeColor="#333333" GridLines="None" Height="50px" Width="449px" 
                EmptyDataText="لیست خالی است">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="Code" HeaderText="کد کالا" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Code" />
                    <asp:BoundField DataField="Anbar" HeaderText="کد انبار" 
                        SortExpression="Anbar" />
                    <asp:BoundField DataField="Name" HeaderText="نام کالا" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="قیمت" SortExpression="Price" />
                    <asp:BoundField DataField="Num" HeaderText="تعداد" SortExpression="Num" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="AnbarContentDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM Kala WHERE (Code = @Code)" 
                InsertCommand="INSERT INTO Kala(Anbar, Name, Price, Num) VALUES (@Anbar, @Name, @Price, @Num)" 
                SelectCommand="SELECT Code, Anbar, Name, Price, Num FROM Kala WHERE (Anbar = @Anbar)" 
                
                UpdateCommand="UPDATE Kala SET Anbar = @Anbar, Name = @Name, Price = @Price, Num = @Num WHERE (Code = @Code)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Anbar" SessionField="AnbarCode" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Code" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Anbar" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Price" />
                    <asp:Parameter Name="Num" />
                    <asp:Parameter Name="Code" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Anbar" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Price" />
                    <asp:Parameter Name="Num" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="height: 23px; background-color: #3399FF;">
            لیست کالا ها</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="Code" DataSourceID="AnbarContentDS" ForeColor="#333333" 
                GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                EmptyDataText="لیست خالی است" Width="509px">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" 
                        SelectText="انتخاب" />
                    <asp:BoundField DataField="Code" HeaderText="کد کالا" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Code" />
                    <asp:BoundField DataField="Anbar" HeaderText="کد انبار" 
                        SortExpression="Anbar" />
                    <asp:BoundField DataField="Name" HeaderText="نام کالا" SortExpression="Name" />
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
        </td>
    </tr>
</table>
</asp:Content>

