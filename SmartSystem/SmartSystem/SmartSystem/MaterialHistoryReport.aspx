<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="MaterialHistoryReport.aspx.cs" Inherits="SmartSystem.MaterialHistoryReport" %>

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
                            <h1>Materials Transactions History Report</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Materials Transactions History Report</li>
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
                                        <span class="time"><i class="fa fa-store-alt" style="color: white"></i></span>
                                        <h4 class="timeline-header bg-info">Get Material Transactions History Data</h4>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="dsStore">Select Store </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن"
                                                        AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="dsStore" DataSourceID="ldsStores" DataTextField="StoreName"
                                                        DataValueField="ID" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Text="Select Store"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="dsMaterials">Select Material </label>
                                                    <asp:DropDownList ToolTip="أختار المخزن"
                                                        AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="dsMaterials" DataSourceID="ldsMaterials"
                                                        DataTextField="MaterialName"
                                                        DataValueField="ID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0" Text="Select Material"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <asp:Button ID="btnGetHistoryData" Width="100%" CssClass="btn btn-info float-right btnaction m80" runat="server" Text="Get Material History" OnClick="btnGetHistoryData_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label runat="server" ID="lblOrderErr" Text=""></asp:Label>
                                        </div>
                                        <asp:SqlDataSource ID="ldsStores" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                            SelectCommand="SELECT * FROM [Stores] Order By StoreName Asc "></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="ldsMaterials" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                            SelectCommand="SELECT Materials.ID, Materials.MaterialName, MaterialInStock.StoreID FROM Materials INNER JOIN MaterialInStock ON Materials.ID = MaterialInStock.MaterialID  Where  MaterialInStock.StoreID = @StoreID ORDER BY Materials.MaterialName">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="dsStore" Name="StoreID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
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
