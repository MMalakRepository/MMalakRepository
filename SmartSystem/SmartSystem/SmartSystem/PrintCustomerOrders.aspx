﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="PrintCustomerOrders.aspx.cs" Inherits="SmartSystem.PrintCustomerOrders" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
            $("a[title='Excel']").parent().hide();  // Remove Excel option from export dropdown.
            $("a[title='Word']").parent().hide();   // Remove PDF option from export dropdown.
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <section class="content-header">
                    <div class="container-fluid">
                        <form runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <rsweb:ReportViewer ShowPrintButton="true" ID="ReportViewer1" runat="server" Width="80%" Height="700px" BorderStyle="Solid" BorderWidth="2px" SizeToReportContent="True">
                                <LocalReport ReportPath="./Reports/Customers.rdlc" EnableExternalImages="true">
                                </LocalReport>
                            </rsweb:ReportViewer>
                            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"  Visible="false" />

                        </form>

                    </div>
                </section>
            </div>
        </div>
    </div>

</asp:Content>
