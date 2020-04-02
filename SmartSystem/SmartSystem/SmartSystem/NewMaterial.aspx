<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="NewMaterial.aspx.cs" Inherits="SmartSystem.NewMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <style>
        .btnaction {
            margin-top: 35px;
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
                                    <span class="bg-info" style="font-size: 20px; padding: 10px; width: 100%; text-align: center;">New Material Creation</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <div>
                                    <i class="fas fa-tools bg-info"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-tools"></i></span>
                                        <h2 class="timeline-header"><a href="#">Add New Material To Master Data </a></h2>

                                        <div class="timeline-body">

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="itemcode">Code</label>
                                                    <input type="text" title="رقم الصنف" class="form-control" name="itemcode" runat="server" id="itemcode" placeholder="أدخل رقم الصنف">
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Code is Required" ControlToValidate="itemcode"></asp:RequiredFieldValidator>--%>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="itemname">Name</label>
                                                    <input type="text" title="أسم الصنف" class="form-control" id="itemname" name="itemname" runat="server" placeholder="أدخل أسم الصنف">
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="itemname" ErrorMessage="Material Name is required"></asp:RequiredFieldValidator>--%>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="itemsupplier">Supplier</label>
                                                    <asp:DropDownList ToolTip="أختر المورد" AppendDataBoundItems="true" CssClass="form-control" ID="itemsupplier" DataSourceID="Supplier" DataTextField="Name" DataValueField="SupplierID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0">أختر المورد</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="Supplier" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT [SupplierID], [Name] FROM [Supplier] WHERE ([IsActive] = @IsActive) Order by Name Asc">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="materialcategory">Category</label>
                                                    <asp:DropDownList ToolTip="أختر نوع الصنف" CssClass="form-control" ID="materialcategory" DataSourceID="ldsCategory" AppendDataBoundItems="true" runat="server"
                                                        DataTextField="SubCategoryName" DataValueField="ID">
                                                        <asp:ListItem Selected="True" Value="0">أختر نوع الصنف</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="ldsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT * from SubCategories order by SubCategoryName ASC"></asp:SqlDataSource>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="Sheight">Standard Height</label>
                                                    <input type="text" title="الطول" class="form-control" id="Sheight" name="Sheight" runat="server" placeholder="طول الصنف">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="SWidth">Standard Width</label>
                                                    <input type="text" title="العرض" class="form-control" id="Swidth" name="SWidth" runat="server" placeholder="عرض الصنف">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="unit">Measure Unit</label>
                                                    <asp:DropDownList ToolTip="أختر وحدة قياس الصنف" CssClass="form-control" AppendDataBoundItems="true" ID="itemunit" DataSourceID="unit" DataTextField="UnitName" DataValueField="ID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0">أختر وحدة قياس الصنف</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="unit" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT [ID], [UnitName] FROM [Units] Order By UnitName ASC"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                      <label for="itemDescription">Description </label>
                                                    <input type="text" title="أسم الصنف" class="form-control" id="itemDescription" name="itemDescription" runat="server" placeholder="أدخل ملاحظات على الصنف">
                                                </div> 
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-8">
                                                    <label for="itemimage">Material Image</label>
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <%--<input type="file" class="custom-file-input" name="FileUpload" id="FileUpload">--%>
                                                                       <asp:FileUpload ID="FileUpload1" runat="server" class="custom-file-input"  />
                                                                     <label class="custom-file-label" for="FileUpload1">أختر ملف</label>
                                                        </div>
                                                        <div class="input-group-append">
                                                        </div>
                                                        <asp:Label ID="LblUploadError" runat="server" style="padding: 15px;" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <asp:Button ID="btnAddNewItem" ToolTip="أضافة صنف جديد" CssClass="btn btn-info float-right btnaction m80" runat="server" Text="Add New Material" OnClick="btnAddNewItem_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <asp:Label ID="LblAddNewItem" runat="server" Text="" style="padding: 15px;" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END timeline item -->

                                <!-- timeline time label -->
                                <div class="time-label">
                                    <span style="font-size: 20px; padding: 10px; width: 100%; text-align: center;color:white;background-color:#F39C12">Assign Material To Store location</span>
                                </div>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <div>
                                    <i class="fa fa-store-alt" style="color:white;background-color:#F39C12"  ></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt"></i></span>
                                        <h3 class="timeline-header"><a href="#">Add Material To Store Location</a></h3>
                                        <div class="timeline-body">

                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="Store">Select Store </label>
                                                    <asp:DropDownList ToolTip="أختر المخزن" AppendDataBoundItems="true" CssClass="form-control" ID="Store" DataSourceID="STORES" DataTextField="STORENAME" DataValueField="STORENUMBER" runat="server">
                                                    <asp:ListItem Selected="True" Value="0"> أختر المخزن</asp:ListItem>
                                                    </asp:DropDownList>

                                                    </div>
                                                <div class="form-group col-md-6">
                                                    <label for="selectitem">Select Material</label>
                                                    <asp:DropDownList ToolTip="أختر الصنف" AppendDataBoundItems="true" ID="selectitem" DataSourceID="ldsitems" DataTextField="MaterialName" DataValueField="ID" CssClass="form-control" runat="server">
                                                    <asp:ListItem Selected="True" Value="0">أختر الصنف</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT Distinct [ID], [MaterialName] FROM [Materials] Order By MaterialName Asc">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                                <asp:SqlDataSource ID="STORES" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT * FROM [STORES] Order By StoreName Asc "></asp:SqlDataSource>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="stockOnHand">Initial Stock</label>
                                                    <input type="text" title="الرصيد" class="form-control" id="stockOnHand" name="stockOnHand" runat="server" placeholder="الرصيد">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="safetystock">Safety Stock</label>
                                                    <input type="text" title="رصيد الأمان" class="form-control" id="safetystock" name="safetystock" runat="server" placeholder="مخزون الأمان">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="location">Location in Store</label>
                                                    <input type="text" title="المكان داخل المخزن" class="form-control" id="location" name="location" runat="server" placeholder="المكان داخل المخزن">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <asp:Button ID="btnAddToStore" ToolTip="أضافة الصنف ألى المخزن" CssClass="btn float-right btnaction m80" style="color:white;background-color:#F39C12"  runat="server" Text="Add Material To Store" OnClick="btnAddToStore_Click" />
                                                </div>
                                                <div class="row">
                                                    <asp:Label ID="LblAddItemToStore" runat="server" style="padding: 15px;" Text="" Visible="false" ></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
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
