<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="MaterialsData.aspx.cs" Inherits="SmartSystem.MaterialsData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnaction {
            margin-top: 30px;
        }

        .containData {
            display: flex;

        }


        @media screen and (max-width: 768px) {

            .demobile {
                display: none;
            }
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
                            <h1>Main Materials Master Data</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Material Master File</li>
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
                                    <span title="تعديل بيانات الصنف" class="bg-primary" style="font-size: 20px; padding: 10px; width: 100%; text-align: center">Update Material Stock</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <div>
                                    <i class="fas fa-tools bg-blue"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-tools"></i></span>
                                        <h2 class="timeline-header"><a style="color: dodgerblue">Materials Master Data </a></h2>

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
                                                    <asp:Button ID="btnGetMaterialData" Width="100%" ToolTip="أظهار بيانات الصنف" CssClass="btn btn-primary float-right m80 btnaction" runat="server" Text="Get Material Data" OnClick="btnGetMaterialData_Click" />
                                                </div>
                                            </div>
                                            <asp:Panel ID="pnlMaterialData" runat="server">
                                                <div class="containData col-md-12">
                                                    <div class="d-sm-none d-md-block d-lg-block d-xl-block col-lg-4 col-md-12 demobile">
                                                        <img id="materialimg" name="materialimg" src="./Images/Delete.png" alt="Item doesn't have Image" style="max-height: 100%; max-width: 100%;height:250px;width:400px;" runat="server" />
                                                    </div>
                                                <%--    <div class="col-md-2"></div>--%>
                                                    <div class="col-md-6">
                                                        <div class="row">
                                                            <div class="form-group col-md-6 ">
                                                                <label for="itemdesc">Name</label>
                                                                <input type="text" disabled title="أسم الصنف" class="form-control" id="itemname" name="itemdesc" runat="server" placeholder="Enter Material Name">
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="form-group col-md-3">
                                                                <label for="txtstock">Stock</label>
                                                                <input type="text" title="الكمية داخل المخزن" class="form-control" id="txtstock" name="Stock" runat="server">
                                                            </div>

                                                            <div class="form-group col-md-3">
                                                                <label for="SafetyStock">Safety Stock</label>
                                                                <input type="text" title=" مخزون الأمان" class="form-control" id="SafetyStock" name="SafetyStock" runat="server">
                                                            </div>
                                                            <div class="form-group col-md-3" style="visibility: hidden">
                                                                <label for="txtReservedStock">Reserved Stock</label>
                                                                <input type="text" title="الكمية المحجوزة داخل المخزن" class="form-control" id="txtReservedStock" name="ReservedStock" runat="server">
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <%--<div class="form-group col-md-3"></div>--%>

                                                            <div class="form-group col-md-3">
                                                                <asp:Button ID="btnCancel" Width="100%" ToolTip="ألغاء تعديل البيانات" CssClass="btn btn-danger float-right m80" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                            </div>

                                                            <div class="form-group col-md-3">
                                                                <asp:Button ID="btnUpdateMaterial" Width="100%" ToolTip="تعديل مخزون الصنف" CssClass="btn btn-success float-right m80" runat="server" Text="Update Stock" OnClick="btnUpdateMaterial_Click" />
                                                            </div>
                                                            <div class="form-group col-md-3"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </asp:Panel>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label ID="lblError" runat="server" Text="" Visible="false"></asp:Label>
                                        </div>

                                        <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT DISTINCT M.ID, M.MaterialName FROM Materials AS M INNER JOIN MaterialInStock AS MS ON M.ID = MS.MaterialID WHERE (M.IsActive = 1) AND (MS.StoreID = @StoreID)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="dsStores" Name="StoreID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:SqlDataSource ID="STORES" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT * FROM [STORES] "></asp:SqlDataSource>
                                    </div>
                                </div>
                                <!-- END timeline item -->

                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
            </section>
        </div>
        <!-- /.timeline -->

    </form>
</asp:Content>
