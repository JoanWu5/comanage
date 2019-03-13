<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="icon" href="<%=basePath%>assets/img/logo.ico" type="image/x-icon"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Home</title>
    <!-- Bootstrap Styles-->
    <link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="<%=basePath%>assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="<%=basePath%>assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="<%=basePath%>assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>

<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>user/personalHome.action"></a>
        </div>

        <ul class="nav navbar-top-links navbar-left">
            <li><a href="<%=basePath%>user/personalHome.action" class="smoothScroll">HOME</a></li>
            <li><a href="<%=basePath%>user/chatroom.action" class="smoothScroll">My Community</a></li>
            <li><a href="<%=basePath%>user/participate.action" class="smoothScroll">My Projects</a></li>
        </ul>
        <ul class="nav navbar-top-links navbar-right">
             <li>
                <button class="button_1" data-toggle="collapse" data-target=".navbar-collapse" onClick="openform();">+ Create Project</button>
            </li>
            <li class="h4">Hi,${username }</li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=basePath%>user/personalinfo.action"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>user/home.action"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->

    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="<%=basePath%>user/chatroom.action" ><i class="fa fa-circle"></i> New Messages<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=basePath%>user/chatroom.action"><img src="<%=basePath%>assets/img/Tim.jpg" class="icon">Tim</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-circle"></i> My Communities<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#"><img src="<%=basePath%>assets/img/101logo.png" class="icon">Produce 101<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#"><img src="<%=basePath%>assets/img/lily.jpg" class="icon">Lily</a>
                                </li>
                                <li>
                                    <a href="#"><img src="<%=basePath%>assets/img/sam.jpg" class="icon">Sam</a>
                                </li>
                                <li>
                                    <a href="#"><img src="<%=basePath%>assets/img/Tim.jpg" class="icon">Tim</a>
                                </li>
                            </ul>
                        </li>
					</ul><ul class="nav nav-second-level">
                        <li>                    
                            <a href="#"><img src="<%=basePath%>assets/img/retreat.png" class="icon">Retreat<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#"><img src="<%=basePath%>assets/img/selena.jpeg" class="icon">Selena</a>
                                </li>
                                <li>
                                    <a href="#"><img src="<%=basePath%>assets/img/Joan.jpeg" class="icon">Joan</a>
                                </li>
                                <li>
                                    <a href="#"><img src="<%=basePath%>assets/img/Joy.jpg" class="icon">Joy</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-circle"></i> My Friends<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=basePath%>user/chatroom.action"><img src="<%=basePath%>assets/img/Tim.jpg" class="icon">Tim</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>user/chatroom.action"><img src="<%=basePath%>assets/img/comanage.png" class="icon">Comanage</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->

    <div id="page-wrapper">
        <div id="page-inner">
            <section>

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header"> Recommendations
                            <button class="button" data-toggle="collapse" data-target=".navbar-collapse" style="border:none;">View More
                            </button>
                        </h2>
                    </div>
                </div>

                <div class="container">
                    <div class="grid_1_of_3 images_1_of_3 ">
                        <a href=""><img src="<%=basePath%>assets/img/console.png" alt=""/></a>
                        <h2><a href="">Console - Film & Television Wo.... </a></h2>
                        <h3>Created by Vancouver Film Academy</h3>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <a href=""><img src="<%=basePath%>assets/img/sea.png" alt=""/></a>
                        <h2><a href="">Hai Ming - Film & Television Wo...</a></h2>
                        <h3>Created by Zhejiang Institute of Media</h3>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <a href=""><img src="<%=basePath%>assets/img/tea.png" alt=""/></a>
                        <h2><a href="">Tea - Original Ecological Tea for...</a></h2>
                        <h3>Created by Ze Guo Network</h3>
                    </div>

                </div>
            </section>
            <section>
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header"> Projects|Manage
                            <button class="button" data-toggle="collapse" data-target=".navbar-collapse" style="border:none;">View More
                            </button>
                        </h2>
                    </div>
                </div>
                <div class="container">

                    <div class="grid_1_of_3 images_1_of_3 ">
                        <a href="<%=basePath%>user/manage.action"><img src="<%=basePath%>assets/img/101.png" alt=""/></a>
                        <h4><a href="<%=basePath%>user/manage.action">CLASS 101 - Fans Club </a></h4>
                        <h5>Recently: 3 Inflows 4 Outflows </h5>
                        <h5>JustNow: 2 Inflows 1 Outflows </h5>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <a href="<%=basePath%>api/form.action"><img src="<%=basePath%>assets/img/add.png" alt=""/></a>
                        <h4><a href=""></a></h4>
                        <h5></h5>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <a href=""><img src="" alt=""/></a>
                        <h4><a href=""></a></h4>
                        <h5></h5>
                    </div>

                </div>

            </section>
            <section>

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header"> Projects|Partcipate in
                            <button class="button" data-toggle="collapse" data-target=".navbar-collapse" style="border:none;">View More
                            </button>
                        </h2>
                    </div>
                </div>
                <div class="container">
                    <div class="grid_1_of_3 images_1_of_3 ">
                        <a href="<%=basePath%>user/participate.action"><img src="<%=basePath%>assets/img/juejing.png" alt=""/></a>
                        <h4><a href="<%=basePath%>user/partcipate.action">Retreat - Video Game Investme...</a></h4>
                        <h5>Recently: 3 Inflows 4 Outflows </h5>
                        <h5>JustNow: 2 Inflows 1 Outflows </h5>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <a href="<%=basePath%>api/form.action"><img src="<%=basePath%>assets/img/add.png" alt=""/></a>
                        <h4><a href=""></a></h4>
                        <h5></h5>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <a href=""><img src="" alt=""/></a>
                        <h4><a href=""></a></h4>
                        <h5></h5>
                    </div>
                </div>
            </section>
            <section>
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="page-header"> My Funds
                        </h2>
                        <div class="panel panel-default">
                            <!--<div class="panel-heading">
                                Donut Chart Example
                            </div>-->
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h2 class="page-header"> My Project Remaining Funds
                        </h2>
                        <div class="panel panel-default">
                            <!--<div class="panel-heading">
                                Bar Chart Example
                            </div>-->
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <footer>
                <p align="center"> 
                    <a href="" target="_blank" title="Co-Manage"></a>                </p>
            </footer>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->

    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="<%=basePath%>assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>

    <!-- Metis Menu Js -->
    <script src="<%=basePath%>assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="<%=basePath%>assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="<%=basePath%>assets/js/morris/morris.js"></script>


    <script src="<%=basePath%>assets/js/easypiechart.js"></script>
    <script src="<%=basePath%>assets/js/easypiechart-data.js"></script>

    <script src="<%=basePath%>assets/js/Lightweight-Chart/jquery.chart.js"></script>

    <!-- Custom Js -->
    <script src="<%=basePath%>assets/js/custom-scripts.js"></script>
    <script>
    function openform(){
		window.open("<%=basePath%>api/form.action");
	}</script>

</div>
</body>

</html>