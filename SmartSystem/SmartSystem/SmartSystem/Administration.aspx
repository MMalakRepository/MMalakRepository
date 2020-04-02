<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="SmartSystem.Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .m30 {
            margin-top: 30px;
            width: 200px;
        }

        .m40 {
            margin-top: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
    <form id="Form1" runat="server" enctype="multipart/form-data">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>System Administration Data</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">System Administration File</li>
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

                                <!-- timeline item -->
                                <div>
                                    <i class="fa fa-store-alt bg-warning"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt"></i></span>
                                        <h3 class="timeline-header"><a href="#">Add New Store</a></h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="txtNewStore">Store Name</label>
                                                    <input type="text" title=" أسم المخزن" class="form-control" id="txtNewStore" name="txtNewStore" runat="server" placeholder="أدخل أسم المخزن">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtStoreLocation">Store Location</label>
                                                    <input type="text" title=" عنوان المخزن" class="form-control" id="txtStoreLocation" name="txtStoreLocation" runat="server" placeholder="أدخل عنوان المخزن">
                                                </div>

                                                <div class="form-group col-md-3 m40" style="float: right">
                                                    <asp:Label ID="LbladdNewStore" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <asp:ImageButton ID="btnAddnewStore" ToolTip="أضافة مخزن جديد" runat="server" ImageUrl="~/Images/Add.png" Width="100px" Height="100px" CssClass="btn float-right" OnClick="btnAddnewStore_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END timeline item -->
                                <!-- timeline item -->

                                <div>
                                    <i class="fas fa-tools bg-info"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-tools"></i></span>
                                        <h2 class="timeline-header"><a href="#">Add New Category & SubCategory </a></h2>

                                        <div class="timeline-body">

                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="txtNewCategory">Category Name</label>
                                                    <input type="text" title="نوع الصنف" class="form-control" id="txtNewCategory" name="txtNewCategory" runat="server" placeholder="Enter Category Name">
                                                </div>
                                                <div class="form-group col-md-3 m40">
                                                    <asp:Label ID="LblAddNewCategory" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                                <div class="form-group col-md-3 ">
                                                    <asp:ImageButton ID="btnAddNewCategory" ToolTip="أضافة نوع صنف جديد" runat="server" ImageUrl="~/Images/Add.png" Width="100px" Height="100px" CssClass="btn float-right" OnClick="btnAddNewCategory_Click" />
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="materialcategory">Select Category</label>
                                                    <asp:DropDownList ToolTip="أختار نوع الصنف" AppendDataBoundItems="true" CssClass="form-control" ID="materialcategory" DataSourceID="ldsCategory" runat="server" DataTextField="CategoryName" DataValueField="CategoruID">
                                                        <asp:ListItem Selected="True" Value="0">Select Category</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="ldsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT DISTINCT CategoryName,CategoruID from Category"></asp:SqlDataSource>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtSubCategory">Sub Category Name</label>
                                                    <input type="text" title="التصنيف الجديد" class="form-control" id="txtSubCategory" name="txtSubCategory" runat="server" placeholder="Enter New SubCategory">
                                                </div>

                                                <div class="form-group col-md-3 m40">
                                                    <asp:Label ID="LblAddNewSubCategory" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <asp:ImageButton ID="btnAddNewSubCategory" ToolTip="أضافة تصنيف فرعى" runat="server" ImageUrl="~/Images/Add.png" Width="100px" Height="100px" CssClass="btn float-right" OnClick="btnAddNewSubCategory_Click" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- END timeline item -->


                                <!-- timeline item -->
                                <div>
                                    <i class="fas fa-ruler-combined bg-green"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-ruler-combined"></i></span>
                                        <h2 class="timeline-header"><a href="#">Add New Unit </a></h2>

                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="txtNewUnit">Unit Name</label>
                                                    <input type="text" title=" وحدة القياس" class="form-control" id="txtNewUnit" name="txtNewUnit" runat="server" placeholder="Enter Unit Name">
                                                </div>
                                                <div class="form-group col-md-3"></div>
                                                <div class="form-group col-md-3">
                                                    <asp:ImageButton ID="btnAddNewUnit" ToolTip="أضافة وحدة قياس جديد" runat="server" ImageUrl="~/Images/Add.png" Width="100px" Height="100px" CssClass="btn float-right" OnClick="btnAddNewUnit_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <asp:Label ID="LblAddNewUnit" runat="server" Text="" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END timeline item -->
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
    <!-- Central Modal Medium Danger -->
</asp:Content>
