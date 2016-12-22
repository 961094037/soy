//全部文件
function changedata(s){
	//var data = document.getElementById("s");
	s.className = "changedata";}
function returndata(s){
	//var data = document.getElementById("s");
	s.className = "data";}
	
function changel(s){
	s.className = "changel";}
function returnl(s){
	s.className = "listmain";}
	
function openupload(){//打开上传模块
	var upup = document.getElementById("upup");
	
			//网页的高度和宽度
	var sheight = document.documentElement.scrollHeight;
	var swidth = document.documentElement.scrollWidth;
	//可视区域的高度和宽度
	var wheight = document.documentElement.clientHeight;
	
	var oMask = document.createElement("div");
	oMask.id = "mask";
	oMask.style.height = sheight + "px";
	oMask.style.width = swidth + "px";
	document.body.appendChild(oMask);
	var oUploadd = document.createElement("div");
	oUploadd.id = "uploadd";
	//加入upload的html代码
	oUploadd.innerHTML = "<input type='file' name='file_upload' id='file_upload'/>";
	document.body.appendChild(oUploadd);
	var dheight = oUploadd.offsetHeight;
	var dwidth = oUploadd.offsetWidth;
	oUploadd.style.left = (swidth - dwidth)/2 + "px";
	oUploadd.style.top = (sheight - dheight)/2 + "px";
	oMask.onclick=function(){
					document.body.removeChild(oUploadd);
					document.body.removeChild(oMask);
					};
	
	};
window.upup.onclick = function(){
		var upid = document.getElementById("upup");
		upid.onclick = function(){
			openupload()
			return false;}	}




	