<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@page import="soy.maven.disk.pojo.File"%>
    <%@page import="java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%HttpSession ses = request.getSession(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>石大小云盘</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/uploadify/uploadify.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/uploadify/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js"></script>
<script type="text/javascript">
	$(function() {
		$('#file_upload').uploadify({
			'swf'      : 'uploadify/uploadify.swf',
			'uploader' : '<%=request.getContextPath()%>/main.do/uploadfile.do',
			
			
			//上传数据
	//		'formData'  : {'filesize':6666},
			
	        //长宽
	        'width' : 80,
	        'height' :40,
			
			//是否自动上传 true or false
		    'auto':false,
			
		  //超时时间上传成功后，将等待服务器的响应时间。
	        //在此时间后，若服务器未响应，则默认为成功(因为已经上传,等待服务器的响应) 单位：秒
	        'successTimeout':99999,
			// Your options here
			
			//方法POST或者GET
			'method' :'post',
			
			//将要上传的文件对象的名称 必须与后台controller中抓取的文件名保持一致    
	        'fileObjName':'pic',
			
			//按钮文本
			'buttonText':'选取文件',
			
			//文件选择后的容器div的id值 
           'queueID':'uploadfileQueue',
           
 	      //在浏览窗口底部的文件类型下拉菜单中显示的文本
      //     'fileTypeDesc':'支持的格式：',

       		        //允许上传的文件后缀
      //     'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png',
           
           /*上传文件的大小限制允许上传文件的最大 大小。 这个值可以是一个数字或字 符串。
           如果它是一个字符串，它接受一个单位(B, KB, MB, or GB)。
            默认单位为KB您可以将此值设置为0 ，没有限制, 
             单个文件不允许超过所设置的值 如果超过 onSelectError时间被触发*/
	        'fileSizeLimit':'10000MB',
       
       //允许上传的文件的最大数量。当达到或超过这个数字，onSelectError事件被触发。
	        'queueSizeLimit' : 20,
	        
	        
	        //上传到服务器，服务器返回相应信息到data里
	        'onUploadSuccess':function(file, data, response){
            update();
	        },

	      //当单个文件上传出错时触发
	        'onUploadError': function (file, errorCode, errorMsg, errorString) { 
	        	alert("上传失败");
	        	} 
           
		});
	});
	    //开始上传
	    function doUpload() {  
            $('#file_upload').uploadify('upload', '*');  
        }  
        //停止上传   
        function closeLoad() {  
            $('#file_upload').uploadify('cancel', '*');  
        }  	
	</script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js"></script>

</head>

