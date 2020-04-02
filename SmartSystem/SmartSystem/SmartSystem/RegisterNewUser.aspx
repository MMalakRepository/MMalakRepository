<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterNewUser.aspx.cs" Inherits="SmartSystem.Login.RegisterNewUser" %>

<!DOCTYPE html>
<html lang="zxx">


<head>
    <script>(function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    '../../../../www.googletagmanager.com/gtm5445.html?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-TAGCODE');</script>

    <title>Smart Shutter System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="assets/fonts/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="assets/fonts/flaticon/font/flaticon.css">


    <%--<link rel="shortcut icon" href="shop256.png" type="image/x-icon">--%>
      <link rel="shortcut icon" href="./Images/logonew.png" type="image/x-icon" sizes="256x2256">


    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPoppins:400,500,700,800,900%7CRoboto:100,300,400,400i,500,700">

    <link type="text/css" rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" id="style_sheet" href="assets/css/skins/default.css">
</head>
<body id="top">
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TAGCODE"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <div class="page_loader"></div>
    <div class="login-20">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-4 col-lg-5 col-md-12 bg-color-10">
                    <div class="form-section">
                        <div class="">
                            <a href="Login.aspx">
                                <%--<img src="assets/img/logos/logo-2.png" alt="logo">--%>
                                <img src="./Images/logonew.png" alt="logo">
                            </a>
                        </div>
                        <h3>Register New Account</h3>
                        <div class="login-inner-form">
                            <form runat="server">
                                <div class="form-group form-box">
                                    <input type="text" name="username" id="username" class="input-text" runat="server" placeholder="New User Name">
                                    <i class="fa fa-user fa-4x"></i>
                                </div>
                                <div class="form-group form-box">
                                    <input type="password" name="Password" id="password" class="input-text" runat="server" placeholder="Password">
                                    <i class="fa fa-lock fa-4x"></i>
                                </div>
                                <div class="form-group form-box">
                                    <input type="password" name="ConfirmPassword" id="confirmpassword" class="input-text" runat="server" placeholder="Confirm Password">
                                    <i class="fa fa-lock fa-4x"></i>
                                </div>
                                <div class="form-group form-box">
                               
                                    <asp:DropDownList ToolTip="أختار المجموعة" class="input-text" AppendDataBoundItems="true" CssClass="form-control"
                                        ID="UserRoles" DataSourceID="dsRoles" DataTextField="Name"
                                        DataValueField="ID" runat="server">
                                        <asp:ListItem Selected="True" Value="0" Text="Select Role"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <asp:SqlDataSource ID="dsRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SmartShutterConnectionString %>" SelectCommand="SELECT * From ASPNetRoles">
                                </asp:SqlDataSource>
               

                                <div class="form-group">
                                    <asp:Button ID="btnRegister" CssClass="btn-md btn-theme btn-block" runat="server" Text="Create New User" OnClick="btnRegister_Click" />
                                </div>
                                <asp:Label ID="lblError" runat="server" Visible="false" Text=""></asp:Label>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-7 col-md-12 bg-img none-992">
                    <div class="info">
                        <h1>SMART SHUTTER SYSTEM</h1>
                        <p>Designed By Michael Malak</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="assets/js/jquery-2.2.0.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

</body>
</html>
