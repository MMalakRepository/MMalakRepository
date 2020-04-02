<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="Transfers.aspx.cs" Inherits="SmartSystem.Transfers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                            <h1>New Transfer Orders</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Internal Transfers</li>
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
                                    <span class="bg-info" style="font-size: 20px; padding: 10px; width: 100%; text-align: center;">Transfer Materials Between Stores</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <div>
                                    <i class="fa fa-store-alt bg-info"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt"></i></span>
                                        <%--<h3 class="timeline-header"><a href="#"></a></h3>--%>
                                        <div class="timeline-body">

                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="FromStore">From Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" AppendDataBoundItems="true"
                                                        CssClass="form-control" ID="FromStore" DataSourceID="STORES" DataTextField="STORENAME"
                                                        DataValueField="ID" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Value="0" Selected="True" Text="Select Store"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="ToStore">To Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" AppendDataBoundItems="true"
                                                        CssClass="form-control" ID="ToStore" DataSourceID="STORES" DataTextField="STORENAME"
                                                        DataValueField="ID" runat="server">
                                                        <asp:ListItem Value="0" Selected="True" Text="Select Store"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Label ID="LblTransferID" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                             
                                            </div>
                                            <div class="row">
                                                   <div class="form-group col-md-8">
                                                    <label for="txtOrderNotes">Notes</label>
                                                    <input type="text" title="ملاحظات أضافية" class="form-control" id="txtOrderNotes"
                                                        name="txtOrderNotes" runat="server" placeholder="ملاحظات أضافية">
                                                </div>

                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnAddNewTransfer" ToolTip="أضافة أمر تحويل" Width="100%" CssClass="btn btn-info float-right btnaction m80" runat="server" Text="Add New Transfer" OnClick="btnAddNewTransfer_Click" />
                                                </div>
                                                
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnFinishTransfer" ToolTip="أنهاء أمر تحويل" Width="100%" CssClass="btn btn-danger float-right btnaction m80" runat="server" Text="Finish" OnClick="btnFinishTransfer_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label runat="server" ID="lblTransferErr" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <!-- timeline item -->
                                <div id="dvDetails" runat="server">
                                    <i class="fa fa-tools bg-warning"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-tools"></i></span>
                                        <%--<h3 class="timeline-header"><a href="#"></a></h3>--%>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="selectitem">Select Material</label>
                                                    <asp:DropDownList ToolTip="أختار الصنف" AppendDataBoundItems="true" ID="selectitem" DataSourceID="ldsitems" DataTextField="MaterialName" DataValueField="ID" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="0" Selected="true" Text="Select Material"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-3">
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <asp:Button ID="btnCheckItemStock" ToolTip="بيانات البضاعة فى المخزن" Width="100%" CssClass="btn btn-warning btnaction float-right m80" runat="server" Text="Get Available Material" OnClick="btnCheckItemStock_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <asp:Label ID="LblErrCheckItem" runat="server" Text="" Visible="false" CssClass="btnaction"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridData" runat="server" AllowPaging="True" PageSize="5"
                                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridData_SelectedIndexChanged">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <%--<asp:BoundField DataField="MaterialNo" HeaderText="Code" SortExpression="MaterialNo" />--%>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>--%>
                                                                    <asp:ImageButton runat="server" ImageUrl="~/Images/icons8-low-priority-64.png" Width="40px" Height="40px" CommandName="Select"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="MaterialID" HeaderText="Material" SortExpression="MaterialID" />
                                                            <asp:BoundField DataField="StoreID" HeaderText="Store" SortExpression="StoreID" />
                                                            <%--<asp:BoundField DataField="Description" HeaderText="Desc" SortExpression="Description" />--%>
                                                            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                                                            <%-- <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />--%>
                                                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                                                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
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
                                                            <%--       <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />--%>
                                                            <asp:ControlParameter ControlID="FromStore" DefaultValue="" Name="StoreID" PropertyName="SelectedValue" />
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
                                        <span class="time"><i class="fa fa-cog"></i></span>

                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-2">
                                                    <label for="txtStore">Store</label>
                                                    <input type="text" title="المخزن" disabled class="form-control" id="txtStore"
                                                        name="txtStore" runat="server">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="txtCurrentStock">Available Stock</label>
                                                    <input type="text" title="الرصيد المتاح" disabled class="form-control" id="txtCurrentStock"
                                                        name="txtCurrentStock" runat="server">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="txtRequestedStock">Transfer stock</label>
                                                    <input type="text" title="الكمية المطلوبة" class="form-control" id="txtRequestedStock" name="txtRequestedStock" runat="server" placeholder="أدخل الكمية المطلوبة" />
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtNote">Notes</label>
                                                    <input type="text" title=" أدخل ملاحظات" class="form-control" id="txtNote" name="txtNote" runat="server" placeholder="أدخل ملاحظات" />
                                                </div>
                                                <div class="form-group col-md-1" style="visibility: hidden">
                                                    <label for="txtItemType">Item Type</label>
                                                    <input type="text" title="نوعية الصنف" class="form-control" id="txtItemType" disabled name="txtItemType" runat="server" />
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnAddNewItem" ToolTip="أضافة صنف لأمر التحويل" Width="100%" CssClass="btn btn-danger float-right m80 btnaction" runat="server" Text="Add New Material" OnClick="btnAddNewItem_Click" />
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
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                SelectCommand="SELECT DISTINCT Materials.ID, Materials.MaterialName FROM Materials INNER JOIN MaterialInStock ON Materials.ID = MaterialInStock.MaterialID WHERE (MaterialInStock.StoreID = @StoreID) ORDER BY Materials.MaterialName">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                    <asp:ControlParameter ControlID="FromStore" DefaultValue="" Name="StoreID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="STORES" runat="server"
                ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                SelectCommand="SELECT * FROM [STORES] Order By StoreName Asc "></asp:SqlDataSource>


        </div>
        <!-- /.timeline -->

    </form>

</asp:Content>
