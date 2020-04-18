<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" EnableEventValidation="false" AutoEventWireup="true"
    CodeBehind="MaterialsReport.aspx.cs" Inherits="SmartSystem.MaterialDataReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
            //$("a[title='Excel']").parent().hide();  // Remove Excel option from export dropdown.
            $("a[title='Word']").parent().hide();   // Remove PDF option from export dropdown.
        });
    </script>
    <style>
        .btnaction {
            margin-top: 30px;
            margin-left: 20px;
        }
    </style>


    <script type="text/javascript">
        function SelectSafety() {
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

        function SelectCategory() {
            var t = document.getElementById('custom-tabs-one-home');
            t.classList.remove("show");
            t.classList.remove("active");

            var elem = document.getElementById('custom-tabs-one-category');
            elem.classList.add("active");
            elem.classList.add("show");


            var r = document.getElementById('custom-tabs-one-home-tab');
            r.classList.remove("active");
            r.setAttribute("aria-selected", "false");

            var r2 = document.getElementById('custom-tabs-one-category-tab');
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
                        <h1>Materials Data Reports</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Materials Data Reports</li>
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
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            <div class="col-12 col-sm-12 col-lg-12">
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
                                                <a class="nav-link" id="custom-tabs-one-category-tab" data-toggle="pill" href="#custom-tabs-one-category" role="tab" aria-controls="custom-tabs-one-category" aria-selected="false">By Category</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="custom-tabs-one-settings-tab" data-toggle="pill" href="#custom-tabs-one-settings" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">Safety Report</a>
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
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المخزن" CssClass="form-control"
                                                                            ID="SelectStores" runat="server" DataSourceID="ldsstores" DataTextField="StoreName"
                                                                            DataValueField="StoreNumber" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0">Select Store ..</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>

                                                                    <asp:SqlDataSource ID="ldsstores" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Stores] ">
                                                                        <SelectParameters>
                                                                            <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetStoreData" CssClass="btn btn-warning btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetStoreData_Click" />
                                                                    </div>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-md-12">
                                                                        <div>
                                                                            <rsweb:ReportViewer ShowPrintButton="true" ID="ReportStore" runat="server" Visible="false"
                                                                                Width="100%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                                                                <LocalReport ReportPath="./Reports/MaterialsData.rdlc" EnableExternalImages="true">
                                                                                </LocalReport>
                                                                            </rsweb:ReportViewer>
                                                                        </div>
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
                                                                        <label for="selectitems">Select Material</label>
                                                                        <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار الصنف"
                                                                            CssClass="form-control" ID="selectitems" runat="server" DataSourceID="ldsMaterials" DataTextField="MaterialName" DataValueField="ID" AutoPostBack="False">
                                                                            <asp:ListItem Selected="True" Value="0" Enabled="true">Select Material .. </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <asp:SqlDataSource ID="ldsMaterials" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Materials]  ">
                                                                        <SelectParameters>
                                                                            <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetMaterialData" CssClass="btn btn-danger btnaction float-right" Width="100%" Visible="true"
                                                                            runat="server" Text="Get Data" OnClick="btnGetMaterialData_Click" />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-md-12">
                                                                        <div>
                                                                            <rsweb:ReportViewer ShowPrintButton="true" ID="ReportMaterial" runat="server" Visible="false"
                                                                                Width="100%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                                                                <LocalReport ReportPath="./Reports/MaterialsData.rdlc" EnableExternalImages="true">
                                                                                </LocalReport>
                                                                            </rsweb:ReportViewer>
                                                                        </div>
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
                                                                            DataSourceID="ldsSuppliers" DataTextField="Name" DataValueField="SupplierID" AutoPostBack="false">
                                                                            <asp:ListItem Selected="True" Value="0" Enabled="true">Select Supplier .. </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <asp:SqlDataSource ID="ldsSuppliers" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT SupplierID,Name  FROM [Supplier]  ">
                                                                        <SelectParameters>
                                                                            <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <div class="form-group col-md-3">
                                                                        <asp:Button ID="btnGetSupplierData" CssClass="btn btn-success btnaction float-right" Width="100%" Visible="true" runat="server" Text="Get Data" OnClick="btnGetSupplierData_Click" />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div>
                                                                        <rsweb:ReportViewer ShowPrintButton="true" ID="ReportSupplier" runat="server" Visible="false"
                                                                            Width="100%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                                                            <LocalReport ReportPath="./Reports/MaterialsData.rdlc" EnableExternalImages="true">
                                                                            </LocalReport>
                                                                        </rsweb:ReportViewer>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <asp:Label ID="LblErrorSupplierData" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="custom-tabs-one-settings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="card card-warning card-outline">

                                                                    <div class="card-body">
                                                                        <div class="row">
                                                                            <div class="form-group col-md-6">
                                                                                <label for="SafetyStores">Select Store Location</label>
                                                                                <asp:DropDownList AppendDataBoundItems="true" ToolTip="أختار المخزن"
                                                                                    CssClass="form-control" ID="SafetyStores"
                                                                                    runat="server" DataSourceID="ldsstores" DataTextField="StoreName"
                                                                                    DataValueField="StoreNumber"
                                                                                    AutoPostBack="False">
                                                                                    <asp:ListItem Selected="True" Value="0">Select Store ..</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </div>

                                                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                                                SelectCommand="SELECT *  FROM [Stores] ">
                                                                                <SelectParameters>
                                                                                    <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                            <div class="form-group col-md-3">
                                                                                <asp:Button ID="btnGetSagetyData" CssClass="btn btn-warning btnaction float-right"
                                                                                    Width="100%" Visible="true" runat="server" Text="Get Data"
                                                                                    OnClick="btnGetSagetyData_Click" />
                                                                            </div>

                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="form-group col-md-12">
                                                                                <div>
                                                                                    <rsweb:ReportViewer ShowPrintButton="true" ID="ReportSafety" runat="server" Visible="false"
                                                                                        Width="100%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                                                                        <LocalReport ReportPath="./Reports/MaterialsData.rdlc" EnableExternalImages="true">
                                                                                        </LocalReport>
                                                                                    </rsweb:ReportViewer>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <!-- /.card -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>


                                                </asp:UpdatePanel>
                                            </div>

                                            <div class="tab-pane fade" id="custom-tabs-one-category" role="tabpanel" aria-labelledby="custom-tabs-one-category-tab">
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
                                                                    <asp:SqlDataSource ID="ldsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT *  FROM [Category]  ">
                                                                        <SelectParameters>
                                                                            <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">
                                                                        <div>
                                                                            <rsweb:ReportViewer ShowPrintButton="true" ID="ReportCategory" runat="server" Visible="false"
                                                                                Width="100%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                                                                <LocalReport ReportPath="./Reports/MaterialsData.rdlc" EnableExternalImages="true">
                                                                                </LocalReport>
                                                                            </rsweb:ReportViewer>
                                                                        </div>
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

                                                                    <asp:SqlDataSource ID="ldsSubCategories" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT ID, SubCategoryName FROM SubCategories Order By SubCategoryName Desc"></asp:SqlDataSource>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">
                                                                        <div>
                                                                            <rsweb:ReportViewer ShowPrintButton="true" ID="ReportSubCategory" runat="server" Visible="false"
                                                                                Width="100%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                                                                <LocalReport ReportPath="./Reports/MaterialsData.rdlc" EnableExternalImages="true">
                                                                                </LocalReport>
                                                                            </rsweb:ReportViewer>
                                                                        </div>


                                                                    </div>
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
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
