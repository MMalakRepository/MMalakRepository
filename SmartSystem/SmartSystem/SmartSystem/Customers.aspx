<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="SmartSystem.Customers" %>

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
                                <h1>Customers Master Data</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Customers Master File</li>
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
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Add New Customer</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="customernumber">Customer Number</label>
                                                    <input title=" رقم العميل" type="text" class="form-control" id="customernumber" name="customernumber" runat="server" placeholder="رقم العميل">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="customername">Customer Name</label>
                                                    <input title="أسم العميل" type="text" class="form-control" id="customername" name="customername" runat="server" placeholder="أسم العميل">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="customeremail">Email Address</label>
                                                    <input title=" البريد الألكترونى" type="text" class="form-control" name="customeremail" runat="server" id="customeremail" placeholder="البريد الألكترونى">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="customeraddress">Address</label>
                                                    <input title="العنوان" type="text" class="form-control" id="customeraddress" name="customeraddress" runat="server" placeholder="العنوان">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="contactperson">Contact Person</label>
                                                    <input title="أسم الشخص المسئول" type="text" class="form-control" id="contactperson" name="contactperson" runat="server" placeholder="الشخص المسئول">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="phonenumber">Phone Number</label>
                                                    <input title="رقم التليفون" type="text" class="form-control" id="phonenumber" name="phonenumber" runat="server" placeholder="رقم الهاتف">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <asp:Button ToolTip="أضافة عميل جديد" ID="btnAddNewCustomer" CssClass="btn btn-primary float-right" runat="server" Text="Add New Customer" OnClick="btnAddNewCustomer_Click" />
                                            </div>
                                        </div>
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
