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
	<title>account sign in</title>
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

    <script type="text/javascript" src="<%=basePath%>js/CitiE2E.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" href="<%=basePath%>font-awesome-4.7.0/css/font-awesome.min.css">
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>css/animate.css">
	<link rel="stylesheet" href="<%=basePath%>css/style.css">


	<!-- Modernizr JS -->
	<script src="<%=basePath%>js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

		<div class="container">
            <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">Comanage</a></div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					
					<!-- Start Sign In Form -->
					<div class="fh5co-form animate-box" data-animate-effect="fadeIn">
					<form id="loginform" action="<%=basePath%>api/login.action" method="post">
						<h2>Account Sign In</h2>
						
						<div class="form-group">
							<label for="username" class="sr-only">Username</label>
							<input type="text" class="form-control" name="username" id="username" placeholder="Username" autocomplete="off">
							<input type="hidden" name="static_username" id="static_username" value="SandboxUser1"/>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" class="form-control" name="password" id="password" placeholder="Password" autocomplete="off">
							<input type="hidden" name="static_password" id="static_password" value="P@ssUser1$"/>
						</div>
						</form>
						<div class="mask" style="display:none">
					        <span class="fa fa-cog fa-spin spinner"></span>
					    </div>
						<button id="btn1" class="btn btn-primary" onclick="javascript:login()">Sign in</button>
							<div id="choiceWindow">
            					<label id="x" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
               					<form>
                				<label>Please choose your participants:</label>&nbsp &nbsp  &nbsp 
                				<ul class="dowebok">
									<li><input type="radio" name="radio" value="ID1">ID1</li>
									<li><input type="radio" name="radio" value="ID2">ID2</li>
									<li><input type="radio" name="radio" value="ID3">ID3</li>
									<li><input type="radio" name="radio" value="ID4">ID4</li>
									<li><input type="radio" name="radio" value="ID5">ID5</li>
									<li><input type="radio" name="radio" value="ID6">ID6</li>
									<li><input type="radio" name="radio" value="ID7">ID7</li>
								</ul>
								<button type="button" value="OK" id="ok">OK</button>
								</form>
        					</div>
        					<div id="backGround"></div>
						
					</div>
					<!-- END Sign In Form -->

				</div>
			</div>
		</div>
		</body>
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
	    
		$(document).ready(function(){
                $("#btn1").click(function(){
                    $("#choiceWindow").slideDown(300);
                    $("#backGround").show();

            });

            $("#x").click(function(){
                $("#choiceWindow").slideUp(300);
                $("#backGround").hide();
            })
			
			$("#ok").click(function(){
                $("#choiceWindow").slideUp(300);
                $("#backGround").hide();
            })

    });
	</script>
	 <script LANGUAGE=JavaScript>
			var modulus = '${modulus}';
			var exponent = '${exponent}';
			var eventId = '${eventId}';
    		$(".mask").css("display","none");
        </script>
        <script type="text/javascript">
        	$("#password").bind('keydown',function(event){
        		if(event.keyCode == "13"){
        			login();
        		}
        	});
        
            function login(){
            	var username = document.getElementById("username").value;
            	var password = document.getElementById("password").value;
            	//static_password
            	var static_password = document.getElementById("static_password").value;
            	//static_username
            	var static_username = document.getElementById("static_username").value;
            	//alert(exponent);
            	if(username == null || username == ""){
            		alert("Please enter your username");
            	}else if(password == null || password == ""){
            		alert("Please enter your passowrd");
            	}else{
            		$(".mask").css("display","block");
					var pub = new RSAKey();
					pub.setPublic(modulus,exponent);
					var unencrypted_data = eventId +",b"+static_password;
					//alert(unencrypted_data);
					var encrypted_password = pub.encryptB(getByteArray(unencrypted_data)).toString(16);
					//alert(encrypted_password);
            		document.getElementById("static_password").value = encrypted_password;
            		document.getElementById("loginform").submit();
            	}
            }
        </script>

</html>
