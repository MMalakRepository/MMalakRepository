<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="DeadMaterialsReport.aspx.cs" Inherits="SmartSystem.DeadMaterialsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnaction {
            margin-top: 30px;
            margin-left: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Dead Materials Reports</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Dead Materials Reports</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <div class="row mb-2">

                    <div class="container-fluid">
                        <form id="Form1" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-info card-outline">
                                        <div class="card-header">
                                            <h3 class="card-title">Dead Materials Report By Store</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <!-- /.card-header -->
                                        <!-- card-body -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="SelectStores">Select Store Location</label>
                                                    <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المخزن" CssClass="form-control" ID="SelectStores" runat="server" DataSourceID="ldsstores" DataTextField="StoreName" DataValueField="StoreNumber" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0">Select Store ..</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:Button ID="btnExportStore" Visible="false" CssClass="btn btn-info btnaction float-right" runat="server" Text="Excel" OnClick="btnExportStore_Click" />
                                                    <asp:Button ID="btnExportstorePDF" Visible="false" CssClass="btn btn-info btnaction float-right" runat="server" Text="PDF" OnClick="btnExportstorePDF_Click" />
                                                    <asp:ImageButton ID="btnExportstorePDF2" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportstorePDF_Click" />
                                                    <asp:ImageButton ID="btnExportStoreExcel" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnExportStore_Click" />

                                                </div>
                                                <asp:SqlDataSource ID="ldsstores" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Stores] ">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridData" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <%--<asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo" />--%>
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                            <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
                                                            <%--<asp:BoundField DataField="Description" HeaderText="Desc" SortExpression="Description" />--%>
                                                            <asp:BoundField DataField="ActionDate" HeaderText="Action Date" SortExpression="ActionDate" />
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                            <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" />
                                                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
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
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT M.MaterialNo, M.MaterialName, S.StoreName, M.Description, DeadMaterials.ActionDate, DeadMaterials.Height, DeadMaterials.Width, DeadMaterials.Notes, DeadMaterials.Quantity, DeadMaterials.UserName FROM Materials AS M INNER JOIN DeadMaterials ON M.ID = DeadMaterials.MaterialID INNER JOIN Stores AS S ON DeadMaterials.StoreID = S.ID WHERE (DeadMaterials.StoreID = @StoreID)">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                                            <asp:ControlParameter ControlID="SelectStores" DefaultValue="" Name="StoreID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-warning card-outline">

                                        <div class="card-header">
                                            <h3 class="card-title">Dead Material Information By Material</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="SelectStores">Select Material</label>
                                                    <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار الصنف" CssClass="form-control" ID="selectitems" runat="server" DataSourceID="ldsMaterials" DataTextField="MaterialName" DataValueField="ID" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Enabled="true">Select Material .. </asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:Button ID="btnExportMaterials" Visible="false" CssClass="btn btn-warning btnaction float-right" runat="server" Text="Excel" OnClick="btnExportMaterials_Click" />
                                                    <asp:Button ID="btnExportMaterialsPDF" Visible="false" CssClass="btn btn-warning btnaction float-right" runat="server" Text="PDF" OnClick="btnExportMaterialsPDF_Click" />
                                                    <asp:ImageButton ID="btnExportMaterialPDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportMaterialsPDF_Click" />
                                                    <asp:ImageButton ID="btnExportMaterialExcel" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnExportMaterials_Click" />

                                                </div>
                                                <asp:SqlDataSource ID="ldsMaterials" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Materials]  ">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" PageSize="5" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo" />
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                            <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
                                                            <%--<asp:BoundField DataField="Description" HeaderText="Desc" SortExpression="Description" />--%>
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                            <asp:BoundField DataField="ActionDate" HeaderText="ActionDate" SortExpression="ActionDate" />
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                            <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" />
                                                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
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

                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT M.MaterialNo, M.MaterialName, S.StoreName, M.Description, DeadMaterials.Notes, DeadMaterials.ActionDate, DeadMaterials.Height, DeadMaterials.Width, DeadMaterials.Quantity, DeadMaterials.UserName FROM Materials AS M INNER JOIN DeadMaterials ON M.ID = DeadMaterials.MaterialID INNER JOIN Stores AS S ON DeadMaterials.StoreID = S.ID WHERE (DeadMaterials.MaterialID = @MaterialID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="selectitems" Name="MaterialID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-success card-outline">

                                        <div class="card-header">
                                            <h3 class="card-title">Dead Material Information By Supplier</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="SelectStores">Select Supplier</label>
                                                    <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المورد" CssClass="form-control" ID="selectsupplier" runat="server" DataSourceID="ldssuppliers" DataTextField="Name" DataValueField="SupplierID" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Enabled="true">Select Supplier .. </asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-6">

                                                    <asp:Button ID="btnSupplierData" Visible="false" CssClass="btn btn-success btnaction float-right" runat="server" Text="Excel" OnClick="btnSupplierData_Click" />
                                                    <asp:Button ID="btnExportSupplierPDF" Visible="false" CssClass="btn btn-success btnaction float-right" runat="server" Text="PDF" OnClick="btnExportSupplierPDF_Click" />
                                                    <asp:ImageButton ID="ImageButton1" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportSupplierPDF_Click" />
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnSupplierData_Click" />

                                                </div>
                                                <asp:SqlDataSource ID="ldssuppliers" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Supplier]  ">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridSupplierData" runat="server" AutoGenerateColumns="False" PageSize="5" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="100%">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                            <asp:BoundField DataField="ActionDate" HeaderText="ActionDate" SortExpression="ActionDate" />
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                            <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" />
                                                            <asp:BoundField DataField="StoreName" HeaderText="StoreName" SortExpression="StoreName" />
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

                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT Materials.MaterialName, DeadMaterials.Notes, DeadMaterials.ActionDate, DeadMaterials.Height, DeadMaterials.Width, Supplier.Name AS Supplier, Stores.StoreName FROM DeadMaterials INNER JOIN Materials ON DeadMaterials.MaterialID = Materials.ID INNER JOIN Stores ON DeadMaterials.StoreID = Stores.ID INNER JOIN Supplier ON Materials.SupplierID = Supplier.SupplierID WHERE (Materials.SupplierID = @SupplierID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="selectsupplier" Name="SupplierID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