<body style="background-color:#8ED7CF;">
<div id="qqq">
  <div class="leftl">
       
  </div>
	<div id="mainbody">
        	<img src="<%=request.getContextPath() %>/img/logo.png" class="logo">
        
    	<div class="headright"> <input type='button' value='开始上传'  onclick='doUpload()' class="smallb"/>
     <input class="smallb" type='button' value='取消上传'  onclick='closeLoad()'/><input type="button" class="smallb" id="share" value="分享"></div>
        <div class="mymassage"><span class="yesok1" id="yesok1"></span><%=ses.getAttribute("username") %><a href="JavaScript:leave();" class="yesok2">注销</a></div>
        <!--ä¸ªäººä¿¡æ¯åå¤´å-->
        <div class="middle">
        	<div class="bodyleft">
        		<div class="data" name="ofi" id="allfile" onmouseover="changedata(this)" onmouseout="returndata(this)" onclick="update()">全部文件</div>
            	<div class="data" name="ofi" id="picture" onmouseover="changedata(this)" onmouseout="returndata(this)" onclick="init_img()">图片</div>
            	<div class="data" name="ofi" id="vadio" onmouseover="changedata(this)" onmouseout="returndata(this)" onclick="init_audio()">视频</div>
           		<div class="data" name="ofi" id="music" onmouseover="changedata(this)" onmouseout="returndata(this)" onclick="init_bgm()">音乐</div>
            	<div class="data" name="ofi" id="else" onmouseover="changedata(this)" onmouseout="returndata(this)" onclick="init_other()">其他</div>
            	<!--å·²ç¨ç©ºé´æ¾ç¤º-->
        	</div>
     	    <div class="bodyright">
     <!--         <table>
                <tr class="listmain" onmouseover="changel(this)" onmouseout="returnl(this)">
                <th class="lname" align="left"><span id="lname">åç§°</span></th>
                <th class="lsize" align="left"><span id="lname">åç§°</span></th>
                <th class="ldone"><img src="<%=request.getContextPath() %>/img/download.png" class="picsize"/></th>
                <th class="ldone"><img src="<%=request.getContextPath() %>/img/delete.png" class="picsize"/></th></tr> 
                </table>
                -->
             <table id="tablelist">
       <tr><th class="fname">文件名</th><th class="fsize">大小</th><th class="fdown">下载</th><th class="fup">删除</th></tr>
        <c:forEach items="${list}" var="item">       
        </c:forEach>
     </table>
     	    </div>
        </div>
 
    </div>
  </div>
  <div class="oneone">
    <input type='file' name='file_upload' id='file_upload' align="middle"/>
     <div id="uploadfileQueue"></div> 
     </div>
   
     
    <form  action="<%=request.getContextPath()%>/main.do/donwload.do"  id="forsub" method="post">
    <input type="hidden" name="filename" id="subtext"/>
    </form>
<!--  <div id=mask>
  <div id=uploadd>
  	<div class="updd">
      <img src="close.png" class="closedd"/>
      </div>
    </div>
  </div>-->
