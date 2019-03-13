<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Comanage Sign In</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	

  

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>css/animate.css">
	<link rel="stylesheet" href="<%=basePath%>css/style.css">


	<!-- Modernizr JS -->
	<script src="<%=basePath%>js/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
    
    <script type="text/javascript">
    $(function () {
        $("#username").blur(function(){
            $("#names").empty();
           var name = $(this).val();
            if(name=="" || name==null){
               $("#username").after("<span id='names' style='color: red'>用户名不能为空</span>");
            }
        });
       $("#password").blur(function(){
           $("#pwds").empty();
            var pwd = $(this).val();
            if(pwd==""|| pwd==null){
                $("#password").after("<span id='pwds' style='color: red'>密码不能为空</span>");
            }
        });
    });
       </script>
	</head>
	<body>

		<div class="container">
            <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">Comanage</a></div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<!-- Start Sign In Form -->
					<form id="signin_form"  class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>Comanage Sign In</h2>
						<div class="form-group">
							<label for="username" class="sr-only">Username</label>
							<input type="text" name="username" value="${user.username }" class="form-control" id="username" placeholder="Username" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" name="password" class="form-control" id="password" placeholder="Password" autocomplete="off">
							
						</div>
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember"> Remember Me</label>
						</div>
						<div class="form-group">
							<p>Not registered? <a href="${pageContext.request.contextPath }/user/signup.action">Sign Up</a> | <a href="<%=basePath %>user/forgot.action">Forgot Password?</a></p>
						</div>
						<div class="form-group">
							<button type="submit" id="sign_in" class="btn btn-primary">Sign In</button>
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
		</div>
	
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="<%=basePath%>js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=basePath%>js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="<%=basePath%>js/main.js"></script>
    
    <script>
		$(function(){
		    $("#sign_in").click(function(){
		        var formObj=document.getElementById("signin_form");
		        formObj.action="<%=basePath%>user/signin.action";
		        formObj.method="post";
		        formObj.submit();
		    });
		});
	</script>
	</body>
</html>
