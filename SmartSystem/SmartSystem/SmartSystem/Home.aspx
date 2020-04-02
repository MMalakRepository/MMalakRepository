
<%@ Page Title="" Language="C#" MasterPageFile="~/SmartShutter.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SmartSystem.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="http://fonts.googleapis.com/css?family=Raleway:400,700,600,500,300,100,200,800" rel="stylesheet" />--%>
    <%--<link href="Home/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="Home/fonts/awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Home/css/owl.carousel.css" rel="stylesheet" />
    <link href="Home/css/owl.theme.css" rel="stylesheet" />
    <link rel='stylesheet' href='Home/rs-plugin/css/settings.css' />
    <link rel="stylesheet" href="Home/style.css" />
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            /*width: 100%;
            height: 70%;*/
            width: 100%;
            height: 600px;
            padding: 20px;

            /*margin :20px;*/
        }

        .carousel-inner div {
            border-radius: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-header">
            <div id="content2" style="display: flex; flex-direction: column;">
                <section style="max-height: 530px;">
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner">

                            <div class="carousel-item">
                                <img src="./Images/product_head_woden_blinds_basswood03.jpg">
                            </div>
                            <div class="carousel-item">
                                <img src="./Images/7442632d289ecc840dae6b1e6901628d.jpg">
                            </div>
                            <div class="carousel-item active ">
                                <img src="./Images/wood-blind-4.jpg">
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>

                </section>

           
            </div>

            <!--end class tz-about-->
        </div>
    </div>
    <!--end class tz-why-choose-->
    <%--<script src="Home/js/jquery.min.js"></script>--%>
    <script src="Home/js/jquery.min.js"></script>
    <script>
        jQuery.noConflict();
    </script>
    <script src="./Home/js/bootstrap.min.js"></script>
    <script src="./Home/js/jquery.parallax-1.1.3.js"></script>
    <script src="./Home/js/owl.carousel.js"></script>
    <script src="./Home/js/resize.js"></script>
    <script src="./Home/js/off-canvas.js"></script>
    <script src="./Home/js/jquery.isotope.min.js"></script>
    <script src="./Home/js/custom-portfolio.js"></script>
    <script src="./Home/js/custom.js"></script>
    <script type='text/javascript' src='./Home/rs-plugin/js/jquery.themepunch.tools.min.js'></script>
    <script type='text/javascript' src='./Home/rs-plugin/js/jquery.themepunch.revolution.min.js'></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#rev_slider_2_1').show().revolution(
                {
                    dottedOverlay: "none",
                    delay: 6000,
                    startwidth: 960,
                    startheight: 350,
                    hideThumbs: 200,

                    thumbWidth: 100,
                    thumbHeight: 50,
                    thumbAmount: 4,

                    navigationType: "none",
                    navigationArrows: "solo",
                    navigationStyle: "round",

                    touchenabled: "on",
                    onHoverStop: "on",

                    swipe_velocity: 0.7,
                    swipe_min_touches: 1,
                    swipe_max_touches: 1,
                    drag_block_vertical: false,


                    keyboardNavigation: "off",

                    navigationHAlign: "center",
                    navigationVAlign: "bottom",
                    navigationHOffset: 0,
                    navigationVOffset: 20,

                    soloArrowLeftHalign: "left",
                    soloArrowLeftValign: "center",
                    soloArrowLeftHOffset: 20,
                    soloArrowLeftVOffset: 0,

                    soloArrowRightHalign: "right",
                    soloArrowRightValign: "center",
                    soloArrowRightHOffset: 20,
                    soloArrowRightVOffset: 0,

                    shadow: 0,
                    fullWidth: "off",
                    fullScreen: "on",

                    spinner: "spinner0",

                    stopLoop: "off",
                    stopAfterLoops: -1,
                    stopAtSlide: -1,

                    shuffle: "off",


                    forceFullWidth: "off",
                    fullScreenAlignForce: "off",
                    minFullScreenHeight: "",
                    hideTimerBar: "on",
                    hideThumbsOnMobile: "off",
                    hideNavDelayOnMobile: 1500,
                    hideBulletsOnMobile: "off",
                    hideArrowsOnMobile: "off",
                    hideThumbsUnderResolution: 0,

                    fullScreenOffsetContainer: "",
                    fullScreenOffset: "",
                    hideSliderAtLimit: 0,
                    hideCaptionAtLimit: 0,
                    hideAllCaptionAtLilmit: 0,
                    startWithSlide: 0
                });
        });	/*ready*/


        var Desktop = 4,
            tabletportrait = 2,
            mobilelandscape = 2,
            mobileportrait = 1,
            resizeTimer = null;

        jQuery(window).load(function () {
            jQuery('div.slotholder').prepend('<div class="bk-responsive-slide"></div>');
        })
    </script>
</asp:Content>
