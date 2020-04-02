<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="InternalOrdersReport.aspx.cs" Inherits="SmartSystem.InternalOrdersReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnaction {
            margin-top: 30px;
            margin-left: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server" enctype="multipart/form-data">
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Internal orders Data Reports</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Internal Orders Data Reports</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">

                        <div class="container-fluid">
                                <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-danger card-outline">
                                        <div class="card-header">
                                            <h3 class="card-title">Print Orders Data By Customer</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="Store">Select Customer </label>
                                                    <asp:DropDownList ToolTip="أختار العميل" AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="SelectCustomerOrders" DataSourceID="ldsCustomers" DataTextField="CustomerName"
                                                        DataValueField="CustomerID" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Text="Select Customer"></asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:SqlDataSource ID="ldsCustomers" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT * FROM [Customers] Order By CustomerName Asc "></asp:SqlDataSource>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:ImageButton ID="btnExportCustomerOrdersPDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportCustomerOrdersPDF_Click"/>
                                                    <asp:ImageButton ID="btnExportCustomerOrdersExcel" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png"  OnClick="btnExportCustomerOrdersExcel_Click"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridOrders" runat="server" PageSize="5" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                                                        DataSourceID="SqlDataSource4" Width="100%" AllowPaging="True"
                                                        AllowSorting="True" DataKeyNames="OrderNo" OnSelectedIndexChanged="GridOrders_SelectedIndexChanged">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ImageUrl="~/Images/icons8-print-64.png" Width="40px" Height="40px" CommandName="Select"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName"></asp:BoundField>
                                                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate"></asp:BoundField>
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
                                                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" 
                                                        SelectCommand="SELECT Orders.ID AS OrderNo, Orders.OrderDate, Orders.Notes, Orders.UserName, Customers.CustomerName, Customers.PhoneNumber FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID WHERE (Orders.CustomerID = @CustomerID) Order By Orders.ID Desc">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                                            <asp:ControlParameter ControlID="SelectCustomerOrders" DefaultValue="" Name="CustomerID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>
 

                                        </div>
                                        <!-- /.card -->
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-info card-outline">
                                        <div class="card-header">
                                            <h3 class="card-title">Internal Orders Data By Customer</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="Store">Select Customer </label>
                                                    <asp:DropDownList ToolTip="أختار العميل" AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="Customer" DataSourceID="Customers" DataTextField="CustomerName"
                                                        DataValueField="CustomerID" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Text="Select Customer"></asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:SqlDataSource ID="Customers" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT * FROM [Customers] Order By CustomerName Asc "></asp:SqlDataSource>
                                                </div>


                                                <div class="form-group col-md-6">
                                                    <asp:ImageButton ID="btnExportstorePDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportstorePDF_Click" />
                                                    <asp:ImageButton ID="btnExportStoreExce" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnExportStoreExce_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridData" runat="server" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="OrderNo">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:BoundField DataField="OrderNo" HeaderText="Order" SortExpression="OrderNo" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                                            <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate"></asp:BoundField>
                                                            <asp:BoundField DataField="StoreID" HeaderText="Store" SortExpression="StoreID" />
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName"></asp:BoundField>
                                                            <asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo"></asp:BoundField>
                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes"></asp:BoundField>
                                                            <asp:BoundField DataField="MaterialType" HeaderText="Type" SortExpression="MaterialType" />
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" 
                                                        SelectCommand="SELECT Materials.MaterialName, Materials.MaterialNo, 
                                                        OrderDetails.Quantity, Orders.ID AS OrderNo, Orders.OrderDate, Orders.Notes,
                                                        OrderDetails.StoreID, OrderDetails.MaterialType, OrderDetails.Height,
                                                        OrderDetails.Width FROM OrderDetails INNER JOIN Materials
                                                        ON OrderDetails.MaterialID = Materials.ID 
                                                        INNER JOIN Orders ON OrderDetails.OrderID = Orders.ID 
                                                        INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
                                                        WHERE (Customers.CustomerID = @CustomerID) And OrderDetails.IsActive = 1 Order By orderDetails.ID Desc">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                                            <asp:ControlParameter ControlID="Customer" DefaultValue="" Name="CustomerID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- /.card -->
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-warning card-outline">
                                        <div class="card-header">
                                            <h3 class="card-title">Internal Orders Data By Material</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="selectitems">Select Material</label>
                                                    <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار الصنف" CssClass="form-control" ID="selectitems" runat="server" DataSourceID="ldsMaterials" DataTextField="MaterialName" DataValueField="ID" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Enabled="true">Select Material .. </asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <asp:SqlDataSource ID="ldsMaterials" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Materials]  ">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <div class="form-group col-md-6">
                                                    <asp:ImageButton ID="btnExportMaterialPDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportMaterialPDF_Click" />
                                                    <asp:ImageButton ID="btnExportMaterialExcel" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnExportMaterialExcel_Click" />
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridMaterials" runat="server" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="OrderNo">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName"></asp:BoundField>
                                                            <asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo"></asp:BoundField>
                                                            <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
                                                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName"></asp:BoundField>
                                                            <asp:BoundField DataField="OrderNo" HeaderText="Order" SortExpression="OrderNo" InsertVisible="False" ReadOnly="True" />
                                                            <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate"></asp:BoundField>
                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height"></asp:BoundField>
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                            <asp:BoundField DataField="MaterialType" HeaderText="Type" SortExpression="MaterialType" />

                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    </asp:GridView>


                                                </div>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" 
                                                SelectCommand="SELECT Materials.MaterialName, Materials.MaterialNo, Orders.ID AS OrderNo, Orders.OrderDate, OrderDetails.Quantity, 
                                                OrderDetails.Height, OrderDetails.Width, OrderDetails.MaterialType, Stores.StoreName, Customers.CustomerName FROM Materials
                                                INNER JOIN OrderDetails ON Materials.ID = OrderDetails.MaterialID INNER JOIN Orders ON OrderDetails.OrderID = Orders.ID 
                                                INNER JOIN Stores ON OrderDetails.StoreID = Stores.ID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
                                                WHERE (Materials.ID = @MaterialID) And OrderDetails.IsActive = 1 Order By orderDetails.ID Desc">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="selectitems" DefaultValue="" Name="MaterialID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>


                                    </div>
                                    <!-- /.card -->
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>



    </form>
</asp:Content>