</body>
</html>
<script>

       //初始化数据
	   $(function(){
       	 init();
	   });
       
       //数据获取方法
	   function init(){
		   $.post("<%=request.getContextPath()%>/main.do/init.do",
	       			function (list,status,xhr){
	       		    var item; 
	       		    $.each(list,function(i,result){ 
	       		     item = "<tr class='deltr'><td>"+result['filename']+"</td><td>"+result['filesize']+"</td><td>"+ 
	       		     "<img src='<%=request.getContextPath() %>/img/download.png' class='picsize' onclick='sub(this)'>"
	       		     +"</td><td>"+
	       		     "<img src='<%=request.getContextPath() %>/img/delete.png' class='picsize' onclick='del(this)'>"
	       		     +"</td></tr>"; 
	       		        $('#tablelist').append(item); 
	       		    
	       	        });
	       });
	   }
       
       
       //图片数据
       function init_img(){
    	   $(".deltr").remove();
    	   $.post("<%=request.getContextPath()%>/main.do/init_img.do",
	       			function (list,status,xhr){
	       		    var item; 
	       		    $.each(list,function(i,result){ 
	       		     item = "<tr class='deltr'><td>"+result['filename']+"</td><td>"+result['filesize']+"</td><td>"+ 
	       		     "<img src='<%=request.getContextPath() %>/img/download.png' class='picsize' onclick='sub(this)'>"
	       		     +"</td><td>"+
	       		     "<img src='<%=request.getContextPath() %>/img/delete.png' class='picsize' onclick='del(this)'>"
	       		     +"</td></tr>"; 
	       		        $('#tablelist').append(item); 
	       		    
	       	        });
	       });
       }
       
       //视频数据
       function init_audio(){
    	   $(".deltr").remove();
    	   $.post("<%=request.getContextPath()%>/main.do/init_audio.do",
	       			function (list,status,xhr){
	       		    var item; 
	       		    $.each(list,function(i,result){ 
	       		     item = "<tr class='deltr'><td>"+result['filename']+"</td><td>"+result['filesize']+"</td><td>"+ 
	       		     "<img src='<%=request.getContextPath() %>/img/download.png' class='picsize' onclick='sub(this)'>"
	       		     +"</td><td>"+
	       		     "<img src='<%=request.getContextPath() %>/img/delete.png' class='picsize' onclick='del(this)'>"
	       		     +"</td></tr>"; 
	       		        $('#tablelist').append(item); 
	       		    
	       	        });
	       });
       }
       
       //音频数据
       function init_bgm(){
    	   $(".deltr").remove();
    	   $.post("<%=request.getContextPath()%>/main.do/init_bgm.do",
	       			function (list,status,xhr){
	       		    var item; 
	       		    $.each(list,function(i,result){ 
	       		     item = "<tr class='deltr'><td>"+result['filename']+"</td><td>"+result['filesize']+"</td><td>"+ 
	       		     "<img src='<%=request.getContextPath() %>/img/download.png' class='picsize' onclick='sub(this)'>"
	       		     +"</td><td>"+
	       		     "<img src='<%=request.getContextPath() %>/img/delete.png' class='picsize' onclick='del(this)'>"
	       		     +"</td></tr>"; 
	       		        $('#tablelist').append(item); 
	       		    
	       	        });
	       });
       }
       
       //其他文件数据
       function init_other(){
    	   $(".deltr").remove();
    	   $.post("<%=request.getContextPath()%>/main.do/init_other.do",
	       			function (list,status,xhr){
	       		    var item; 
	       		    $.each(list,function(i,result){ 
	       		     item = "<tr class='deltr'><td>"+result['filename']+"</td><td>"+result['filesize']+"</td><td>"+ 
	       		     "<img src='<%=request.getContextPath() %>/img/download.png' class='picsize' onclick='sub(this)'>"
	       		     +"</td><td>"+
	       		     "<img src='<%=request.getContextPath() %>/img/delete.png' class='picsize' onclick='del(this)'>"
	       		     +"</td></tr>"; 
	       		        $('#tablelist').append(item); 
	       		    
	       	        });
	       });
       }
       
       
       //数据更新方法
	   function update(){
		   $(".deltr").remove();
		   init();
	   }
	   
       
       //提交表单下载
	   function sub(h){
    	   var a=element(h);
		   $("#subtext").val(a);
		   $("#forsub").submit();
	   }
       
       //提交表单删除
	   function del(h){
		   $.post("<%=request.getContextPath()%>/main.do/del.do",{'filename':element(h)},
	           function(data,status,xrl)
	           {
			        if(data=="删除成功")
			        	{
			        	alert("删除成功！");
				        update();
			        	}
			        
			        else{
			        	alert("删除失败");
			        }
	           }
		   );
	   }
	   
	   //发送当前行文件名
	   function element(h){
		    var hang2= this.getRowObj(h);
		    var hang=getRowNo(hang2);
	        var filename=$("#tablelist").find("tr").eq(hang).find("td").eq(0).text();           
	        return filename;
	  
	   }
	   //获得行元素
	   function getRowObj(obj)
	   {
	   var i = 0;
	   while(obj.tagName.toLowerCase() != "tr"){
	   obj = obj.parentNode;
	   if(obj.tagName.toLowerCase() == "table")return null;
	   }
	   return obj;
	   }
	   //获得当前行数
	   function getRowNo(obj){
		   var trObj = getRowObj(obj);
		   var trArr = trObj.parentNode.children;
		   for(var trNo= 0; trNo < trArr.length; trNo++){
		   if(trObj == trObj.parentNode.children[trNo]){
		     return trNo;
		   }
		   }
		   }
	 //退出登陆并清空session
	   function leave(){
	   		if (confirm("确定退出吗？"))
	   		  {
	   		    $.post("<%=request.getContextPath() %>/main.do/leave.do",
	   		    		
	   		    function(data){
	   		    	if(data=="OK")
	   		    		 window.location.href="login.do";
	   		    	
	   		    });
	           
	   		  }

	   	}

	  
	   
	   
	   </script>
