﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="DeadStock.aspx.cs" Inherits="SmartSystem.DeadStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Dead Materials Master Data</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Dead Materials</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <div class="row mb-2">
                    <div class="container-fluid">
                        <form id="Form1" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-danger">
                                        <div class="card-header">
                                            <h3 class="card-title">Add New Dead Material</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="SelectStores">Select Store Location</label>
                                                    <asp:DropDownList ToolTip="أختار المخزن" CssClass="form-control" DataSourceID="STORES" DataTextField="StoreName" DataValueField="STORENUMBER" ID="SelectStores" runat="server" AutoPostBack="True">
                                                        <%--<asp:ListItem Selected="True" Value="0">Select Store </asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="selectitem">Select Material</label>
                                                    <asp:DropDownList ToolTip="أختار الصنف" ID="selectitem" DataSourceID="ldsitems"
                                                        DataTextField="MaterialName" DataValueField="MaterialID" CssClass="form-control"
                                                        runat="server">
                                                        <%--<asp:ListItem Selected="True" Value="0">Select Material</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </div>
                                                <asp:SqlDataSource ID="ldsitems" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT MaterialInStock.MaterialID, Materials.MaterialName FROM Materials INNER JOIN MaterialInStock ON Materials.ID = MaterialInStock.MaterialID INNER JOIN Stores ON MaterialInStock.StoreID = Stores.ID WHERE (Materials.IsActive = 1) AND (Stores.ID = @StoreID)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="ISActive" Type="Boolean" />
                                                        <asp:ControlParameter ControlID="SelectStores" DefaultValue="" Name="StoreID" PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                                <asp:SqlDataSource ID="STORES" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>"
                                                    SelectCommand="SELECT * FROM [STORES] Where ISActive = 1 ">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="ISActive" Type="Boolean" />
                                                    </SelectParameters>

                                                </asp:SqlDataSource>


                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="DeadNote">Notes</label>
                                                    <input title=" أدحل الملاحظة" type="text" class="form-control" name="DeadNote" runat="server" id="DeadNote" placeholder="أدخل ملاحظات">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Please Enter your note " ControlToValidate="DeadNote"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="SWidth">Material Width</label>
                                                    <input title="العرض" type="text" class="form-control" id="SWidth" name="SWidth" runat="server" placeholder=" أدخل عرض الصنف">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="Sheight">Material Height</label>
                                                    <input title="الطول" type="text" class="form-control" id="Sheight" name="Sheight" runat="server" placeholder="أدخل طول الصنف">
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <label for="Quantity">Quantity</label>
                                                    <input title="الكمية" type="text" class="form-control" id="Quantity" name="Quantity" runat="server" placeholder="أدخل الكمية">
                                                </div>

                                                <div class="form-group col-md-3">
                                                    <label for="unit">Measure Unit</label>
                                                    <asp:DropDownList ToolTip="أختار وحدة قياس الصنف" AppendDataBoundItems="true" CssClass="form-control" ID="itemunit" DataSourceID="unit" DataTextField="UnitName" DataValueField="ID" runat="server">
                                                        <asp:ListItem Selected="True" Value="0">Select Unit</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="unit" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT [ID], [UnitName] FROM [Units]"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                                            </div>

                                            <div class="card-footer">
                                                <asp:Button ToolTip="أضافة صنف " Width="20%" ID="btnAddNewItem" CssClass="btn btn-danger float-right" runat="server" Text="Add New Item" OnClick="btnAddNewItem_Click" />
                                            </div>
                                        </div>
                                        <!-- /.card -->
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
