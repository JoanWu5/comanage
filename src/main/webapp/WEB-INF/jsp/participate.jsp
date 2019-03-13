<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%
SimpleDateFormat df=new SimpleDateFormat("yyyyMMdd");
//String s=df.format(new Date());
java.util.Date currentTime = new java.util.Date();  
String time = df.format(currentTime).toString();   //放到页面的head中}  
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="icon" href="<%=basePath%>assets/img/logo.ico" type="image/x-icon"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Participate</title>
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
        <input type="hidden" id="datetime" value="<%=time%>">
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
                           <div class="button_1" id="but1">Check the latest buzz</div>
                           		<div id="buzzWindow" class="row">
            						<label id="x2" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
              						<label id="lbuzz">LATEST BUZZ</label>
              						<hr style="position:relative;top:25px; height: 1px; border:none;border-top:1px  solid #e5e5e5">
              						<img class="block" id="r1" src="<%=basePath%>assets/img/BUZZ3.png">
              						<img class="block" id="r2" src="<%=basePath%>assets/img/invoice.png">
              						<img class="block" id="r3" src="<%=basePath%>assets/img/triangle.png">
              						<label id="vo">No Voucher</label>
              						<label id="date1"><%=time%></label>
              						<label id="tom1">By <c:if test="${not empty username }">${username }</c:if><c:if test="${empty username }">Tom</c:if></label>
              						<img id="pic1"  src="<%=basePath%>assets/img/icon.png">
              						<label id="des1">We've made the cards as gifts for people who’ve been supporting us all the time!</label>
              						<label id="out1">OUTFLOW</label>
              						<label id="date2">July 12,2018</label>
              						<label id="tom2">Raised by Alex</label>
              						<img id="pic2" src="<%=basePath%>assets/img/icon.png">
              						<label id="des2">We've made the cards as gifts and uploaded the invoice </label>
              						<img id="r4" src="<%=basePath%>assets/img/triangle2.png">
              						<label id="re">Require for reviewing:</label>
              						<input type="submit" value="PASS" id="pass">
              						<input type="submit" value="ERROR" id="err">
              						<label id="out2">OUTFLOW</label>
              						<label id="date3">July 30,2018</label>
              						<label id="tom3">Reported by Tom</label>
              						<img id="pic3" src="<%=basePath%>assets/img/icon.png">
              						<lable id="des3">NO EXPLANATION</lable>
              						<lable id="des4">Wrong with the user</lable>
              						<img id="que" src="<%=basePath%>assets/img/que.png">
              						<img id="r5" src="<%=basePath%>assets/img/triangle3.png">
              						<label id="des5"></label>
        						</div>
                            <div class="prop" id="propo"> Proportion for Reviewing: <i style="color: rgb(0, 142, 255)">5%</i></div>
                            <div class="prop" id="propo2"> Proportion for Reporting: <i style="color: rgb(0, 142, 255)">5%</i></div>
                        </h2>
                    </div>
                </div>

                <div class="col-md-8 container_1">
                    <div class="col-md-8  pic">
                        <a href=""><img src="<%=basePath%>assets/img/pic.png" alt=""/></a>
                        <h3>Brief Introduction: </h3>
                        
                        <h4>The end of the old era, the rise of the new era, the turmoil of the world, no one can stay
                            away from it. To bring salvation or destruction to the end? From the table games, set sets,
                            to statues and comics... The black collection box is coming in! <br><br></h4>
                    </div>

                    <div class="col-md-4  right-column">
                        <h3>Project Name: </h3>
                        <h4>Retreat</h4>
                        <hr/>
                        <h3>Category: </h3>
                        <h4>Invesment</h4>
                        <h5>Video Game Creation</h5>
                        <hr/>
                        <h3>Monetary Cap: </h3>
                        <h4>¥200,000</h4>
                        <hr/>
                        <h3>Created Date: </h3>
                        <h4>26 March 2018</h4>
                        <hr/>
                        <h3>Creator: </h3>
                        <h4>Foreshadow </h4>
                        <hr/>
                        <h3>Group: </h3>
                        <h4>Retreat <a href="#"><img src="<%=basePath%>assets/img/retreat.png" class="icon"></a></h4>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="container_2">
                        <h3>Total Funds(RMB)</h3>
                        <div class="col-md-8 container_3">
                            <h2>¥4150</h2>
                        </div>
                        <div class="col-md-4 container_4">
                            <img src="<%=basePath%>assets/img/arrow.png" alt=""/>
                        </div>

                    </div>

                    <div class="container_2">
                        <h3>Accumulated Inflows / Outflows of Funds </h3>
                        <div class="col-md-8 container_3">
                            <h2 style="font-size:17px;">¥ 50,000/¥5,400</h2>
                        </div>
                        <div class="col-md-4 container_4">
                            <img src="<%=basePath%>assets/img/arrow.png" alt=""/>
                        </div>

                    </div>

                    <div class="container_2">
                        <h3> Number of Participants </h3>
                        <div class="col-md-8 container_3">
                            <h2>64</h2>
                            <h3 style="font-size: 12.5px;text-align: left;">Number of Persons required:<i style="color: rgb(0, 142, 255)"> 3/3 </i></h3>
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
               					<input type="text" class="yuan" id="account" name="account" placeholder="￥">
                				<!--  <label id="addre">Add remark...</label>-->
								<button type="button" value="Confirm" id="ok" >confirm</button>
								</form>
        					</div>
        					<div id="choiceWindow1" class="row">
            					<label id="x1" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
              					<img class="transfer" src="<%=basePath%>assets/img/transfer.png">
              					<label class="trans">TRANSFER</label>
                				<label class="amount" >Password</label>
               					<form action="" method="post">
               					<input type="password" class="yuan">
                				<!-- <label id="addre1">Add remark...</label>-->
								<button type="button" value="Confirm" id="ok1" >confirm</button>
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
                            <td id="Li"><a href="#">Gary Li </a><h4>Team Member</h4></td>
                            <td id="date2018" style="">24 June 2018 </td>
                            <td id="dollar">$ 500 </td>
                            <td id="remark1" style="color: red">Wrong with type</td>
                            <td id="tag1"><img id="_img1" src="<%=basePath%>assets/img/que.png"></td>
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
                    <table class="table" >
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
                        <h2 class="page-header"> Accumulated inflows/outflows
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
			
			

    });
		
		$(document).ready(function(){
                $("#but1").click(function(){
                    $("#buzzWindow").slideDown(300);

            });

            $("#x2").click(function(){
                $("#buzzWindow").slideUp(300);
            })
			$("#ok1").click(function(){
				var username=document.getElementById("userName").value;
				var account=document.getElementById("account").value;
				var url="<%=basePath%>assets/img/yes.png";
				$("#inflow").append('<tr><td><a href="#">'+username+'</a><h4>Team Member</h4></td><td>12 Sept 2018 </td><td>￥'+ account+'</td><td>No remarks</td><td><img src="'+url+'"></td></tr>');
				$("#choiceWindow1").slideUp(300);
			});
            $("#pass").click(function(){
            	$("#err").hide();
            	$("#des5").html("The outflow has passed");
            	var remark1 = document.getElementById('remark1');
            	remark1.innerText = "Reviewed";
            	remark1.style.color='black';
            	var Li = document.getElementById('Li');
            	var date2018 = document.getElementById('date2018');
            	var dollar = document.getElementById('dollar');
            	var url="<%=basePath%>assets/img/yes.png";
            	//datetime
            	var date=document.getElementById('datetime').value;
            	var _img1 = document.getElementById('_img1');
            	//tag1.style.color='black';
            	Li.style.color='black';
            	date2018.style.color='black';
            	date2018.innerText=date;
            	dollar.style.color='black';
            	
            	var tag1 = document.getElementById('tag1');
            	remark1.style.textDecoration='none';
            	//tag1.style.textDecoration='none';
            	//Li.style.style.textDecoration='none';
            	date2018.style.textDecoration='none';
            	dollar.style.textDecoration='none';
            	var url="<%=basePath%>assets/img/yes.png";
            	_img1.setAttribute("src", url);
            	document.getElementById('re').style.display = "none";
            });
            $("#err").click(function(){
            	$("#pass").hide();
            	$("#des5").html("The outflow hasn't passed");
            	var remark1 = document.getElementById('remark1');
            	remark1.innerText = "Wrong with type";
            	var tag1 = document.getElementById('tag1');
            	var Li = document.getElementById('Li');
            	var date2018 = document.getElementById('date2018');
            	var dollar = document.getElementById('dollar');
            	var url="<%=basePath%>assets/img/que.png";
            	var _img1 = document.getElementById('_img1');
            	var date=document.getElementById('datetime').value;
            	remark1.style.color='gray';
            	tag1.style.color='gray';
            	Li.style.color='gray';
            	date2018.style.color='gray';
            	dollar.style.color='gray';
            	remark1.style.textDecoration='line-through';
            	//tag1.style.textDecoration='line-through';
            	//Li.style.style.textDecoration='line-through';
            	date2018.style.textDecoration='line-through';
            	dollar.style.textDecoration='line-through';
            	_img1.setAttribute("src", url);
            	document.getElementById('re').style.display = "none";
            });

    });
		
		function openform(){
			window.open("<%=basePath%>api/form.action");
		}
		
	</script>
</div>
</body>

</html>