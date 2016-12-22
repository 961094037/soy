<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@page import="soy.maven.disk.pojo.File"%>
    <%@page import="java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>My Uploadify Implementation</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/uploadify/uploadify.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/uploadify/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#file_upload').uploadify({
			'swf'      : 'uploadify/uploadify.swf',
			'uploader' : '<%=request.getContextPath()%>/main.do/uploadfile.do',
			
			
			//上传数据
	//		'formData'  : {'filesize':6666},
			
			
			//是否自动上传 true or false
	//	    'auto':false
			
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
	        'fileSizeLimit':'20MB',
       
       //允许上传的文件的最大数量。当达到或超过这个数字，onSelectError事件被触发。
	        'queueSizeLimit' : 3,
	        
	        
	        //上传到服务器，服务器返回相应信息到data里
	        'onUploadSuccess':function(file, data, response){
	            alert("上传成功");
	        },

	      //当单个文件上传出错时触发
	        'onUploadError': function (file, errorCode, errorMsg, errorString) { 
	        	alert("上传失败");
	        	} 
           
		});
	});
	    function doUpload() {  
            $('#file_upload').uploadify('upload', '*');  
        }  
        //åæ­¢ä¸ä¼   
        function closeLoad() {  
            $('#file_upload').uploadify('cancel', '*');  
        }  	
        
	</script>
</head>
<body>
<form action="<%=request.getContextPath()%>/main.do/donwload.do" id="forsub" method="post">
<input  type="text" name="filename" id="filename"    />
</form>
<input type="file" name="file_upload" id="file_upload" value="666"/>
 <div id="uploadfileQueue"></div> 
<input type="button" value="上传" onclick="doUpload()"/>
<input type="button" value="取消" onclick="closeLoad()" />
<input type="text" value="取消" onBlur="oo()">

<table id="tabletest">
       <tr><th>名字</th><th>说明</th><th>图片预览</th></tr>
        
     </table>

	   <script>
	   function oo(){
       	$.post("<%=request.getContextPath()%>/66upload.do",
       			function (list,status,xhr){
       		    var item; 
       		    $.each(list,function(i,result){ 
       		  
       		     item = "<tr><td>"+result['filename']+"</td><td>"+result['filesize']+"</td><td>"+"<input type='button' onclick='sub(this)'>"+"</td></tr>"; 
       		        $('#tabletest').append(item); 
       		 
       	        });
       });
	   }
	   
	   function sub(h){
		   $("#filename").val(
				element(h)   
		   );
		   $("#forsub").submit();
	   }
	   
	   //发送当前行文件名
	   function element(h){
		    var hang2= this.getRowObj(h);
		    var hang=getRowNo(hang2);
	        alert (hang);
	        var filename=$("#tabletest").find("tr").eq(hang).find("td").eq(0).text();		
            
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
	   </script>

 
</body>
</html>