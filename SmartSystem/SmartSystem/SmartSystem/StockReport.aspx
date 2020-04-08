<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="StockReport.aspx.cs" Inherits="SmartSystem.StockReport" %>

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
                            <h1>Materials Stock Report</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Materials Stock Report</li>
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
                                <div>
                                    <i class="fa fa-store-alt bg-info"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-store-alt bg-info"></i></span>
                                        <h3 class="timeline-header bg-info">Get Stock Data</h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="Store">Select Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" CssClass="form-control"
                                                        ID="Store" DataSourceID="ldsStores" DataTextField="StoreName"
                                                        DataValueField="ID" runat="server" AutoPostBack="true">
                                                        <%--<asp:ListItem Selected="True" Value="0" Text="Select Store"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="dsMaterials">Select Material </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن"
                                                        CssClass="form-control"
                                                        ID="dsMaterials" DataSourceID="ldsitems"
                                                        DataTextField="MaterialName"
                                                        DataValueField="ID" runat="server">
                                                        <%--<asp:ListItem Selected="True" Value="0" Text="Select Material"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT DISTINCT M.ID, M.MaterialName FROM Materials AS M INNER JOIN MaterialInStock AS MS ON M.ID = MS.MaterialID WHERE (M.IsActive = 1) AND (MS.StoreID = @StoreID) Order by M.MaterialName ASC">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="Store" Name="StoreID" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <asp:Button ID="btnGetStoreReport" Width="100%" CssClass="btn btn-info float-right btnaction m80" runat="server" Text="Get Stock Data" OnClick="btnGetStoreReport_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label runat="server" ID="lblOrderErr" Text=""></asp:Label>
                                        </div>
                                        <asp:SqlDataSource ID="ldsStores" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                            SelectCommand="SELECT * FROM [Stores] Order By StoreName Asc "></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</asp:Content>
