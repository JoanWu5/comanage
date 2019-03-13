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
    <title>Manage</title>
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
            <input type="hidden" id="userName" name="userName" value=${username }>
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
                    <a href="#"><i class="fa fa-circle"></i> Projects|Manage<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=basePath%>user/manage.action"><img src="<%=basePath%>assets/img/101logo.png" class="icon">Produce 101</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-circle"></i> Projects|Participate in<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<%=basePath%>user/participate.action"><img src="<%=basePath%>assets/img/retreat.png" class="icon">Retreat</a>
                        </li>
                        <li>
                            <a href="#"><img src="<%=basePath%>assets/img/global.png" class="icon">Get More</a>
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
                        <h2 class="page-header"> Basic info
                          	<i class="section_panel_more">
                                    <i>
                                        <img src="<%=basePath%>assets/img/write.png" alt=""/>
                                        <span class="span1">
                                        	<label style="position: absolute;left:5%;top:5%;font-size: 18px;color:#0099ff; font-family:'Lucida Grande';">Settings</label>
                                        	<label style="position: absolute;left:5%;top:30%;font-size: 15px">Review Scale</label>
                                        	<input type="text" placeholder="%" id="review" style="position: absolute;left:27%;top:30%;width:20%;height: 15%;font-size: 15px;background-color: #93d3ff;border: none;">
                                        	<label style="position: absolute;left:50%;top:30%;font-size: 15px">Report Scale</label>
                                        	<input type="text" placeholder="%" id="report" style="position: absolute;left:73%;top:30%;width:20%;height: 15%;font-size: 15px;background-color: #93d3ff;border: none;">
                                        	<label style="position: absolute;left:5%;top:60%;font-size: 15px">Upper Limit</label>
                                        	<input type="text" placeholder="%" style="position: absolute;left:27%;top:60%;width:20%;height: 15%;font-size: 15px;background-color: #93d3ff;border: none;">
                                        	<input type="submit" id="submit_review" value="Submit for reviewing" style="position: absolute;left:55%;
                                        	top:60%;width:auto;height:15%;font-size:15px;background-color:#0099ff;border-radius:5px;border:none;color:#ffffff;">
                                        </span>
                                    </i>
                                </i>
                           <div class="button_1" id="but1">Upload Process</div>
                           		<div id="buzzWindow2" class="row">
            						<label id="x2" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
            						<form action="" method="post">
             							<div class="file">
											<input id="img_input1" type="file" accept="image/*" onchange="showPreview(this.id,'portrait1')"/>
											<label for="img_input1" id="img_label1">Upload Pics
                							<i class="fa fa-plus fa-lg"></i></label>
                							<img src="<%=basePath%>assets/img/image.png" id="portrait1"  style="width:45%; height: 80%; display: block;background-color:#93d3ff; overflow:hidden;">                			
										</div>
       									<label style="font-size: 15px;position: absolute; left:54%;top:10%">July 7 ,2018</label>
                						<textarea placeholder="Type what you want to show here...(no more than 200 words)" style="position: absolute; width: 43%;height: 60%;left:54%;top:20%;font-size: 10px;"></textarea>
                						<input type="submit" value="RELEASING" id="but2">
                					</form>
        						</div>
                            <div class="prop" id="propo"> Proportion for Reviewing: <i id="propo_review" style="color: rgb(0, 142, 255)">10%</i></div>
                            <div class="prop" id="propo2"> Proportion for Reporting: <i id="propo_report" style="color: rgb(0, 142, 255)">5%</i></div>
                        </h2>
                    </div>
                </div>

                <div class="col-md-8 container_1">
                    <div class="col-md-8  pic">
                        <a href=""><img src="<%=basePath%>assets/img/101.png" alt=""/></a>
                        <h3>Brief Introduction: </h3>
                        
                        <h4>We have the same goal to support our favourite idols -- pretty girls from Produce 101. Our aim is to raise money for buying goods like  albums, posters and so on....
						Those are used to send our love to idols and  help them canvass....<br><br><br><br><br></h4>
                    </div>

                    <div class="col-md-4  right-column">
                        <h3>Project Name: </h3>
                        <h4>Produce 101</h4>
                        <hr/>
                        <h3>Category: </h3>
                        <h4>Community</h4>
                        <h5>Fan Clubs</h5>
                        <hr/>
                        <h3>Monetary Cap: </h3>
                        <h4> ¥50,000</h4>
                        <hr/>
                        <h3>Created Date: </h3>
                        <h4>31 March 2018</h4>
                        <hr/>
                        <h3>Creator: </h3>
                        <h4>Tom </h4>
                        <hr/>
                        <h3>Group: </h3>
                        <h4>Class 101 <a href="#"><img src="<%=basePath%>assets/img/101logo.png" class="icon"></a></h4>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="container_2">
                        <h3>Total Funds(RMB)</h3>
                        <div class="col-md-8 container_3">
                            <h2>¥24,500</h2>
                        </div>
                        <div class="col-md-4 container_4">
                            <img src="<%=basePath %>assets/img/arrow.png" alt=""/>
                        </div>

                    </div>

                    <div class="container_2">
                        <h3>Accumulated Inflows / Outflows of Funds </h3>
                        <div class="col-md-8 container_3">
                            <h2 style="font-size:27px;">¥ 30,000/¥5,500</h2>
                        </div>
                        <div class="col-md-4 container_4">
                            <img src="<%=basePath %>assets/img/arrow.png" alt=""/>
                        </div>

                    </div>

                    <div class="container_2">
                        <h3> Number of Participants </h3>
                        <div class="col-md-8 container_3">
                            <h2>25</h2>
                            <h3 style="font-size: 12.5px;text-align: left;">Number of Persons required:<i style="color: rgb(0, 142, 255)"> 3/1 </i></h3>
                        </div>
                        <div class="col-md-4 container_4">
                            <img src="<%=basePath%>assets/img/people.png" alt=""/>
                        </div>
                    </div>

                </div>
            </section>


            <section>
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header"> Inflows of Funds
                           	<label id="click1">Click here to transfer</label>
                           	<button id="money"></button>
                           	<div id="choiceWindow" class="row">
            					<label id="x" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
              					<img class="transfer" src="<%=basePath%>assets/img/transfer.png">
              					<label class="trans">TRANSFER</label>
                				<label class="amount" >Amount</label>
               					<form action="" method="post">
               					<input type="text" id="account" name="account" class="yuan" placeholder="￥">
                				<!--  <label id="addre">Add remark...</label>-->
								<button type="button" value="Confirm" id="ok">confirm</button>
								</form>
        					</div>
        					<div id="choiceWindow1" class="row">
            					<label id="x1" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
              					<img class="transfer" src="<%=basePath%>assets/img/transfer.png">
              					<label class="trans">TRANSFER</label>
                				<label class="amount" >Password</label>
               					<form action="" method="post">
               					<input type="password" class="yuan">
                				<!--  <label id="addre1">Add remark...</label>-->
								<button type="button" value="Confirm" id="ok1">confirm</button>
								</form>
        					</div>
                           
                            <button class="button" data-toggle="collapse" data-target=".navbar-collapse">View ALL
                            </button>
                        </h2>
                    </div>
                </div>
                <div class="container">
                    <table class="table" id="inflow">
                        <tr>
                            <th>User ID</th>
                            <th>Date</th>
                            <th>Account</th>
                            <th> Remark
                                <i class="section_panel_more">
                                    <i>
                                        <img src="<%=basePath%>assets/img/write.png" alt=""/>
                                        <span class ="span">
                                            <textarea> </textarea>
                                            <button type="button" style="border: none;" 
                                                    onclick="alert(document.getElementById('_text').value);">submit</button>
                                        </span>
                                    </i>
                                </i>
                            </th>
                            <th>tag
                                <i class="section_panel_more">
                                    <i>
                                        <img src="<%=basePath%>assets/img/tag.png" alt=""/>
                                        <span class = "span_">
                                            <button onclick="alert(document.getElementById('_text').value);">Pass</button>
                                            <button onclick="alert(document.getElementById('_text').value);" style="background-color:#e60012; ">Error</button>
                                            <textarea style="height: 70%"> </textarea>
                                            <button onclick="alert(document.getElementById('_text').value);">submit</button>
                                        </span>
                                    </i>
                                </i>
                            </th>
                        </tr>
                        <tr>
                            <td><a href=""> Tom Chow</a><h4>Team leader</h4></td>
                            <td>29 June 2018 </td>
                            <td>¥ 1000 </td>
                            <td>No remarks</td>
                            <td><img src="<%=basePath%>assets/img/yes.png"></td>
                        </tr>
                        <tr>
                            <td><a href="#">Gary Li </a><h4>Team Member</h4></td>
                            <td>24 June 2018 </td>
                            <td>$ 500 </td>
                            <td style="color: red">Wrong with type</td>
                            <td><img src="<%=basePath%>assets/img/que.png"></td>
                        </tr>

                    </table>
                </div>


            </section>
            <section>

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header"> Outflows of Funds
                           
                            <button class="button" data-toggle="collapse" data-target=".navbar-collapse">View ALL
                            </button>
                        </h2>
                    </div>
                </div>
                <div class="container">
                    <table class="table">
                        <tr>
                            <th>User ID</th>
                            <th>Date</th>
                            <th>Account</th>
                            <th> Remark
                                <i class="section_panel_more">
                                    <i>
                                        <img src="<%=basePath%>assets/img/write.png" alt=""/>
                                        <span class ="span">
                                            <textarea> </textarea>
                                            <button onclick="alert(document.getElementById('_text').value);">submit</button>
                                        </span>
                                    </i>
                                </i>
                            </th>
                            <th>tag
                                <i class="section_panel_more">
                                    <i>
                                        <img src="<%=basePath%>assets/img/tag.png" alt=""/>
                                        <span class = "span_">
                                            <button onclick="alert(document.getElementById('_text').value);">Pass</button>
                                            <button onclick="alert(document.getElementById('_text').value);" style="background-color:#e60012; ">Error</button>
                                            <textarea style="height: 70%"> </textarea>
                                            <button onclick="alert(document.getElementById('_text').value);">submit</button>
                                        </span>
                                    </i>
                                </i>
                            </th>
                        </tr>
                        </hr>
                        <tr>
                            <td><a href=""> Tom Chow</a><h4>Team leader</h4></td>
                            <td>29 June 2018 </td>
                            <td>¥ 1000 </td>
                            <td>No remarks</td>
                            <td><img src="<%=basePath%>assets/img/yes.png"></td>
                        </tr>
                        <tr>
                            <td><a href="#">Gary Li </a><h4>Team Member</h4></td>
                            <td>24 June 2018 </td>
                            <td>$ 500 </td>
                            <td style="color: red">Wrong with type</td>
                            <td><img src="<%=basePath%>assets/img/que.png"></td>
                        </tr>

                    </table>
                </div>
            </section>
            <section>
                <div class="row" >
                    <div class="col-md-6">
                        <h2 class="page-header"> My remaining funds
                        </h2>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <h2 class="page-header"> Accumulation inflows/outflows
                        </h2>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div id="morris-line-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="row" style=" visibility: hidden; opacity: 0; ">
                <div class="col-md-6" style="height: 0px">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
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
			$(document).ready(function(){
                $("#money").click(function(){
                    $("#choiceWindow").slideDown(300);

            });

            $("#x").click(function(){
                $("#choiceWindow").slideUp(300);
            })
			
			$("#ok").click(function(){
                $("#choiceWindow").slideUp(300);
				$("#choiceWindow1").slideDown(300);
            })

    });
		
		$(document).ready(function(){

            $("#x1").click(function(){
                $("#choiceWindow1").slideUp(300);
            })
			
            $("#ok1").click(function(){
				var username=document.getElementById("userName").value;
				var account=document.getElementById("account").value;
				var url="<%=basePath%>assets/img/yes.png";
				$("#inflow").append('<tr><td><a href="#">'+username+'</a><h4>Team Member</h4></td><td>12 Sept 2018 </td><td>￥'+ account+'</td><td>No remarks</td><td><img src="'+url+'"></td></tr>');
				$("#choiceWindow1").slideUp(300);
			});

    });
		
		$(document).ready(function(){
                $("#but1").click(function(){
                    $("#buzzWindow2").slideDown(300);

            });

            $("#x2").click(function(){
                $("#buzzWindow2").slideUp(300);
            })
			$("#submit_review").click(function(){
				var review=document.getElementById("review").value;
				var report=document.getElementById("report").value;
				$("#propo_review").html(review);
				$("#propo_report").html(report);
			});

    });
		
function showPreview(fileId, imgId) {
	this.value = null;
    var file = document.getElementById(fileId);
    var ua = navigator.userAgent.toLowerCase();
    var url = '';
    if(/msie/.test(ua)) {
      url = file.value;
    } else {
      url = window.URL.createObjectURL(file.files[0]);
    }
    document.getElementById(imgId).src = url;
  }
		
		function openform(){
			window.open("<%=basePath%>api/form.action");
		}
	</script>
</div>
</body>

</html>