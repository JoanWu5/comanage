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
    <!--  <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />-->
    <title>form</title>
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
        <a href="<%=basePath%>user/participate.action">My Project</a>
        <!--<img src="img/start.png" width="132px" height="33px" id="startlogo">-->
        <label id="startlogo">Let's start now</label>
        <a href="<%=basePath%>user/personalHome.action" id="nav4">Hi,${username }</a>
        <a href="<%=basePath%>user/personalHome.action"><img <c:if test="${not empty userPath }">src="${userPath }"</c:if> <c:if test="${empty userPath }">src="<%=basePath%>/images/person.png"</c:if> width="39px" height="39px" id="person"></a>                
    </div>  
    <div class="form">
    	<form id="project_form" action="" method="POST">
    	    <!--<c:if test="${not empty projectName }">value=${projectName }</c:if>-->
    		<label class="description" id="project1">Project Name:</label> 
    		<input type="text" id="pro" name="projectName"  placeholder="Name" <c:if test="${not empty projectName }">value=${projectName }</c:if>>
    		<label class="description" id="categroy1">Category:</label>
    		
    	</form>
    	<!-- 获取后台submit.sction的提交是否成功的消息:msg -->
         <input id="msg" type="hidden" value="${msg }"/>
    	<form id="category_form" action="" method="post">	
    		<select id="sel1" name="category">
    			<option value="Club" <c:if test="${category=='Club' }"> selected="selected"</c:if>>Club</option>
            	<option value="Investment" <c:if test="${category=='Investment' }"> selected="selected"</c:if>>Investment</option>
            	<option value="Charity" <c:if test="${category=='Charity' }"> selected="selected"</c:if>>Charity</option>
            	<option value="Others" <c:if test="${category=='Others' }"> selected="selected"</c:if>>Others</option>
            	<c:if test="${not empty category }"><option selected="selected">${category }</option></c:if>
    		</select>
    	</form>	
    	<!--  <p>${projectName },${stage  },${days } ,${upperLimitFunds },${lowerLimitFunds },${scaleReviewing }</p>
    	<p>${modulus }</p>
    	<P>${exponent }</p>
    	<p>${jointAccountId }
    	<P>${msg }</P>
    	<p>${projectPath }</p>
    	<p>${processPath }</p>
    	<p>${groupPath }</p>
    	<P>userPath:${userPath }</P>
    	<P>firstName:${firstName }</P>-->
		<form id="breifintro_from" action="" method="POST" enctype="multipart/form-data">
			<input type="text" id="pro2" placeholder="Add Subcategories" >
			<label class="description" id="intro">Brief Intro:</label>
			<textarea name="breifIntro"  id="pro3" placeholder="No more than 200 words" style="text-align: top;"><c:if test="${not empty breifIntro }">${breifIntro }</c:if></textarea>
		</form>
		<form id="file1_form" action="<%=basePath%>api/uploadfile.action" enctype="multipart/form-data" method="post">
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
		<form id="stage_from" action="" method="get">	
    		<select id="sel2" name="stage">
    			<option value="In the beginning" <c:if test="${stage=='In the beginning' }"> selected="selected"</c:if>>In the beginning</option>
            	<option value="In the process" <c:if test="${stage=='In the process' }"> selected="selected"</c:if>>In the process</option>
            	<option value="At last" <c:if test="${stage=='At last' }"> selected="selected"</c:if>>At last</option>
            	<c:if test="${not empty stage }"><option selected="selected">${stage }</option></c:if>          		
    		</select>
    	</form>
		<form id="days_from" action="" method="post" >
			<label class="description" id="day" >Days:</label>
			<input type="text" name="days" id="pro4" placeholder="How many days?" <c:if test="${not empty days }">value=${days }</c:if>>
		</form>
		<form id="file2_from" action="<%=basePath%>api/uploadfile.action" method="post" enctype="multipart/form-data">
			<div class="file">
				<input id="img_input2" name="processImage" type="file" accept="image/*" onchange="showPreview(this.id,'portrait2')"/>
				<label for="img_input2" id="img_label2">Upload Pics
                <i class="fa fa-plus fa-lg"></i></label>
                <img <c:if test="${not empty processPath }">src="${processPath }"</c:if> <c:if test="${empty processPath }">src="<%=basePath%>/images/Image.png"</c:if> id="portrait2"  style="width: 200px; height: 37px; display: block;background-color:#000; overflow:hidden;">
			    <button type="submit" id="submit_label2" value="SubmitImage">SubmitImage</button>
			</div>
		</form>
		<form id="setting_form" method="post" action="">
			<label class="description" id="settings">Settings</label>
			<label class="description" id="re">(can be changed when all members agree)</label>
			<label class="description" id="settings2"></label>
			<label class="description" id="upper">Upper Limit of  Funds :</label>
			<label class="description" id="upper1"> To confirm your scale of amounts</label>
			<input type="text" name="upperLimitFunds" id="pro5" placeholder="￥" <c:if test="${not empty upperLimitFunds }">value=${upperLimitFunds }</c:if>>
			<label class="description" id="lower">Lower Limit of  Funds :</label>
			<label class="description" id="lower1"> To confirm your start-up capital</label>
			<input type="text" name="lowerLimitFunds" id="pro6" placeholder="￥" <c:if test="${not empty lowerLimitFunds }">value=${lowerLimitFunds }</c:if>>
			<label class="description" id="review"> Scale for Reviewing :</label>
			<label class="description" id="review1">To confirm the proportion</label>
		</form>
		<form id="scalereviewing_form" action="" method="post">	
    		<select id="sel3" name="scaleReviewing">
    			<option value="10%" <c:if test="${scaleReviewing=='10%' }"> selected="selected"</c:if>>10%</option>
            	<option value="20%" <c:if test="${scaleReviewing=='20%' }"> selected="selected"</c:if>>20%</option>
            	<option value="30%" <c:if test="${scaleReviewing=='30%' }"> selected="selected"</c:if>>30%</option>
            	<option value="40%" <c:if test="${scaleReviewing=='40%' }"> selected="selected"</c:if>>40%</option>
            	<option value="50%" <c:if test="${scaleReviewing=='50%' }"> selected="selected"</c:if>>50%</option>	
            	<option value="60%" <c:if test="${scaleReviewing=='60%' }"> selected="selected"</c:if>>60%</option>
            	<option value="70%" <c:if test="${scaleReviewing=='70%' }"> selected="selected"</c:if>>70%</option>
            	<option value="80%" <c:if test="${scaleReviewing=='80%' }"> selected="selected"</c:if>>80%</option>
            	<option value="90%" <c:if test="${scaleReviewing=='90%' }"> selected="selected"</c:if>>90%</option>
            	<option value="100%" <c:if test="${scaleReviewing=='100%' }"> selected="selected"</c:if>>100%</option>
            	<c:if test="${not empty scaleReviewing }"><option selected="selected">${scaleReviewing }</option></c:if>
    		</select>
    	</form>
		<form  action="" method="post">
			<label class="description" id="report">Scale for Reporting :</label>
			<label class="description" id="report1">To confirm the proportion</label>
		</form>
		<form id="scalereport_form" action="" method="get">	
    		<select id="sel4" name="scaleReport">
            	<option value="5%" <c:if test="${scaleReport=='5%' }"> selected="selected"</c:if>>5%</option>
            	<option value="10%" <c:if test="${scaleReport=='10%' }"> selected="selected"</c:if>>10%</option>
            	<option value="20%" <c:if test="${scaleReport=='20%' }"> selected="selected"</c:if>>20%</option>
            	<option value="30%" <c:if test="${scaleReport=='30%' }"> selected="selected"</c:if>>30%</option>
            	<option value="40%" <c:if test="${scaleReport=='40%' }"> selected="selected"</c:if>>40%</option>
            	<option value="50%" <c:if test="${scaleReport=='50%' }"> selected="selected"</c:if>>50%</option>	
            	<option value="60%" <c:if test="${scaleReport=='60%' }"> selected="selected"</c:if>>60%</option>
            	<option value="70%" <c:if test="${scaleReport=='70%' }"> selected="selected"</c:if>>70%</option>
            	<option value="80%" <c:if test="${scaleReport=='80%' }"> selected="selected"</c:if>>80%</option>
            	<option value="90%" <c:if test="${scaleReport=='90%' }"> selected="selected"</c:if>>90%</option>
            	<option value="100%" <c:if test="${scaleReport=='100%' }"> selected="selected"</c:if>>100%</option>
            	<c:if test="${not empty scaleReport }"><option selected="selected">${scaleReport }</option></c:if>
    		</select>
    	</form>
		
			<label class="description" id="group">Creating a group:</label>
			<button id="img_label3" style="border: none;">Use existing one
            <i class="fa fa-plus fa-lg"></i></button>
            <div id="existWindow">
            	<label id="ex" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
               	<form action="" method="post">
                	<label>Please choose your previous group name:</label>&nbsp &nbsp  &nbsp 
                	<ul class="dowebok">
						<li><input type="checkbox" name="checkbox" value="ID1">ID1</li>
						<li><input type="checkbox" name="checkbox" value="ID2">ID2</li>
						<li><input type="checkbox" name="checkbox" value="ID3">ID3</li>
						<li><input type="checkbox" name="checkbox" value="ID4">ID4</li>
						<li><input type="checkbox" name="checkbox" value="ID5">ID5</li>
						<li><input type="checkbox" name="checkbox" value="ID6">ID6</li>
						<li><input type="checkbox" name="checkbox" value="ID7">ID7</li>
					</ul>
					<button type="button" value="OK" id="eok">OK</button>
				</form>
        	</div>
        	<div id="existGround"></div>
        	
		<form id="file3_form" action="<%=basePath%>api/uploadfile.action" method="post" enctype="multipart/form-data">	
			<div class="file">
				<input id="img_input3" name="groupImage" type="file" accept="image/*" onchange="showPreview(this.id,'portrait3')"/>
				<label for="img_input3" id="img_label4">Upload Pics
                <i class="fa fa-plus fa-lg"></i></label>
                <img <c:if test="${not empty groupPath }">src="${groupPath }"</c:if> <c:if test="${empty groupPath }">src="<%=basePath%>/images/person.png"</c:if> id="portrait3"  style="width: 39px; height: 39px; border-radius:39px;display: block;background-color:#deeefc; overflow:hidden;">
			    <button type="submit" id="submit_label3" value="SubmitImage">SubmitImage</button>
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
			<button id="add1" ><i class="fa fa-plus fa-lg"></i></button>
			<div id="choiceWindow">
            	<label id="x" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
               	<form>
                	<label>Please choose your participants:</label>&nbsp &nbsp  &nbsp 
                	<ul class="dowebok">
						<li><input type="checkbox" name="checkbox" value="ID1">ID1</li>
						<li><input type="checkbox" name="checkbox" value="ID2">ID2</li>
						<li><input type="checkbox" name="checkbox" value="ID3">ID3</li>
						<li><input type="checkbox" name="checkbox" value="ID4">ID4</li>
						<li><input type="checkbox" name="checkbox" value="ID5">ID5</li>
						<li><input type="checkbox" name="checkbox" value="ID6">ID6</li>
						<li><input type="checkbox" name="checkbox" value="ID7">ID7</li>
					</ul>
					<button type="button" value="OK" id="ok">OK</button>
				</form>
        	</div>
        	<div id="backGround"></div>
			
		<form id="manager_form" action="" method="post">	
			<label class="description" id="group4">Inviting Managers :</label>
			<input type="text" id="pro10" name="managerId" placeholder="managers' ID，spilt by ，" <c:if test="${not empty managerId }">value=${managerId }</c:if>>
		</form>
		
			<button id="add2"><i class="fa fa-plus fa-lg"></i></button>	
			<div id="choiceWindow1">
            	<label id="x1" style="position: absolute;top:2px;left: 95%;font-size: 25px;">x</label>
               	<form action="" method="post">
                	<label>Please choose your managers:</label>&nbsp &nbsp  &nbsp 
                	<ul class="dowebok">
						<li><input type="checkbox" name="checkbox" value="ID1">ID1</li>
						<li><input type="checkbox" name="checkbox" value="ID2">ID2</li>
						<li><input type="checkbox" name="checkbox" value="ID3">ID3</li>
						<li><input type="checkbox" name="checkbox" value="ID4">ID4</li>
						<li><input type="checkbox" name="checkbox" value="ID5">ID5</li>
						<li><input type="checkbox" name="checkbox" value="ID6">ID6</li>
						<li><input type="checkbox" name="checkbox" value="ID7">ID7</li>
					</ul>
					<button type="button" value="OK" id="ok1">OK</button>	
				</form>
        	</div>
        	<div id="backGround1"></div>
        	
		<form action="<%=basePath%>api/submit.action" method="post">		
			<label class="description" id="account">Joint account:</label>
			<button type="button" id="img_label5" style="border: none;" onclick="addaccount()">Add existing account
			<i class="fa fa-plus fa-lg"></i></button>           
            <button type="button" name="button" id="img_label6" style="border: none;" onclick="diag()">Create one later</button>
            <label class="description" id="account1"> You are required to have one when the project funds reach the setted minimum level</label>
            <input type="submit" value="submit" id="submit">
		</form>
		
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
				
				$("#submit_label2").click(function(){
		        	$("#file2_form").submit();
		        });
				$("#submit_label3").click(function(){
			        	$("#file3_form").submit();
			    });

                $("#img_label3").click(function(){
                    $("#existWindow").slideDown(300);
                    $("#existGround").show();

                });
               
            $("#ex").click(function(){
                $("#existWindow").slideUp(300);
                $("#existGround").hide();
            })
			
			$("#eok").click(function(){
                $("#existWindow").slideUp(300);
                $("#existGround").hide();
                window.location.href ="<%=basePath%>api/useexist.action";   
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
		var days=$("#days_from").serializeArray();
		var setting=$("#setting_form").serializeArray();
		var scalereviewing=$("#scalereviewing_form").serializeArray();
		var scalereport=$("#scalereport_form").serializeArray();
		var group=$("#group_form").serializeArray();
		var manager=$("#manager_form").serializeArray();
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
		for(var i in days){
			obj[days[i].name] = days[i].value;
			}
		for(var i in setting){
			obj[setting[i].name]=setting[i].name;
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
			 //alert(data);
			 if(data=="0"){
				 if (confirm('Are you sure to turn to sign in account?'))
				 window.location.href ="<%=basePath%>api/connect.action";
			 }
			}); 

		//<!--${"#category_form"}.submit();-->
	}
	
</script>  
</body>
</html>