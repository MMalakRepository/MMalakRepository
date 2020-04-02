<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CuttingListReport.aspx.cs" Inherits="SmartSystem.CuttingListReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnaction {
            margin-top: 30px;
            margin-left: 20px;
        }
    </style>

    <script type="text/javascript">
        function SelectCategory() {
            var t = document.getElementById('custom-tabs-one-home');
            t.classList.remove("show");
            t.classList.remove("active");

            var elem = document.getElementById('custom-tabs-one-settings');
            elem.classList.add("active");
            elem.classList.add("show");


            var r = document.getElementById('custom-tabs-one-home-tab');
            r.classList.remove("active");
            r.setAttribute("aria-selected", "false");

            var r2 = document.getElementById('custom-tabs-one-settings-tab');
            r2.classList.add("active");
            r2.setAttribute("aria-selected", "true");
        }

        function SelectSupplier() {
            var t = document.getElementById('custom-tabs-one-home');
            t.classList.remove("show");
            t.classList.remove("active");

            var elem = document.getElementById('custom-tabs-one-messages');
            elem.classList.add("active");
            elem.classList.add("show");


            var r = document.getElementById('custom-tabs-one-home-tab');
            r.classList.remove("active");
            r.setAttribute("aria-selected", "false");

            var r2 = document.getElementById('custom-tabs-one-messages-tab');
            r2.classList.add("active");
            r2.setAttribute("aria-selected", "true");
        }

        function SelectMaterial() {
            var t = document.getElementById('custom-tabs-one-home');
            t.classList.remove("show");
            t.classList.remove("active");

            var elem = document.getElementById('custom-tabs-one-profile');
            elem.classList.add("active");
            elem.classList.add("show");


            var r = document.getElementById('custom-tabs-one-home-tab');
            r.classList.remove("active");
            r.setAttribute("aria-selected", "false");

            var r2 = document.getElementById('custom-tabs-one-profile-tab');
            r2.classList.add("active");
            r2.setAttribute("aria-selected", "true");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>CuttingList Data Reports</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                            <li class="breadcrumb-item active">CuttingList Data Reports</li>
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
                        <form id="Form1" runat="server">
                            <div class="col-12 col-sm-12 col-lg-12">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <div class="card card-info card-tabs">
                                    <div class="card-header p-0 pt-1">
                                        <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">By Store</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">By Material</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill" href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false">By Supplier</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="custom-tabs-one-settings-tab" data-toggle="pill" href="#custom-tabs-one-settings" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">By Category</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content" id="custom-tabs-one-tabContent">
                                            <div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-warning card-outline">

                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="SelectStores">Select Store Location</label>
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المخزن"
                                                                            CssClass="form-control" ID="SelectStores" runat="server"
                                                                            DataSourceID="ldsstores" DataTextField="StoreName" DataValueField="StoreNumber" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0">Select Store ..</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetStoreData" CssClass="btn btn-warning btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetStoreData_Click" />
                                                                    </div>
                                                                    <div class="form-group col-md-3">
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
                                                                        <asp:GridView ID="GridData" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo" />
                                                                                <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                                                <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
                                                                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                                                <asp:BoundField DataField="ActionDate" HeaderText="Date" SortExpression="ActionDate" />
                                                                                <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                                                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                                                <asp:BoundField DataField="UserName" HeaderText="User" SortExpression="UserName" />
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
                                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT M.MaterialNo, M.MaterialName, S.StoreName, CuttingListsMaterials.Notes, CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width, CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName FROM Materials AS M INNER JOIN CuttingListsMaterials ON M.ID = CuttingListsMaterials.MaterialID INNER JOIN Stores AS S ON CuttingListsMaterials.StoreID =S.ID
Where CuttingListsMaterials.StoreID = @StoreID">
                                                                            <SelectParameters>
                                                                                <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                                                                <asp:ControlParameter ControlID="SelectStores" DefaultValue="" Name="StoreID" PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                            <!-- /.card -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-danger card-outline">
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="SelectStores">Select Material</label>
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار الصنف"
                                                                            CssClass="form-control" ID="selectitems" runat="server"
                                                                            DataSourceID="ldsMaterials" DataTextField="MaterialName" DataValueField="ID" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0" Enabled="true">Select Material .. </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetMaterialData" CssClass="btn btn-danger btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetMaterialData_Click" />
                                                                    </div>
                                                                    <div class="form-group col-md-3">
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
                                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" PageSize="10" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo" />
                                                                                <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                                                <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
                                                                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                                                <asp:BoundField DataField="ActionDate" HeaderText="Date" SortExpression="ActionDate" />
                                                                                <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                                                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                                                <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" />
                                                                                <asp:BoundField DataField="UserName" HeaderText="User" SortExpression="UserName" />
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

                                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT M.MaterialNo, M.MaterialName, S.StoreName, CuttingListsMaterials.Notes, CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width, CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName FROM Materials AS M INNER JOIN CuttingListsMaterials ON M.ID = CuttingListsMaterials.MaterialID INNER JOIN Stores AS S ON CuttingListsMaterials.StoreID = S.ID WHERE (CuttingListsMaterials.MaterialID = @MaterialID)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="selectitems" Name="MaterialID" PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-success card-outline">
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="SelectStores">Select Supplier</label>
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المورد"
                                                                            CssClass="form-control" ID="selectsupplier" runat="server"
                                                                            DataSourceID="ldssuppliers" DataTextField="Name" DataValueField="SupplierID" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0" Enabled="true">Select Supplier .. </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetSupplierData" CssClass="btn btn-success btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetSupplierData_Click" />
                                                                    </div>
                                                                    <div class="form-group col-md-3">
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
                                                                        <asp:GridView ID="GridSupplierData" runat="server" AutoGenerateColumns="False" PageSize="10" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AllowSorting="True">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                                                <asp:BoundField DataField="ActionDate" HeaderText="Date" SortExpression="ActionDate" />
                                                                                <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                                                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                                                <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" />
                                                                                <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
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

                                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT Materials.MaterialName, Supplier.Name AS Supplier, Stores.StoreName, CuttingListsMaterials.Notes, CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width, CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName FROM Materials INNER JOIN Supplier ON Materials.SupplierID = Supplier.SupplierID INNER JOIN CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN Stores ON CuttingListsMaterials.StoreID = Stores.ID WHERE (Materials.SupplierID = @SupplierID)">
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

                                            </div>


                                            <div class="tab-pane fade" id="custom-tabs-one-settings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-info card-outline">
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="SelectCategory">Select Category</label>
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المورد"
                                                                            CssClass="form-control" ID="SelectCategory" runat="server"
                                                                            DataSourceID="ldsCategories" DataTextField="CategoryName" DataValueField="CategoruID" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0" Enabled="true">Select Category .. </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetDataByCategory" CssClass="btn btn-info btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetDataByCategory_Click" />
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:ImageButton ID="btnGetDataByCategoryPDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnGetDataByCategoryPDF_Click" />
                                                                        <asp:ImageButton ID="btnGetDataByCategoryExcel" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnGetDataByCategoryExcel_Click" />
                                                                    </div>
                                                                    <asp:SqlDataSource ID="ldsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Category]  ">
                                                                        <SelectParameters>
                                                                            <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">
                                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" PageSize="10" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AllowSorting="True">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                                                <asp:BoundField DataField="ActionDate" HeaderText="Date" SortExpression="ActionDate" />
                                                                                <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                                                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                                                <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" />
                                                                                <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
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

                                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT Materials.MaterialName, Supplier.Name AS Supplier, Stores.StoreName, CuttingListsMaterials.Notes, CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width, CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName FROM Materials INNER JOIN Supplier ON Materials.SupplierID = Supplier.SupplierID INNER JOIN CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN Stores
 ON CuttingListsMaterials.StoreID = Stores.ID WHERE Materials.TypeID in (select ID from SubCategories where CategoryID = @categoryID)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="SelectCategory" Name="categoryID" PropertyName="SelectedValue" />
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
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="SelectSubCategory">Select SubCategory</label>
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المورد"
                                                                            CssClass="form-control" ID="SelectSubCategory" runat="server"
                                                                            DataSourceID="ldsSubCategories" DataTextField="SubCategoryName" DataValueField="ID" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0" Enabled="true">Select SubCategory .. </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetDataBySubCategory" CssClass="btn btn-warning btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetDataBySubCategory_Click" />
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:ImageButton ID="btnExportSubCategoryDataPDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportSubCategoryDataPDF_Click" />
                                                                        <asp:ImageButton ID="btnExportSubCategoryDataExcel" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png" OnClick="btnExportSubCategoryDataExcel_Click" />
                                                                    </div>
                                                                    <asp:SqlDataSource ID="ldsSubCategories" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT ID, SubCategoryName FROM SubCategories Order By SubCategoryName Desc"></asp:SqlDataSource>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">
                                                                        <asp:GridView ID="GridSubCategory" runat="server" AutoGenerateColumns="False" PageSize="10" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AllowSorting="True">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                                                                <asp:BoundField DataField="ActionDate" HeaderText="Date" SortExpression="ActionDate" />
                                                                                <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                                                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                                                <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" />
                                                                                <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
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

                                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT Materials.MaterialName, Supplier.Name AS Supplier, Stores.StoreName, CuttingListsMaterials.Notes, CuttingListsMaterials.ActionDate, CuttingListsMaterials.Height, CuttingListsMaterials.Width, CuttingListsMaterials.Quantity, CuttingListsMaterials.UserName FROM Materials INNER JOIN Supplier ON Materials.SupplierID = Supplier.SupplierID INNER JOIN CuttingListsMaterials ON Materials.ID = CuttingListsMaterials.MaterialID INNER JOIN Stores
 ON CuttingListsMaterials.StoreID = Stores.ID WHERE Materials.TypeID = @categoryID">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="SelectSubCategory" Name="categoryID" PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.card -->
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
