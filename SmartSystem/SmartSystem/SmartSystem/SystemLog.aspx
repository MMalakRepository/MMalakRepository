<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true"  EnableEventValidation="false" CodeBehind="SystemLog.aspx.cs" Inherits="SmartSystem.SystemLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .btnaction {
            margin-top: 30px;
            margin-left: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="Form1" runat="server" enctype="multipart/form-data">
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>System Log Reports</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">System Log Reports</li>
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

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-info card-outline">
                                        <div class="card-header">
                                            <h3 class="card-title">System Log Reports</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="Event">Select Event </label>
                                                    <asp:DropDownList AppendDataBoundItems="true" CssClass="form-control"
                                                        ID="Event" DataSourceID="Events" DataTextField="ActionType"
                                                        DataValueField="ActionType" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Value="0" Text="Select Event"></asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:SqlDataSource ID="Events" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                        SelectCommand="SELECT Distinct  ActionType FROM Logger "></asp:SqlDataSource>
                                                </div>


                                                <div class="form-group col-md-3">
                                                    <asp:ImageButton ID="btnExportstorePDF" CssClass="btnaction float-right" Width="50px" Height="50px" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnExportstorePDF_Click" />
                                                    <asp:ImageButton ID="btnExportStoreExce" runat="server" CssClass="btnaction float-right" Width="50px" Height="50px" ImageUrl="~/Images/excel.png"  OnClick="btnExportStoreExce_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <asp:GridView ID="GridData" runat="server" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"></asp:BoundField>
                                                            <asp:BoundField DataField="ActionDate" HeaderText="Action Date" SortExpression="ActionDate"></asp:BoundField>
                                                            <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="Action" />
                                                            <asp:BoundField DataField="ActionType" HeaderText="Type" SortExpression="ActionType"></asp:BoundField>
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
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT UserName, ActionDate, Action, ActionType FROM Logger WHERE (ActionType = @ActionType) ORDER BY ActionDate DESC">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="Event" DefaultValue="" Name="ActionType" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- /.card -->
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>

    </form>
</asp:Content>
