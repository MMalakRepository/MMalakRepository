<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="NewSupplier.aspx.cs" Inherits="SmartSystem.NewSupplier" %>

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
                                <h1>Suppliers Master Data</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Suppliers Master File</li>
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
                                    <div class="card card-info">
                                        <div class="card-header">
                                            <h3 class="card-title">Add New Supplier</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row">

                                                <div class="form-group col-md-6">
                                                    <label for="Suppliername">Name</label>
                                                    <input title="أسم المورد" type="text" class="form-control" id="Suppliername" name="Suppliername" runat="server" placeholder="Enter Supplier Name">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="suppliercountry">Country</label>
                                                    <input title=" الدولة" type="text" class="form-control" id="suppliercountry" name="suppliercountry" runat="server" placeholder="Enter Supplier Country">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="Supplieremail">Email Address</label>
                                                    <input title=" البريد الألكترونى" type="text" class="form-control" name="Supplieremail" runat="server" id="Supplieremail" placeholder="Enter Supplier Email">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="Supplieraddress">Address</label>
                                                    <input title="العنوان" type="text" class="form-control" id="Supplieraddress" name="Supplieraddress" runat="server" placeholder="Enter Supplier Address">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="contactperson">Contact Person</label>
                                                    <input title="أسم الشخص المسئول" type="text" class="form-control" id="contactperson" name="contactperson" runat="server" placeholder="Enter Contact person">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="phonenumber">Phone Number</label>
                                                    <input title="رقم التليفون" type="text" class="form-control" id="phonenumber" name="phonenumber" runat="server" placeholder="Enter Phone Number">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <asp:Button ToolTip="أضافة مورد جديد" ID="btnAddNewSupplier" CssClass="btn btn-info float-right" runat="server" Text="Add New Supplier" OnClick="btnAddNewSupplier_Click" />
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
