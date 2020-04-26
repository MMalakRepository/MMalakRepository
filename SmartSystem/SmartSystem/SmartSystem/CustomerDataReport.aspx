<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="CustomerDataReport.aspx.cs" Inherits="SmartSystem.CustomerDataReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="plugins/bootstrap-datetimepicker/sample%20in%20bootstrap%20v3/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" />
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
                            <h1>Customer Orders Report</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">Customer Orders Report</li>
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
                                        <h3 class="timeline-header bg-info">Get Customer Orders</h3>
                                        <div class="timeline-body">
                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="Customer">Select Customer </label>
                                                    <asp:DropDownList ToolTip="أختار العميل" AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="Customer" DataSourceID="Customers" DataTextField="CustomerName"
                                                        DataValueField="CustomerID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0" Text="Select Customer"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="dtp_input2">Date</label>
                                                    <div class="input-group date form_date " data-date="" 
                                                        data-date-format="dd MM yyyy" data-link-field="dtp_input2"
                                                        data-link-format="yyyy-mm-dd">
                                                        <input class="form-control" size="16" type="text" id="adate" name="adate" runat="server" value="" readonly>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove text-danger" ></span></span>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar text-primary"></span></span>
                                                    </div>
                                                    <input type="hidden" id="dtp_input2" value="" /><br />
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <asp:Button ID="btnGetCustomerOrders" Width="100%" CssClass="btn btn-info float-right btnaction m80" runat="server" Text="Get Customer Data" OnClick="btnGetCustomerOrders_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <asp:Label runat="server" ID="lblOrderErr" Text=""></asp:Label>
                                        </div>
                                        <asp:SqlDataSource ID="Customers" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                            SelectCommand="SELECT * FROM [Customers] Order By CustomerName Asc "></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
    <script src="plugins/bootstrap-datetimepicker/sample%20in%20bootstrap%20v3/jquery/jquery-1.8.3.min.js"></script>

    <%--<script src="plugins/bootstrap-datetimepicker/sample%20in%20bootstrap%20v3/bootstrap/js/bootstrap.min.js"></script>--%>
    <script src="plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>


 
<script type="text/javascript">
 
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
 
</script>

</asp:Content>
