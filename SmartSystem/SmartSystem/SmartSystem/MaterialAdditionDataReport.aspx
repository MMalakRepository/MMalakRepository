<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="MaterialAdditionDataReport.aspx.cs" Inherits="SmartSystem.MaterialAdditionDataReport" %>

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
                            <h1>Materials Addition Report</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Materials Addition Report</li>
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
                                        <h3 class="timeline-header bg-info">Get Container Data</h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="Customer">Select Container </label>
                                                    <asp:DropDownList ToolTip="أختار الحاوية" AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="dsContainers" DataSourceID="Containers" DataTextField="CNumber"
                                                        DataValueField="ID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0" Text="أختار الحاوية"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <asp:Button ID="btnGetContainerData" Width="100%" 
                                                        CssClass="btn btn-info float-right btnaction m80" runat="server" 
                                                        Text="Get Container Data" OnClick="btnGetContainerData_Click"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label runat="server" ID="lblOrderErr" Text=""></asp:Label>
                                        </div>
                                        <asp:SqlDataSource ID="Containers" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                            SelectCommand="SELECT * FROM [Container] Order By ID desc "></asp:SqlDataSource>
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
