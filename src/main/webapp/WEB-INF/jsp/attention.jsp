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
    <title>attention</title>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE-edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="<%=basePath%>css/css1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet"/>
    <link rel="icon" href="<%=basePath%>images/logo.ico" type="image/x-icon"/>
</head>

<body>
<div class="container">
    <div class="nav">
        <img  src="<%=basePath%>/images/logo1.png" width="197px" height="23px" class="logo" id="beginlogo">
        <input type="radio" name="radio-set" id="nav1" class="navList">
        <a href="<%=basePath%>user/personalHome.action">Home</a>
        <input type="radio" name="radio-set" id="nav2" class="navList">
        <a href="<%=basePath%>user/chatroom.action">My Community</a>
        <input type="radio" name="radio-set" id="nav3" class="navList">
        <a href="#panel3">My Project</a>
        <!--<img src="img/start.png" width="132px" height="33px" id="startlogo">-->
        <label id="startlogo">Let's start now</label>
        <a href="<%=basePath%>user/personalHome.action" id="nav4"><c:if test="${not empty username }">Hi,${username }</c:if></a>
        <a href="<%=basePath%>user/personalHome.action"><img <c:if test="${not empty userPath }">src="${userPath }"</c:if> <c:if test="${empty projectPath }">src="<%=basePath%>/images/person.png"</c:if> width="39px" height="39px" id="person"></a>               
    </div>  
    <div class="form">
    	<form id="project_form" action="" method="POST">
    	    <!--<c:if test="${not empty projectName }">value=${projectName }</c:if>-->
    	    <label class="description" id="project1"><c:if test="${not empty msg }">${msg }</c:if></label>
    		
    	</form>		
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
  
	
	
	function close(){		
		if (confirm("您确定要关闭本页吗？")){
			window.opener=null;
			window.open('','_self');
			window.close();
		}
	}
	
</script>  
</body>
</html>