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
	
function isPP(){
	var pattern = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
	str = document.forms[0].phone.value;
//	console.log(pattern.test(str));
	var pspan = document.getElementById("pspan");
	if (!pattern.test(str)){
		pspan.innerHTML = "号码格式不不正确";
		return false;}
	else{
		pspan.innerHTML = " ";
		return true;}}


function isN(){//验证是否为纯数字
	var pattern = /^\d{6,10}$/;
	var qnum = document.forms[0].qq.value;
	var qspan = document.getElementById("qspan");
	if(!pattern.test(qnum)) {
		qspan.innerHTML = "qq号为6-10位数字";
		return false;}
	else{
		qspan.innerHTML = " ";
		return true;}
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

function check(){
	if($("#s0span").html()=="用户名可以使用")
		return true;
}


function mainCheck(){
	if(isL() && isN() && isPP() && isSame() && check()) 
		{
		
		alert("注册成功");
		return true;
		}
		
	else{
		alert("请正确填写注册信息！");
		return false;}}