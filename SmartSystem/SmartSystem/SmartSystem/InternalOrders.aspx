<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="InternalOrders.aspx.cs" Inherits="SmartSystem.InternalOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".card-orange").addClass("collapsed-card");
            $(".customerdata").css("display", "none");
            $("#addcustomer").addClass("fa-plus");
            $("#addcustomer").removeClass("fa-minus");
        });
    </script>  
    <style>
        .btnaction {
            margin-top: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server" enctype="multipart/form-data">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>New Internal Orders</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Internal Orders</li>
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
                                <div class="time-label">
                                    <span style="font-size: 25px; padding: 10px; width: 100%; text-align: center; 
                                   background-color: #009999; color: white;">WareHouse Order</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->

                                <div id="NCustomer" runat="server" name="NCustomer">
                                    <i class="fas fa-user" style="background-color: #08AD96; color: white"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt" style="background-color: #08AD96; color: white;"></i></span>

                                        <div class="timeline-body">
                                            <div class="col-md-12">
                                                <div class="card card-orange">
                                                    <div class="card-header" style="background-color:#08AD96">
                                                        <h3 class="card-title text-bold text-white">أضافة عميل جديد </h3>

                                                        <div class="card-tools">
                                                            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                                                <i id="addcustomer" class="fas fa-minus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body customerdata">
                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label for="customernumber">Customer Number</label>
                                                                <input title=" رقم العميل" type="text" class="form-control" id="customernumber" name="customernumber" runat="server" placeholder="رقم العميل">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="customername">Customer Name</label>
                                                                <input title="أسم العميل" type="text" class="form-control" id="customername" name="customername" runat="server" placeholder="أسم العميل">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label for="customeremail">Email Address</label>
                                                                <input title=" البريد الألكترونى" type="text" class="form-control" name="customeremail" runat="server" id="customeremail" placeholder="البريد الألكترونى">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="customeraddress">Address</label>
                                                                <input title="العنوان" type="text" class="form-control" id="customeraddress" name="customeraddress" runat="server" placeholder="العنوان">
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label for="contactperson">Contact Person</label>
                                                                <input title="أسم الشخص المسئول" type="text" class="form-control" id="contactperson" name="contactperson" runat="server" placeholder="الشخص المسئول">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="phonenumber">Phone Number</label>
                                                                <input title="رقم التليفون" type="text" class="form-control" id="phonenumber" name="phonenumber" runat="server" placeholder="رقم الهاتف">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <asp:Button ToolTip="أضافة عميل جديد" ID="btnAddNewCustomer"
                                                                    CssClass="btn float-right" runat="server" BackColor="#08AD96" ForeColor="White"
                                                                    Text="Add New Customer" OnClick="btnAddNewCustomer_Click" />
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <!-- /.card-body -->
                                                </div>
                                                <!-- /.card -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <i class="fa fa-store-alt" style="background-color:#0AD6B8; color: white;"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt" style="background-color:#0AD6B8; color: white;"></i></span>
                                        <h3 class="timeline-header" style="background-color:#0AD6B8; color: white;">أضافة أذن صرف</h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="Customer">Select Customer </label>
                                                    <asp:DropDownList ToolTip="أختار العميل" AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="Customer" DataSourceID="Customers" DataTextField="CustomerName"
                                                        DataValueField="CustomerID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0" Text="أختار العميل"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtOrderNotes">Notes</label>
                                                    <input type="text" title="ملاحظات أضافية" class="form-control" id="txtOrderNotes"
                                                        name="txtOrderNotes" runat="server" placeholder="ملاحظات أضافية">
                                                </div>
                                                <div class="form-group col-md-1">
                                                    <asp:Label ID="LblOrderID" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnAddNewOrder" ToolTip="أضافة أمر تشغيل" 
                                                        Width="100%" CssClass="btn float-right btnaction m80" Style="background-color:#0AD6B8; color: white;" runat="server" Text="أذن صرف جديد" OnClick="btnAddNewOrder_Click" />
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnCloseOrder" ToolTip="غلق أمر تشغيل" Width="100%" CssClass="btn float-right btnaction m80" Style="background-color: red; color: white;" runat="server" Text="غلق أذن الصرف" OnClick="btnCloseOrder_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label runat="server" ID="lblOrderErr" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <!-- timeline item -->
                                <div id="dvDetails" runat="server">
                                    <i class="fa fa-tools" style="background-color: #08AD96; color: white;"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-tools" style="color: white;"></i></span>
                                        <h3 class="timeline-header" style="background-color: #08AD96; color: white;">أضافة صنف جديد</h3>
                                        <div class="timeline-body">

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="Store">أختار المخزن </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن"
                                                        CssClass="form-control" ID="Store" DataSourceID="STORES" DataTextField="STORENAME"
                                                        DataValueField="STORENUMBER" runat="server" AutoPostBack="true">
                                                        <%--<asp:ListItem Value="0" Selected="True" Text="Select Store"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group col-md-5">
                                                    <label for="selectitem">أختار الصنف</label>
                                                    <asp:DropDownList ToolTip="أختار الصنف" ID="selectitem"
                                                        DataSourceID="ldsitems" DataTextField="MaterialName" DataValueField="ID" CssClass="form-control" runat="server">
                                                        <%--<asp:ListItem Value="0" Selected="true" Text="Select Material"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Label ID="LblErrCheckItem" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>

                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnCheckItemStock" ToolTip="بيانات البضاعة فى المخزن" 
                                                        Width="100%" CssClass="btn btnaction float-right m80" 
                                                        Style="background-color: #08AD96; color: white;" runat="server" Text="مراجعة بيانات المخزون المتاح" OnClick="btnCheckItemStock_Click" />
                                                </div>
                                                <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT DISTINCT M.ID, M.MaterialName FROM Materials AS M INNER JOIN MaterialInStock AS MS ON M.ID = MS.MaterialID WHERE (M.IsActive = 1) AND (MS.StoreID = @StoreID) Order by M.MaterialName ASC">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="Store" Name="StoreID" PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                                <%-- <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT Distinct [ID], [MaterialName] FROM [Materials] Order By MaterialName Asc">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>--%>

                                                <asp:SqlDataSource ID="STORES" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT * FROM [STORES] Order By StoreName Asc "></asp:SqlDataSource>

                                                <asp:SqlDataSource ID="Customers" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT * FROM [Customers] Order By CustomerName Asc "></asp:SqlDataSource>
                                            </div>


                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridData" runat="server" AllowPaging="True" PageSize="5"
                                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridData_SelectedIndexChanged">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ImageUrl="~/Images/icons8-add-shopping-cart-96.png" Width="40px" Height="40px" CommandName="Select"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="MaterialID" HeaderText="Material" SortExpression="MaterialID" />
                                                            <asp:BoundField DataField="StoreID" HeaderText="Store" SortExpression="StoreID" />
                                                            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
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
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT * FROM MaterialsForOrder Where StoreID = @StoreID and MaterialID = @MaterialID and IsActive = 1 and Stock > 0">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="Store" DefaultValue="" Name="StoreID" PropertyName="SelectedValue" />
                                                            <asp:ControlParameter ControlID="selectitem" DefaultValue="" Name="MaterialID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="Itemdetails" runat="server">
                                    <i class="fa fa-cog bg-danger"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-cog" style="color: white;"></i></span>

                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-2">
                                                    <label for="txtStore">Store</label>
                                                    <input type="text" title="المخزن" disabled class="form-control" id="txtStore"
                                                        name="txtStore" runat="server">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="txtCurrentStock">المخزون المتاح</label>
                                                    <input type="text" title="الرصيد المتاح" disabled class="form-control" id="txtCurrentStock"
                                                        name="txtCurrentStock" runat="server">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="txtRequestedStock">الكمية المطلوبة</label>
                                                    <input type="text" title="الكمية المطلوبة" class="form-control" id="txtRequestedStock" name="txtRequestedStock" runat="server" placeholder="أدخل الكمية المطلوبة" />
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtNote">ملاحظات أضافية</label>
                                                    <input type="text" title=" أدخل ملاحظات" class="form-control" id="txtNote" name="txtNote" runat="server" placeholder="أدخل ملاحظات" />
                                                </div>

                                                <div class="form-group col-md-1" style="visibility: hidden">
                                                    <label for="txtItemType">Item Type</label>
                                                    <input type="text" title="نوعية الصنف" class="form-control" id="txtItemType" disabled name="txtItemType" runat="server" />
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnAddNewItem" ToolTip="أضافة صنف لأمر الشغل" Width="100%" CssClass="btn btn-danger float-right m80 btnaction" runat="server" Text="أضافة الصنف" OnClick="btnAddNewItem_Click" />
                                                </div>
                                            </div>

                                            <div class="row" style="visibility: hidden">
                                                <div class="form-group col-md-2">
                                                    <label for="txtMaterialID">Material ID</label>
                                                    <input type="text" disabled class="form-control" id="txtMaterialID"
                                                        name="txtMaterialID" runat="server">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="txtitemHieght">Item Height</label>
                                                    <input type="text" disabled class="form-control" id="txtitemHieght"
                                                        name="txtitemHieght" runat="server">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="txtItemWidth">Item Width</label>
                                                    <input type="text" class="form-control" id="txtItemWidth" name="txtItemWidth" runat="server" />
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtItemNotes">Item Notes</label>
                                                    <input type="text" class="form-control" id="txtItemNotes" name="txtItemNotes" runat="server" />
                                                </div>

                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label ID="LblAddNewItem" runat="server" Text="" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div id="dvOrderDetails" runat="server">
                                    <i class="fa fa-list bg-info"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-list" style="color: white"></i></span>
                                        <h3 class="timeline-header bg-info">تفاصيل أذن الصرف</h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridOrderDetails" runat="server" AllowPaging="True" PageSize="5"
                                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2"
                                                        ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridOrderDetails_SelectedIndexChanged" DataKeyNames="ID">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/icons8-delete-bin-64.png" Width="40px" Height="40px" CommandName="Select"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="OrderID" HeaderText="Order" SortExpression="OrderID" />
                                                            <asp:BoundField DataField="ID" HeaderText="Material" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                                            <asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo"></asp:BoundField>
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Name" SortExpression="MaterialName"></asp:BoundField>
                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="MaterialType" HeaderText="MaterialType" SortExpression="MaterialType" />
                                                            <asp:BoundField DataField="CustomerID" HeaderText="Customer" SortExpression="CustomerID" />
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
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT Materials.MaterialNo, Materials.MaterialName, OrderDetails.OrderID, OrderDetails.Quantity, OrderDetails.Height, OrderDetails.Width, OrderDetails.MaterialType, Orders.CustomerID, Stores.StoreName, Materials.ID
                                                         FROM Materials INNER JOIN OrderDetails ON Materials.ID = OrderDetails.MaterialID 
                                                        INNER JOIN Orders ON OrderDetails.OrderID = Orders.ID 
                                                        INNER JOIN Stores ON OrderDetails.StoreID = Stores.ID
                                                         WHERE (Orders.ID = @OrderID) and OrderDetails.IsActive = 1">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="LblOrderID" Name="OrderID" PropertyName="Text" />
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
                </div>
            </section>


        </div>
        <!-- /.timeline -->

    </form>

</asp:Content>
