<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="SalesReservation.aspx.cs" Inherits="SmartSystem.SalesReservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btnaction {
            margin-top: 30px;
        }

        .containData {
            display: flex;
        }

        @media screen and (max-width:768px) {
            .demobile {
                display: none;
            }
        }
    </style>

    <script type="text/javascript">
        function SetNoteError() {
            var Note = document.getElementById('<%= txtNotes.ClientID %>');
            Note.style.borderColor = "red";
        }

        function SetQuantityError() {
            var QTY = document.getElementById('<%= txtReservedStock.ClientID %>');
            QTY.style.borderColor = "red";
        }

        function SetStockError() {
            var QTY = document.getElementById('<%= txtstock.ClientID %>');
            QTY.style.borderColor = "green";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server" enctype="multipart/form-data">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Sales Reservation </h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Sales Reservation File</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">

                    <!-- Timelime example  -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- The time line -->
                            <div class="timeline">
                                <!-- timeline time label -->
                                <div class="time-label" style="width: 100%">
                                    <span title=" حجز كمية من المخزن " class="bg-info" style="font-size: 20px; padding: 10px; width: 100%; text-align: center;">Reserve Stock For Sales</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <div>
                                    <i class="fas fa-tools bg-info"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-tools"></i></span>
                                        <h2 class="timeline-header"><a href="#" style="color: #17a2b8;">Sales Reservation</a></h2>

                                        <div class="timeline-body">

                                            <div class="row">

                                                <div class="form-group col-md-4">
                                                    <label for="Store">Select Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" CssClass="form-control" ID="dsStores" DataSourceID="STORES" DataTextField="STORENAME" DataValueField="STORENUMBER" runat="server" AutoPostBack="True"></asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="selectitem">Select Material</label>
                                                    <asp:DropDownList ToolTip="أختار الصنف" ID="dsMaterials" DataSourceID="ldsitems" DataTextField="MaterialName" DataValueField="ID" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <asp:Button ID="btnGetMaterialData" Width="100%" ToolTip="أظهار بيانات الصنف" CssClass="btn btn-info float-right m80 btnaction" runat="server" Text="Get Material Data" OnClick="btnGetMaterialData_Click" />
                                                </div>
                                            </div>
                                            <asp:Panel ID="pnlMaterialData" runat="server">
                                                <div class="containData col-md-12">
                                                    <div class="d-sm-none d-md-block d-lg-block d-xl-block col-md-4 demobile">
                                                        <img id="materialimg" name="materialimg" src="./Images/Delete.png"  alt="  Item doesn't have Image" style="max-height: 100%; max-width: 100%; height: 250px; width: 350px" runat="server" />
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label for="itemdesc">Name</label>
                                                                <input type="text" disabled title="أسم الصنف" class="form-control" id="itemname" name="itemdesc" runat="server" placeholder="Enter Material Name">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-md-3 col-sm-12">
                                                                <label for="txtstock">Stock</label>
                                                                <input type="text" disabled title="الكمية داخل المخزن" class="form-control" id="txtstock" name="Stock" runat="server">
                                                            </div>

                                                            <div class="form-group col-md-3 col-sm-12">
                                                                <label for="SafetyStock">Safety Stock</label>
                                                                <input type="text" disabled title=" مخزون الأمان" class="form-control" id="SafetyStock" name="SafetyStock" runat="server">
                                                            </div>
                                                            <div class="form-group col-md-3 col-sm-12">
                                                                <label for="txtReservedStock">Reserve Stock</label>
                                                                <input type="text" title="الكمية المطلوب حجزها داخل المخزن" placeholder="الكمية المطلوبة" class="form-control" id="txtReservedStock" name="ReservedStock" runat="server">
                                                            </div>
                                                            <div class="form-group col-md-3 col-sm-12">
                                                                <label for="txtPaidAmount">Paid Amount</label>
                                                                <input type="text" title="المبلغ المدفوع للحجز" placeholder="المبلغ المدفوع" class="form-control" id="txtPaidAmount" name="txtPaidAmount" runat="server">
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="form-group col-md-12">
                                                                <label for="txtNotes">Notes</label>
                                                                <input type="text" title=" سبب حجز الكمية  " placeholder="أدخل ملاحظات" class="form-control" id="txtNotes" name="txtNotes" runat="server">
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="form-group  col-md-3"></div>

                                                            <div class="form-group col-md-5">
                                                                <asp:Label ID="lblError" runat="server" Text="" Visible="false"></asp:Label>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <asp:Button ID="btnReserveStock" Width="100%" ToolTip=" حجز الكمية" CssClass="btn btn-info float-right m80" runat="server" Text="Reserve Stock" OnClick="btnReserveStock_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </asp:Panel>
                                        </div>

                                        <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT DISTINCT M.ID, M.MaterialName FROM Materials AS M INNER JOIN MaterialInStock AS MS ON M.ID = MS.MaterialID WHERE (M.IsActive = 1) AND (MS.StoreID = @StoreID) Order by M.MaterialName ASC">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="dsStores" Name="StoreID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:SqlDataSource ID="STORES" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT * FROM [STORES] "></asp:SqlDataSource>

                                        <asp:SqlDataSource ID="ldsitemscancel" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT DISTINCT M.ID, M.MaterialName FROM Materials AS M INNER JOIN MaterialInStock AS MS ON M.ID = MS.MaterialID WHERE (M.IsActive = 1) AND (MS.StoreID = @StoreID) Order by M.MaterialName ASC">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="selectCancelStore" Name="StoreID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:SqlDataSource ID="STOREScancel" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT * FROM [STORES] "></asp:SqlDataSource>
                                    </div>
                                </div>
                                <!-- END timeline item -->

                                <!-- timeline item -->
                                <div>
                                    <i class="fas fa-cog bg-danger"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-cog"></i></span>
                                        <h2 class="timeline-header"><a style="color: red;">Cancel Reservation</a></h2>

                                        <div class="timeline-body">

                                            <div class="row">

                                                <div class="form-group col-md-4">
                                                    <label for="selectCancelStore">Select Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" CssClass="form-control" ID="selectCancelStore" DataSourceID="STOREScancel" DataTextField="STORENAME" DataValueField="STORENUMBER" runat="server" AutoPostBack="True"></asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="selectcancelitem">Select Material</label>
                                                    <asp:DropDownList ToolTip="أختار الصنف" ID="selectcancelitem" DataSourceID="ldsitemscancel" DataTextField="MaterialName" DataValueField="ID" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <asp:Button ID="btnCancelData" Width="100%" ToolTip="أظهار بيانات الصنف المحجوز" CssClass="btn btn-danger float-right m80 btnaction" runat="server" Text="Get Reservation Data" OnClick="btnCancelData_Click" />
                                                </div>
                                            </div>

                                            <asp:Panel ID="cancelPanel" runat="server">
                                                <div class="containData col-md-12">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="form-group col-md-12">
                                                                <asp:GridView ID="GridData" runat="server" AllowPaging="True" PageSize="5"
                                                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridData_SelectedIndexChanged">
                                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                    <Columns>
                                                                        <asp:TemplateField ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="btnCancelReservation" runat="server" ImageUrl="~/Images/icons8-delete-bin-64.png" Width="40px" Height="40px" CommandName="Select"></asp:ImageButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName" />
                                                                        <asp:BoundField DataField="Quantity" HeaderText="Reserved Quantity" SortExpression="Quantity" />
                                                                        <asp:BoundField DataField="ReservedDate" HeaderText="Reserved Date" SortExpression="ReservedDate" />
                                                                        <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                                                                        <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                                                        <asp:CheckBoxField DataField="Paid" HeaderText="Paid" SortExpression="Paid" Visible="false" />
                                                                        <asp:BoundField DataField="PaidAmount" HeaderText="Paid Amount" SortExpression="PaidAmount" />
                                                                        <asp:BoundField DataField="ReservedStock" HeaderText="Total Reserved" SortExpression="ReservedStock" />
                                                                        <asp:BoundField DataField="StockOnHand" HeaderText="Current Stock" SortExpression="StockOnHand" />
                                                                        <asp:BoundField DataField="MaterialID" HeaderText="Material ID" SortExpression="MaterialID" />
                                                                        <asp:BoundField DataField="StoreID" HeaderText="StoreID" SortExpression="StoreID" />
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
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT Materials.MaterialName, ReservedMaterials.Quantity, ReservedMaterials.ReservedDate, ReservedMaterials.Note, ReservedMaterials.UserName, ReservedMaterials.Paid, ReservedMaterials.PaidAmount, MaterialInStock.ReservedStock, MaterialInStock.StockOnHand, MaterialInStock.MaterialID, MaterialInStock.StoreID FROM MaterialInStock INNER JOIN Materials ON MaterialInStock.MaterialID = Materials.ID INNER JOIN ReservedMaterials ON MaterialInStock.ID = ReservedMaterials.MaterialInStock WHERE (MaterialInStock.StoreID = @storeID) AND (MaterialInStock.MaterialID = @MaterialID) and ReservedMaterials.UserName = @UserName and ReservedMaterials.IsDeleted = 0">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="selectCancelStore" Name="storeID" PropertyName="SelectedValue" />
                                                                        <asp:ControlParameter ControlID="selectcancelitem" Name="MaterialID" PropertyName="SelectedValue" />
                                                                        <asp:SessionParameter Name="UserName" SessionField="UserName" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </asp:Panel>
                                        </div>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT DISTINCT M.ID, M.MaterialName FROM Materials AS M INNER JOIN MaterialInStock AS MS ON M.ID = MS.MaterialID WHERE (M.IsActive = 1) AND (MS.StoreID = @StoreID) Order by M.MaterialName ASC">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="dsStores" Name="StoreID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT * FROM [STORES] "></asp:SqlDataSource>
                                    </div>
                                </div>
                                <!-- END timeline item -->

                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
            </section>
        </div>
        <!-- /.timeline -->

    </form>


</asp:Content>
