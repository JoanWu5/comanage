<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>Comanage Home</title>
		<meta http-equiv="X-UA-COMPATIBLE" content="IE-edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link href="<%=basePath%>css/css.css" rel="stylesheet" />
        <link rel="icon" href="<%=basePath%>images/logo.ico" type="image/x-icon"/>
	</head>

	<body>
		<div class="container">
			<div class="nav">
				<img src="<%=basePath%>/images/logo.png" width="188px" height="45px" class="navList" id="logo">
				<input type="radio" name="radio-set" checked id="nav1" class="navList">
				<a href="#panel1">Home</a>
				<input type="radio" name="radio-set" id="nav2" class="navList">
				<a href="#panel2">Do now</a>
				<input type="radio" name="radio-set" id="nav3" class="navList">
				<a href="#panel3">Have done</a>
				<input type="radio" name="radio-set" id="nav4" class="navList">
				<a href="#panel4">Contact</a>
				<div class="signUpBtn" href="#" onclick="window.open('<%=basePath%>user/index.action','_self')">Sign in</div>
				<div class="scroll">
					<section class="panel" id="panel1">
						<div class="homeManage">Manage</div>
						<div class="homeFunds">Collective Funds</div>
						<div class="homeSlogan">This platform is develped to help the community economy to manage the collective funds and reveal the flows of money to associate groups.
						</div>
					</section>
					<section class="panel panelColor" id="panel2">
						<div class="doTitle" align="center">What We Do?</div>
						<div class="item1">
							<img src="<%=basePath%>/images/Do/1.png" />
							<div class="projectTitle">Creating Projects</div>
							<div class="projectDesc">Projects can be applied to clubs,charities,fundations and so on.If you group has shared current assets,you are suggested to have a professional organization to take care of.
							</div>
						</div>
						<div class="item2">
							<img src="<%=basePath%>/images/Do/2.png" />
							<div class="projectTitle">Creating Projects</div>
							<div class="projectDesc">Projects can be applied to clubs,charities,fundations and so on.If you group has shared current assets,you are suggested to have a professional organization to take care of.
							</div>
						</div>
						<div class="item3">
							<img src="<%=basePath%>/images/Do/3.png" />
							<div class="projectTitle">Creating Projects</div>
							<div class="projectDesc">Projects can be applied to clubs,charities,fundations and so on.If you group has shared current assets,you are suggested to have a professional organization to take care of.
							</div>
						</div>
						<div class="item4">
							<img src="<%=basePath%>/images/Do/4.png" />
							<div class="projectTitle">Creating Projects</div>
							<div class="projectDesc">Projects can be applied to clubs,charities,fundations and so on.If you group has shared current assets,you are suggested to have a professional organization to take care of.
							</div>
						</div>
					</section>
					<section class="panel" id="panel3">
						<div class="doneTitle" align="center">What We Have Done?</div>
						<div class="doneItem">
							<div id="showitem1">
								<img src="<%=basePath%>/images/Done/done1.png">
								<div class="doneProjectTitle">网易三云音箱</div>
								<div class="doneProjectDesc">
									Category:Intelligent Furniture
									<br> Limits of funds:more than ￥500000
									<br> Date of Establishment:2018.7.23
								</div>
							</div>
							<div id="showitem2">
								<img src="<%=basePath%>/images/Done/done2.png">
								<div class="doneProjectTitle">网易三云音箱</div>
								<div class="doneProjectDesc">
									Category:Intelligent Furniture
									<br> Limits of funds:more than ￥500000
									<br> Date of Establishment:2018.7.23
								</div>
							</div>
							<div id="showitem3">
								<img src="<%=basePath%>/images/Done/done3.png">
								<div class="doneProjectTitle">网易三云音箱</div>
								<div class="doneProjectDesc">
									Category:Intelligent Furniture
									<br> Limits of funds:more than ￥500000
									<br> Date of Establishment:2018.7.23
								</div>
							</div>
						</div>
					</section>
					<section class="panel panelColor" id="panel4">
						<div class="contactTitle">Contact Us</div>
						<div class="contactPane">
							<div class="Contactemail">
								<img src="<%=basePath%>/images/Contact/email.png">
							</div>
							<div class="emailInfo">
								Cweichudao@whu.edu.cn
							</div>
							<div class="ContactLocate">
								<img src="<%=basePath%>/images/Contact/didian.png">
							</div>
							<div class="locateInfo">
								Whuhan University,Whuhan,Hubei,China
							</div>
							<div class="survey">
								<form id="sendmail_form" action="<%=basePath%>user/sendmail.action" method="post" >
									<input type="text" name="name" id="name" placeholder="Your name">
									<br>
									<input type="text" name="email" id="email" placeholder="Email">
									<br>
									<textarea id="message" name="message" placeholder="Message"></textarea>
									<input type="submit" value="Send" id="send"  placeholder="Message">
								</form>
								<c:if test="${not empty msg }">
								<c:if test="${msg =='0' }">
								   <script type="text/javascript">
								      alert("发送邮件成功!!!");
								   </script>
								</c:if>
								<c:if test="${msg =='1' }">
								   <script type="text/javascript">
								      alert("发送邮件失败!!!");
								   </script>
								</c:if>
								</c:if>
							</div>
							<div class="WHUlogo">
								<img src="<%=basePath%>images/Contact/logo.png">
								<br>
								<br> We are waiting for your message.
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<script>
			window.onload = function() {
				var scroll = document.getElementsByClassName("scroll")[0]; //ie不兼容，换成id会成功
				var panel = document.getElementsByClassName("panel"); //ie不兼容，换成id会成功
				console.log(scroll);
				var clientH = window.innerHeight;
				scroll.style.height = clientH + "px";
				for(var i = 0; i < panel.length; i++) {
					panel[i].style.height = clientH + "px";
				}
				/*下面是关于鼠标滚动*/
				var inputC = document.getElementsByTagName("input");
				var wheel = function(event) {
					var delta = 0;
					if(!event) //for ie
						event = window.event;
					if(event.wheelDelta) { //ie,opera
						delta = event.wheelDelta / 120;
					} else if(event.detail) {
						delta = -event.detail / 3;
					}
					if(delta) {
						handle(delta, inputC);
					}
					if(event.preventDefault)
						event.preventDefault();
					event.returnValue = false;
				};
				if(window.addEventListener) {
					window.addEventListener('DOMMouseScroll', wheel, false);
				}
				window.onmousewheel = wheel;
			};

			function handle(delta, arr) {
				var num;
				for(var i = 0; i < arr.length; i++) { //得到当前checked元素的下标
					if(arr[i].checked) {
						num = i;
					}
				}
				if(delta > 0 && num > 0) { //向上滚动
					num--;
					arr[num].checked = true;
				} else if(delta < 0 && num < 3) { //向下滚动
					num++;
					arr[num].checked = true;
				}
			}
			function sendmail(){
				$.post("<%=basePath%>user/sendmail.action",$("#sendmail_form").serialize(),function(data){
					
					if(data=="0"){
						alert("发送邮件成功！");
					}else{
						alert("发送邮件失败！");
					}
					<!--window.location.reload();-->
				});   
						
			}
			
		</script>
	</body>

</html>