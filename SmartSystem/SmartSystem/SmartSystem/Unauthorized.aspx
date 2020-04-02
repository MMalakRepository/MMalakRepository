<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="Unauthorized.aspx.cs" Inherits="SmartSystem.Unauthorized" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            font-size: larger;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server" enctype="multipart/form-data">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="form-group col-md-12" style="text-align: center">
                            <h3 class="auto-style1"><strong>UNAUTHORIZED ACCESS</strong></h3>
                        </div>
                    </div>
        <%--            <div class="row">
                        <div class="form-group col-md-12" style="text-align: center">
                            <h5 class="auto-style2"><strong>غير مسموح لك بالدحول ألى هذه الصفحة</strong></h5>
                        </div>
                    </div>--%>
                    <div class="row">
                        <div class="form-group col-md-10">
                            <img src="Images/website-error-403-forbidden-artwork-depicts-a-vector-23988777.jpg" style="margin: 40px 200px; border-radius: 30%; width: 80%" />
                        </div>
                    </div>
                </div>
            </section>

        </div>

    </form>
</asp:Content>
