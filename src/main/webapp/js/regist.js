// JavaScript Document

function isL(){//检查密码
	var pass1 = document.forms[0].stpassword.value;
	var s1 = document.getElementById("s1span");
	if(pass1.length >= 6 && pass1.length <= 16){
		s1.innerHTML = " ";
		return true;}
	else{
		s1.innerHTML = "密码必须为6-16位";
		return false;}
	}
	
function isP(){//是否为1开头的手机号格式
	var regu = /^1[358][0123456789]\d{8}$/; ;
	var re = new RegExp(regu);
	var pnum = document.forms[0].phone.value;
	var pspan = document.getElementById("pspan");
	if(re,test(pnum)) return true;
	else{
		pspan.innerHTML = "手机号码格式不正确";
		return false;}
	}
	
function isN(s){//验证是否为纯数字
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	var qnum = document.forms[0].qq.value;
	var qspan = document.getElementById("qspan");
	if(re.test(qspan)) return true;
	else{
		qspan.innerHTML = "qq号码只能为纯数字";
		return false;}
	}
	
function isSame(){//判断密码两次输入是否相同
	var pass1 = document.forms[0].stpassword.value;
	var pass2 = document.forms[0].stpassword2.value;
	var s2 = document.getElementById("s2span");
	if(pass2 != pass1){
		s2.innerHTML = "两次密码必须相同";
		return false;}
	else{
		s2.innerHTML = " ";
		return true;}
	}

function mainCheck(){
	if(isL() && true && true) 
		{
		
		alert("注册成功");
		return true;
		}
		
	else{
		alert("请正确填写注册信息！");
		return false;}}