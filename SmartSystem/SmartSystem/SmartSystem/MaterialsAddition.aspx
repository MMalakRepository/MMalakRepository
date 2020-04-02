<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="MaterialsAddition.aspx.cs" Inherits="SmartSystem.MaterialsAddition" %>

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
                            <h1>New Material Addition</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Material Addition</li>
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
                                    <span style="font-size: 25px; padding: 10px; width: 100%; text-align: center; background-color: #F7AD39; color: white;">Material Addition</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <div>
                                    <i class="fa fa-store-alt" style="background-color: #1DDCC2; color: white;"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt" style="background-color: #1DDCC2; color: white;"></i></span>
                                        <h3 class="timeline-header" style="background-color: #1DDCC2; color: white;">Add New Container</h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-2">
                                                    <label for="txtContainerNumber">Container Number </label>
                                                    <input type="text" title=" رقم الحاوية" class="form-control" id="txtContainerNumber"
                                                        name="txtContainerNumber" runat="server" placeholder=" رقم الحاوية">
                                                </div>
                                                <div class="form-group col-md-8">
                                                    <label for="txtContainerDesc">Description  </label>
                                                    <input type="text" title=" وصف الحاوية" class="form-control" id="txtContainerDesc"
                                                        name="txtContainerDesc" runat="server" placeholder=" وصف الحاوية">
                                                </div>
                                                <div class="form-group col-md-1">
                                                    <asp:Label ID="LblContainerID" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-8">
                                                    <label for="txtContainerNote">Notes  </label>
                                                    <input type="text" title=" وصف الحاوية" class="form-control" id="txtContainerNote"
                                                        name="txtContainerNote" runat="server" placeholder=" ملاحظات على الحاوية">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnAddNewContainer" ToolTip="أضافة حاوية جديدة " Width="100%" CssClass="btn float-right btnaction m80" Style="background-color: #1DDCC2; color: white;" runat="server" Text="Add New Container" OnClick="btnAddNewContainer_Click" />
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnCloseAddition" ToolTip="غلق أمر تشغيل" Width="100%" CssClass="btn float-right btnaction m80" Style="background-color: red; color: white;" runat="server" Text="Finish Addition " OnClick="btnCloseAddition_Click" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="timeline-footer">
                                        <asp:Label runat="server" ID="lblContainerErr" Text=""></asp:Label>
                                    </div>
                                </div>
                                <%--</div>--%>

                                <div id="dvDetails" runat="server">
                                    <i class="fa fa-tools" style="background-color: #18B9A3; color: white;"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-tools" style="color: white;"></i></span>
                                        <h3 class="timeline-header" style="background-color: #18B9A3; color: white;">Add New Item</h3>
                                        <div class="timeline-body">

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="Store">Select Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" AppendDataBoundItems="true"
                                                        CssClass="form-control" ID="Store" DataSourceID="STORES" DataTextField="STORENAME"
                                                        DataValueField="ID" runat="server">
                                                        <asp:ListItem Value="0" Selected="True" Text="Select Store"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="selectitem">Select Material</label>
                                                    <asp:DropDownList ToolTip="أختار الصنف" AppendDataBoundItems="true" ID="selectitem" DataSourceID="ldsitems" DataTextField="MaterialName" DataValueField="ID" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="0" Selected="true" Text="Select Material"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtQuantity">Quantity  </label>
                                                    <input type="text" title=" الكمية " class="form-control" id="txtQuantity"
                                                        name="txtQuantity" runat="server" placeholder=" الكمية ">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <asp:Label ID="lblAddItemErr" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-10">
                                                    <label for="txtItemNotes">Notes  </label>
                                                    <input type="text" title=" الكمية " class="form-control" id="txtItemNotes"
                                                        name="txtItemNotes" runat="server" placeholder=" ملاحظات على الصنف ">
                                                </div>

                                                <div class="form-group col-md-2">
                                                    <asp:Button ID="btnAddNewItem" ToolTip="أضافة صنف" Width="100%" CssClass="btn float-right btnaction m80" Style="background-color: #18B9A3; color: white;" runat="server" Text="Add New Item " OnClick="btnAddNewItem_Click" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridData" runat="server" AllowPaging="True" PageSize="5"
                                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsContainerData" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridData_SelectedIndexChanged">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ImageUrl="~/Images/icons8-delete-bin-64.png" Width="40px" Height="40px" CommandName="Select"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="CNumber" />
                                                            <asp:BoundField DataField="CNumber" HeaderText="Container" SortExpression="CNumber" />
                                                            <asp:BoundField DataField="StoreName" HeaderText="Store" SortExpression="StoreName" />
                                                            <asp:BoundField DataField="MaterialName" HeaderText="Material" SortExpression="MaterialName" />
                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />

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
                                                    <asp:SqlDataSource ID="dsContainerData" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT ContainerData.ID, Container.CNumber,
                                                        Materials.MaterialName, ContainerData.Quantity,
                                                        ContainerData.Notes, Stores.StoreName
                                                        FROM Container INNER JOIN ContainerData ON Container.ID = ContainerData.ContainerID
                                                        INNER JOIN Materials ON ContainerData.MaterialID = Materials.ID 
                                                        INNER JOIN Stores ON ContainerData.StoreID = Stores.ID Where ContainerData.IsActive = 1 and Container.ID = @ContainerID">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="LblContainerID" Name="ContainerID" PropertyName="Text" />
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
            <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                SelectCommand="SELECT Distinct [ID], [MaterialName] FROM [Materials] Order By MaterialName Asc">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="STORES" runat="server"
                ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                SelectCommand="SELECT * FROM [STORES] Order By StoreName Asc "></asp:SqlDataSource>

        </div>
    </form>
</asp:Content>
