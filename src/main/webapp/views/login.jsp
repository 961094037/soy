<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="<%=request.getContextPath() %>/css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/login.js"></script>
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
            <input type="submit" name="logintext" class="btone"  value="登陆"/>
            <input type="button" name="toregisttext" class="btone" onclick="goregister()" value="注册"/>
            </form>
        </div>
    	<div class="mainbg"></div>
    </div>
    <div class="footerfont">项目名称：石大小云盘　　|　　制作小组：酱油小分队</div>
</div>
</body>
</html>
