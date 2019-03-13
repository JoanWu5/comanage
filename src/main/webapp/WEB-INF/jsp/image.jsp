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
    <!-- 涉及到图片上传需要下边的meta标签 -->
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>form</title>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE-edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="<%=basePath%>css/css1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet"/>
</head>

<body>
<div class="container">
    <div class="nav">
        <img  src="<%=basePath%>/images/logo1.png" width="197px" height="23px" class="logo" id="beginlogo">
        <input type="radio" name="radio-set" id="nav1" class="navList">
        <a href="#panel1">Home</a>
        <input type="radio" name="radio-set" id="nav2" class="navList">
        <a href="#panel2">My Community</a>
        <input type="radio" name="radio-set" id="nav3" class="navList">
        <a href="#panel3">My Project</a>
        <!--<img src="img/start.png" width="132px" height="33px" id="startlogo">-->
        <label id="startlogo">Let's start now</label>
        <a href="#panel4" id="nav4">Hi,Tom</a>
        <img src="<%=basePath%>/images/person.png" width="39px" height="39px" id="person">                
    </div>  
    <div class="form">
    	
    	<!-- 获取后台submit.sction的提交是否成功的消息:msg -->
         <input id="msg" type="hidden" value="${msg }"/>
    		
    	<P>${projectPath }</P>
    	<P>${msg }</P>
    	<p>${processPath },${groupPath }</p>
		<form id="breifintro_from" action="" method="POST" enctype="multipart/form-data">
			<input type="text" id="pro2" placeholder="Add Subcategories" >
			<label class="description" id="intro">Brief Intro:</label>
			<textarea name="breifIntro"  id="pro3" placeholder="No more than 200 words" style="text-align: top;"><c:if test="${not empty breifIntro }">${breifIntro }</c:if></textarea>
		</form>
		<form id="file1_form" action="<%=basePath%>api/uploadfiletest.action" enctype="multipart/form-data" method="post">
			<div class="file">
				<input id="img_input1" name="projectImage" type="file" accept="image/*" onchange="showPreview(this.id,'portrait1')"/>
				<label for="img_input1" id="img_label1">Upload Pics
                <i class="fa fa-plus fa-lg"></i></label>
                <img <c:if test="${not empty projectPath }">src="${projectPath }"</c:if> <c:if test="${empty projectPath }">src="<%=basePath%>/images/Image.png"</c:if> id="portrait1"  style="width: 200px; height: 100px; display: block;background-color:#000; overflow:hidden;">
			</div>			
			<label class="description" id="process">Process Intro:</label>
			<label class="description" id="stage">Stage:</label>
			<button type="submit" id="submit_label1" value="SubmitImage">SubmitImage</button>
		</form>	
		
		<form id="days_setting1_from" action="<%=basePath%>api/uploadfiletest.action" method="post" enctype="multipart/form-data">
			<label class="description" id="day" >Days:</label>
			<input type="text" name="days" id="pro4" placeholder="How many days?" <c:if test="${not empty days }">value=${days }</c:if>>
			<div class="file">
				<input id="img_input2" name="processImage" type="file" accept="image/*" onchange="showPreview(this.id,'portrait2')"/>
				<label for="img_input2" id="img_label2">Upload Pics
                <i class="fa fa-plus fa-lg"></i></label>
                <img src="<%=basePath%>/images/Image1.png" id="portrait2"  style="width: 200px; height: 37px; display: block;background-color:#000; overflow:hidden;">
			    
			</div>
			<p>upperLimitFunds:${upperLimitFunds }</p>
			<label class="description" id="settings">Settings</label>
			<label class="description" id="re">(can be changed when all members agree)</label>
			<label class="description" id="settings2">：</label>
			<label class="description" id="upper">Upper Limit of  Funds :</label>
			<label class="description" id="upper1"> To confirm your scale of amounts</label>
			<input type="text" name="upperLimitFunds" id="pro5" placeholder="￥" <c:if test="${not empty upperLimitFunds }">value=${upperLimitFunds }</c:if>>
			<label class="description" id="lower">Lower Limit of  Funds :</label>
			<label class="description" id="lower1"> To confirm your start-up capital</label>
			<input type="text" name="lowerLimitFunds" id="pro6" placeholder="￥" <c:if test="${not empty lowerLimitFunds }">value=${lowerLimitFunds }</c:if>>
			<label class="description" id="review"> Scale for Reviewing :</label>
			<label class="description" id="review1">To confirm the proportion</label>
			<button type="submit" id="submit_label2" value="SubmitImage">SubmitImage</button>
		</form>
		
		<div id="backGround"></div>
            
			
        	
		<form id="file3_form" action="<%=basePath%>api/uploadfiletest.action" enctype="multipart/form-data" method="post">	
			<div class="file">
				<input id="img_input3" NAME="groupImage" type="file" accept="image/*" onchange="showPreview(this.id,'portrait3')"/>
				<label for="img_input3" id="img_label4">Upload Pics
                <i class="fa fa-plus fa-lg"></i></label>
                <img src="<%=basePath%>/images/person.png" id="portrait3"  style="width: 39px; height: 39px; border-radius:39px;display: block;background-color:#deeefc; overflow:hidden;">
			    <label id="submit_label3" >SubmitImage
			</div>
		</form>
		<form id="group_form" action="" method="post">
			<label class="description" id="group1">Group Name:</label>
			<input type="text" id="pro7" name="groupName"  placeholder="Comanage" <c:if test="${not empty groupName }">value=${groupName }</c:if>>
			<label class="description" id="group2" >Brief Intro:</label>
			<input type="text" id="pro8" name="groupbreifIntro" placeholder="No more than 10 words" <c:if test="${not empty groupbreifIntro }">value=${groupbreifIntro }</c:if>>
			<label class="description" id="group3" >Inviting Participants :</label>
			<input type="text" id="pro9" name="participantId" placeholder="parcipants' ID，spilt by ，" <c:if test="${not empty participantId }">value=${participantId }</c:if>>
		</form>
			
        	<div id="backGround"></div>
			
		
			
        	<div id="backGround1"></div>
        	
		
		
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
  /* 图片预览 */
  function showPreview(fileId, imgId) {
	if(confirm('do you have finished other information?if not,please finish other information first')){	  
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
    //$("#file1_form").submit();
  }
	
	function diag(){
		alert("remember to create one!");
	}	

	function connect(){
		if (confirm('Are you sure to turn to sign in account?'))
			window.open('connect.html');
		return false;
	}
	
	$(document).ready(function(){
		   if($("#msg").value=="0"){
			   alert("提交成功!");
		   }else if($("#msg").value=="1"){
			   alert("提交失败,请检查原因!");
		   }
                $("#add1").click(function(){
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
                window.location.href ="<%=basePath%>api/useexist.action";       			 
       			}); 
            });
    
	
	$(document).ready(function(){
                $("#add2").click(function(){
                    $("#choiceWindow1").slideDown(300);
                    $("#backGround1").show();

            });

            $("#x1").click(function(){
                $("#choiceWindow1").slideUp(300);
                $("#backGround1").hide();
            })
			
			$("#ok1").click(function(){
                $("#choiceWindow1").slideUp(300);
                $("#backGround1").hide();
            })

    });
	
	$(document).ready(function(){
		    $("#submit_label3").click(function(){
		    	$("#file3_form").submit();
		    });    
		   
            $("#ex").click(function(){
                $("#existWindow").slideUp(300);
                $("#existGround").hide();
            })
			
			$("#eok").click(function(){
                $("#existWindow").slideUp(300);
                $("#existGround").hide();
                
            })

    });
	
	function close(){		
		if (confirm("您确定要关闭本页吗？")){
			window.opener=null;
			window.open('','_self');
			window.close();
		}
	}
	function addaccount(){
		//<!-- 获取序列化表单(project_form)元素JSON数据-->
		var project = $("#project_form").serializeArray();
		//<!-- 获取序列化表单(category_form)元素JSON数据-->
		var category = $("#category_form").serializeArray();
		var breifIntro=$("#breifintro_from").serializeArray();
		var stage=$("#stage_from").serializeArray();
		var days_setting1=$("#days_setting1_from").serializeArray();
		var scalereviewing=$("#scalereviewing_from").serializeArray();
		var scalereport=$("#scalereport_from").serializeArray();
		var group=$("#group_form").serializeArray();
		var manager=$("#manager_from").serializeArray();
		//var form=new FormData(document.getElementById("form1"))
		
		
		//<!-- 创建一个新的对象来封装对象的元素信息-->
		
		var obj = {};
		for(var i in project){
		obj[project[i].name] = project[i].value;
		}
		for(var i in category){
		obj[category[i].name] = category[i].value;
		}
		for(var i in breifIntro){
			obj[breifIntro[i].name] = breifIntro[i].value;
			}
		for(var i in stage){
			obj[stage[i].name] = stage[i].value;
			}
		for(var i in days_setting1){
			obj[days_setting1[i].name] = days_setting1[i].value;
			}
		for(var i in scalereviewing){
			obj[scalereviewing[i].name] = scalereviewing[i].value;
			}
		for(var i in scalereport){
			obj[scalereport[i].name] = scalereport[i].value;
			}
		for(var i in group){
			obj[group[i].name] = group[i].value;
			}
		for(var i in manager){
			obj[manager[i].name] = manager[i].value;
			}
		
		//var upperLimitFunds= Number($("#pro5").value);
		//var lowerLimitFunds= Number($("#pro6").value);
		//obj[upperLimitFunds] = upperLimitFunds.value;
		//obj[lowerLimitFunds] = lowerLimitFunds.value;
		var projectname = '<%= session.getAttribute("projectName")%>';
		console.log(obj);
		
		$.post("<%=basePath%>api/addaccount.action",obj,function(data){
			 alert(data);
			 
			 if (confirm('Are you sure to turn to sign in account?'))
			 window.location.href ="<%=basePath%>api/connect.action";
			}); 

		//<!--${"#category_form"}.submit();-->
	}
	
</script>  
</body>
</html>