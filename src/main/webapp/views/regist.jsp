<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link href="<%=request.getContextPath() %>/css/regist.css" rel="stylesheet" type="text/css">
<script charset="utf-8" type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.js"></script>
<script charset="utf-8" type="text/javascript" src="<%=request.getContextPath() %>/js/regist.js"></script>
<script>
function checkUserName(){
	
	$.post("<%=request.getContextPath() %>/login.do/checkUserName.do",{username:$("#stnumber").val()},
			function(data,status,xhr){
		if(data=="false"){
			document.getElementById("s0span").innerHTML = "用户名已经存在";  
			s0span.style.color = "red";
			return false;
		}else if(data=="true"){
			document.getElementById("s0span").innerHTML = "用户名可以使用";
			s0span.style.color = "green";
			return true;
		}else{
			document.getElementById("s0span").innerHTML = "用户名不能为空";  
			s0span.style.color = "red";
			return false;
		};
	});
}
</script>

</head>

<body style="background-color:#8ED7CF;margin:0;padding:0;" >
<div id="mainbody">
    <div id="bodyhead">
    	<img src="<%=request.getContextPath() %>/img/logo.png" class="logo">
    </div>
    <div id="bodybody">
    	<form action="<%=request.getContextPath() %>/login.do/regist.do" onsubmit="return mainCheck()"  id="register" method="post">
	    <table class="mainregist">
   		 	<tr class="ktext"><th class="tbwidth">用户名：</th><th><input name="username" required="required" type="text" id="stnumber"class="rtext" placeholder="用户名不可为空" autofocus="autofocus" onBlur="checkUserName()"/> <span id="s0span" class="warm"></span></th></tr>
            <tr class="ktext"><th class="tbwidth">密码</th><th><input name="password" required="required" type="password" id="stpassword" class="rtext"  placeholder="密码长度须为6-16个字符" onBlur="isL()"/><span id="s1span" class="warm"></span></th></tr>
     	   <tr class="ktext"><th class="tbwidth">确认密码：</th><th><input  required="required" type="password" id="stpassword2" class="rtext" placeholder="须与上输密码一致" onBlur="isSame()"/><span id="s2span" class="warm"></span></th></tr>
            <tr class="ktext"><th class="tbwidth">手机号码：</th><th><input name="tel" required="required" type="text" id="phone" class="rtext" placeholder="请输入11位手机号" onblur="isPP()"/><span id="pspan" class="warm"></span></th></tr>
        	<tr class="ktext"><th class="tbwidth">QQ号</th><th><input name="qq" type="text" id="qq" class="rtext" placeholder="请输入QQ号" onblur="isN()"/><span id="qspan" class="warm"></span></th></tr>
       		<tr><th colspan="2" align="center"><input type="submit" name="registtext" class="rgone" value="注册"/><a href="login.do" class="tologin">返回登陆</a></th></tr>
    	</table></form>
    </div>
    <div class="footerfont">项目名称：石大小云盘　　|　　制作小组：酱油小分队</div>
</div>
</body>
</html>
