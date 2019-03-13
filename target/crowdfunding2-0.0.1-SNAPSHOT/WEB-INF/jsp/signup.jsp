<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Comanage Sign Up</title>
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
        $("#email").blur(function(){
            $("#emails").empty();
             var mail = $(this).val();
             if(mail==""|| mail==null){
                 $("#email").after("<span id='emails' style='color: red'>邮箱不能为空</span>");
             }
         });
       $("#password").blur(function(){
           $("#pwds").empty();
            var pwd = $(this).val();
            if(pwd==""|| pwd==null){
                $("#password").after("<span id='pwds' style='color: red'>密码不能为空</span>");
            }
        });
       $("#re-password").blur(function(){
           $("#repwds").empty();
            var repwd = $(this).val();
            var pwd=$("#password").val();
            if(repwd==""|| repwd==null){
                $("#re-password").after("<span id='repwds' style='color: red'>请确认密码</span>");
            }
            if(repwd!=pwd){
            	$("#re-password").after("<span id='repwds' style='color: red'>两次密码不匹配,请重新输入!</span>");
            }
        });
    });
       </script>
	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form id="signup_form"  class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>Comanage Sign Up</h2>
						<div class="form-group">
							<div class="alert alert-success" role="alert">Your info has been saved.</div>
						</div>
						<div class="form-group">
							<label for="name" class="sr-only">Name</label>
							<input type="text" name="username" class="form-control" id="username" placeholder="Name" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">Email</label>
							<input type="email" name="email" class="form-control" id="email" placeholder="Email" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" name="password" class="form-control" id="password" placeholder="Password" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="re-password" class="sr-only">Re-type Password</label>
							<input type="password" name="repassword" class="form-control" id="re-password" placeholder="Re-type Password" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember"> Remember Me</label>
						</div>
						<div class="form-group">
							<p>Already registered? <a href="${pageContext.request.contextPath }/user/index.action">Sign In</a></p>
						</div>
						<div class="form-group">
							<a href="#" input  value="Sign Up" class="btn btn-primary" onclick="signup()">Sign Up</a>
							<!--<a href="index.html" type="submit" class="btn btn-primary">Sign Up</a>-->
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
    
    <script type="text/javascript">
       function signup(){
    	   $.post("<%=basePath%>user/sign.action",$("#signup_form").serialize(),function(data){
				
				if(data=="0"){
					alert("用户注册成功！");
				}else{
					alert("用户注册失败！");
				}
				window.location.reload();
			});   
       }
    </script>
	</body>
</html>