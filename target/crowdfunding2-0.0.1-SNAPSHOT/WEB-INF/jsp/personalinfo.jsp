<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Personal Information</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<!--     Fonts and icons     -->
	<link rel="shortcut icon" href="<%=basePath%>favicon.ico">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
	<!-- CSS Files -->
    <link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=basePath%>assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="<%=basePath%>assets/css/demo.css" rel="stylesheet" />
	<link rel="icon" href="<%=basePath%>assets/img/favicon.ico" type="image/x-icon"/>
</head>

<body>
<div class="image-container set-full-height" style="background-image: url('<%=basePath%>assets/img/wi.jpg')">


	<!--  Made With Get Shit Done Kit  -->
		<a href="#/get-shit-done/index.html?ref=get-shit-done-bootstrap-wizard" class="made-with-mk">
			<div class="brand">Whu</div>
			<div class="made-with">Made with <strong>Comanage</strong></div>
		</a>

    <!--   Big container   -->
    <div class="container">
        <div class="row">
        <div class="col-sm-8 col-sm-offset-2">

            <!--      Wizard container        -->
            <div class="wizard-container">

                <div class="card wizard-card" data-color="orange" id="wizardProfile">
                    <form id="personal_info_form" action="<%=basePath%>user/buildinfo.action" method="post" enctype="multipart/form-data">
                <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->
                    <!-- 做一个userPath的隐藏域，方便后边jq判断 -->
                    <input type="hidden" id="userpath" <c:if test="${not empty userPath }">value="${userPath }"</c:if> <c:if test="${empty userPath }">value="123"</c:if>/>
                    <input type="hidden" id="firstNametest" <c:if test="${not empty firstName }">value="${firstName }"</c:if> <c:if test="${empty firstName }">value="123"</c:if>/>
                    <!-- 做一个action判断发送到后台判断要跳转到哪个界面 -->
                    <input type="hidden" id="action" name="action" value=""/>
                    <input type="hidden" id="judge" name="judge" value=""/>
                    	<div class="wizard-header">
                        	<h3>
                        	   <b>BUILD</b> YOUR PROFILE <br>
                        	   <small>This information will let us know more about you.</small>
                        	</h3>
                    	</div>

						<div class="wizard-navigation">
							<ul>
	                            <li><a href="#about" data-toggle="tab">About</a></li>
	                            <li><a href="#account" data-toggle="tab">Project</a></li>
	                        </ul>

						</div>

                        <div class="tab-content">
                            <div class="tab-pane" id="about">
                              <div class="row">
                                  <h4 class="info-text"> Let's start with the basic information</h4>
                                  <div class="col-sm-4 col-sm-offset-1">
                                     <div class="picture-container">
                                          <div class="picture">
                                              <img <c:if test="${not empty userPath }">src="${userPath }"</c:if> <c:if test="${empty userPath }">src="<%=basePath%>assets/img/default-avatar.png"</c:if> class="picture-src" id="wizardPicturePreview" title=""/>
                                              <input type="file" name="userImage" id="wizard-picture">
                                          </div>
                                          <h6>Choose Picture</h6>
                                      </div>
                                  </div>
                                  <div class="col-sm-6">
                                      <div class="form-group">
                                        <label>First Name <small>(required)</small></label>
                                        <input name="firstName" type="text" class="form-control" placeholder="Taylor..">
                                      </div>
                                      <div class="form-group">
                                        <label>Last Name <small>(required)</small></label>
                                        <input name="lastName" type="text" class="form-control" placeholder="Swift...">
                                      </div>
                                  </div>
                                  <div class="col-sm-10 col-sm-offset-1">
                                      <div class="form-group">
                                          <label>Email <small>(required)</small></label>
                                          <input name="email" type="email" class="form-control" placeholder="Comanage@whu.edu.cn">
                                      </div>
                                  </div>
                              </div>
                            </div>
                            <div class="tab-pane" id="account">
                                <h4 class="info-text"> Get Started Right Now!</h4>
                                <div class="row">

                                    <div class="col-sm-10 col-sm-offset-1">
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="jobb" value="Design">
                                                <div class="icon">
                                                    <a href="#" id="create" ><i class="fa fa-hourglass-start"></i></a>
                                                </div>
                                                <h6>Create</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="jobb" value="Code">
                                                <div class="icon">
                                                    <a href="#" id="manage"><i class="fa fa-hand-peace-o"></i></a>
                                                </div>
                                                <h6>Manage</h6>
                                            </div>

                                        </div>
                                        <div class="col-sm-4">
                                            <div class="choice" data-toggle="wizard-checkbox">
                                                <input type="checkbox" name="jobb" value="Develop">
                                                <div class="icon">
                                                    <a href="#" id="participate"><i class="fa fa-laptop"></i></a>
                                                </div>
                                                <h6>Participate</h6>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="wizard-footer height-wizard">
                            <div class="pull-right">
                                <input type='button' id="next" class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Next' />
                                <input type='button' id="finish" class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Finish' />

                            </div>

                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div><!-- end row -->
    </div> <!--  big container -->


</div>

</body>

	<!--   Core JS Files   -->
	<script src="<%=basePath%>assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%=basePath%>assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="<%=basePath%>assets/js/gsdk-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="<%=basePath%>assets/js/jquery.validate.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
		    $("#create").click(function(){
		    	//将action发送到后台，判断要跳转到哪个页面
		    	document.getElementById("action").value="create";
		    	var userPath = document.getElementById("userpath").value;
		    	var firstName=document.getElementById("firstNametest").value;
		        if(userPath=="123"){
		        	$("#personal_info_form").submit();
		        }else{
		        	window.location.href ="<%=basePath%>api/form.action";
		        }
		});
		
		    $("#manage").click(function(){
		    	document.getElementById("action").value="manage";
		    	var userPath = document.getElementById("userpath").value;
		        if(userPath=="123"){
		        	$("#personal_info_form").submit();
		        }else{
		        	window.location.href ="<%=basePath%>user/manage.action";   
		        }
		});
		    $("#participate").click(function(){
		    	document.getElementById("action").value="participate";
		    	var userPath = document.getElementById("userpath").value;
		        if(userPath=="123"){
		        	$("#personal_info_form").submit();
		        }else{
		        	window.location.href ="<%=basePath%>user/participate.action";   
		        }
		});
		   $("#finish").click(function(){
			   var userPath = document.getElementById("userpath").value;
			   if(userPath=="123"){
				   //防止用户没有创建项目等操作，也没有保存到session中，此时要是提交则保存到数据库中的值是空值
				   document.getElementById("judge").value="1";
				  $("#personal_info_form").submit();
				   //先保存到session中，然后保存到数据库中，两个一起操作
		        }else{
		        	window.location.href ="<%=basePath%>user/submitinfo.action";   
		        }  
		   }); 
		});
</script>

</html>
