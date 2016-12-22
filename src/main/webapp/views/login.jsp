<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="<%=request.getContextPath() %>/css/login.css" rel="stylesheet" type="text/css">
<script charset="utf-8" type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login.js"></script>
<script>
function success(){
	$.post("<%=request.getContextPath() %>/login.do/check.do",{username:$("#lname").val(),password:$("#lpass").val()},
			function(data,status,xhr){
	    if(data=="success"){
			alert("登陆成功！");
			window.location.href="<%=request.getContextPath() %>/main.do";
		}else{
			alert("用户名或密码错误！");
		}
	});
}
function checkinfo(){
	if($("#lname").val()==""  || $("#lpass").val()== "" )
		{
		alert("用户名和密码不能为空！");
		}
	else{
		success();
	}
}
</script>
</head>

<body style="background-color:#8ED7CF;">
<div id="mainbody">
    <div id="bodyhead">
    	<img src="<%=request.getContextPath() %>/img/logo.png" class="logo">
    </div>
    <div id="bodybody">
    	<div class="mainlogin">
        	<form action="">
        	<div class="logintop">账号<input required="required" type="text" class="lgtext" id="lname" value="${username}"/></div>
            <div>密码<input required="required" type="password" class="lgtext" id="lpass"/></div>
            <input type="button" name="logintext" class="btone"  value="登陆" onclick="checkinfo()"/>
            <input type="button" name="toregisttext" class="btone" onclick="goregister()" value="注册"/>
            </form>
        </div>
    	<div class="mainbg"></div>
    </div>
    <div class="footerfont">项目名称：石大小云盘　　|　　制作小组：酱油小分队</div>
</div>
</body>
</html>
