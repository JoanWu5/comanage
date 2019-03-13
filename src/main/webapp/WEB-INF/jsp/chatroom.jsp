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
SimpleDateFormat df=new SimpleDateFormat("yyyyMMdd HH:mm:ss");
//String s=df.format(new Date());
java.util.Date currentTime = new java.util.Date();  
String time = df.format(currentTime).toString();   //放到页面的head中}  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>chatroom</title>
<link rel="icon" href="<%=basePath%>images/favicon.ico" type="image/x-icon"/>
<link rel="icon" href="<%=basePath%>favicon.ico" type="image/x-icon">
<link rel="icon" href="<%=basePath%>images/logo.ico" type="image/x-icon"/>
<link type="text/css" rel="stylesheet" href="<%=basePath%>chatroom/css/style.css">
<script type="text/javascript" src="<%=basePath%>chatroom/js/jquery.min.js"></script>
</head>

<body>
<div class="chatbox">
  <div class="chat_top fn-clear">
    <div class="logo"><img src="<%=basePath%>chatroom/images/logo.png" width="190" height="36"  alt=""/></div>
    <div class="uinfo fn-clear">
      <div class="uface"><img <c:if test="${not empty userPath }">src="${userPath }"</c:if> <c:if test="${empty userPath }">src="<%=basePath%>chatroom/images/Tom.png"</c:if> width="40" height="40"  alt=""/></div>
      <div class="uname">
        ${username }<i class="fontico down"></i>
        <!-- 便于js抽取路径 -->
        <input type="hidden" id="basepath" name="basepath" value="<%=basePath%>">
        <ul class="managerbox">
          <li><a href="<%=basePath%>user/personalHome.action"><i class="fontico logout"></i>quit</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="chat_message fn-clear">
    <div class="chat_left">
      <div class="message_box" id="message_box">
        <div class="msg_item fn-clear">
          <div class="uface"><img src="<%=basePath%>chatroom/images/comanage.png" width="40" height="40"  alt=""/></div>
          <div class="item_right">
            <div class="msg">Hello,we are comanage</div>
            <div class="name_time">Comanage · 3 minutes ago</div>
          </div>
        </div>
        
        <div class="msg_item fn-clear">
          <div class="uface"><img src="<%=basePath%>chatroom/images/Tim.jpg" width="40" height="40"  alt=""/></div>
          <div class="item_right">
            <div class="msg">What's Comanage?</div>
            <div class="name_time">Tim · 1 minute ago</div>
          </div>
        </div>
        
        <div class="msg_item fn-clear">
          <div class="uface"><img src="<%=basePath%>chatroom/images/comanage.png" width="40" height="40"  alt=""/></div>
          <div class="item_right">
            <div class="msg own">This platform is develped to help the community economy to manage the collective funds and reveal the flows of money to associate groups.</div>
            <div class="name_time">Comanage  · 30 seconds ago</div>
          </div>
        </div>
      </div>
      <div class="write_box">
        <textarea id="message" name="message" class="write_area" placeholder="Say something..."></textarea>
        <input type="hidden" name="fromname" id="fromname" value="Tom" />
        <input type="hidden" name="to_uid" id="to_uid" value="0">
        <div class="facebox fn-clear">
          <div class="expression"></div>
          <div class="chat_type" id="chat_type">chatroom</div>
          <button name="" class="sub_but">submit</button>
        </div>
      </div>
    </div>
    <div class="chat_right">
      <ul class="user_list" title="double click on private chat">
        <li class="fn-clear selected"><em>all users</em></li>
        <li class="fn-clear" data-id="1"><span><img src="<%=basePath%>chatroom/images/Tom.jpg" width="30" height="30"  alt=""/></span><em>Tom</em><small class="online" title="online"></small></li>
        <li class="fn-clear" data-id="2"><span><img src="<%=basePath%>chatroom/images/comanage.png" width="30" height="30"  alt=""/></span><em>comanage</em><small class="online" title="online"></small></li>
        <li class="fn-clear" data-id="3"><span><img src="<%=basePath%>chatroom/images/Tim.jpg" width="30" height="30"  alt=""/></span><em>Tim</em><small class="offline" title="offline"></small></li>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(e) {
	$('#message_box').scrollTop($("#message_box")[0].scrollHeight + 20);
	$('.uname').hover(
	    function(){
		    $('.managerbox').stop(true, true).slideDown(100);
	    },
		function(){
		    $('.managerbox').stop(true, true).slideUp(100);
		}
	);
	
	var fromname = $('#fromname').val();
	var to_uid   = 0; // 默认为0,表示发送给所有用户
	var to_uname = '';
	$('.user_list > li').dblclick(function(){
		to_uname = $(this).find('em').text();
		to_uid   = $(this).attr('data-id');
		if(to_uname == fromname){
		    alert('you cannot chat with yourself ');
			return false;
		}
		if(to_uname == 'all users'){
		    $("#toname").val('');
			$('#chat_type').text('chatroom');
		}else{
		    $("#toname").val(to_uid);
			$('#chat_type').text('you are chatting with ' + to_uname);
		}
		$(this).addClass('selected').siblings().removeClass('selected');
	    $('#message').focus().attr("placeholder", "you said to"+to_uname);
	});
	
	$('.sub_but').click(function(event){
	    sendMessage(event, fromname, to_uid, to_uname);
	});
	
	/*按下按钮或键盘按键*/
	$("#message").keydown(function(event){
		var e = window.event || event;
        var k = e.keyCode || e.which || e.charCode;
		//按下ctrl+enter发送消息
		if((event.ctrlKey && (k == 13 || k == 10) )){
			sendMessage(event, fromname, to_uid, to_uname);
		}
	});
});
function sendMessage(event, from_name, to_uid, to_uname){
    var msg = $("#message").val();
	if(to_uname != ''){
	    msg = 'I said  ' + msg+ ' to ' + to_uname ;
	}
	var basepath=document.getElementById("basepath");
	var url=basepath+"chatroom/images/Tom.png";
	var htmlData =   '<div class="msg_item fn-clear">'
                   + '   <div class="uface"><img src='+url+' width="40" height="40"  alt=""/></div>'
			       + '   <div class="item_right">'
			       + '     <div class="msg own">' + msg + '</div>'
			       + '     <div class="name_time">' + from_name + ' · 5 seconds ago</div>'
			       + '   </div>'
			       + '</div>';
	$("#message_box").append(htmlData);
	$('#message_box').scrollTop($("#message_box")[0].scrollHeight + 20);
	$("#message").val('');
}
</script>
</body>
</html>
