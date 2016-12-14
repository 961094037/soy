<!DOCTYPE html>
<html>
<head>
	<title>My Uploadify Implementation</title>
	<link rel="stylesheet" type="text/css" href="uploadify/uploadify.css">
	<script type="text/javascript" src="uploadify/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript">
	$(function() {
			$('#file_upload').uploadify({
				//是否自动上传 true or false
		        'auto':false,
		        
		      //超时时间上传成功后，将等待服务器的响应时间。
		        //在此时间后，若服务器未响应，则默认为成功(因为已经上传,等待服务器的响应) 单位：秒
		        'successTimeout':99999,
			   
		      //附带值 JSON对象数据，将与每个文件一起发送至服务器端。
		        //如果为动态值，请在onUploadStart()中使用settings()方法更改该JSON值
	  //     'formData':{       //可以不写
		//    	   'user.username':'',
		//    	   'user.age':''
		//    	   },  
		//    	    'onUploadStart': function(file) { 
		//    	    	var name=$('#username').val();
	//	    	    	var age=$('#age').val();
		//    	    	$("#file_upload").uploadify(
	//	    	    	"settings", 
	//	    	    	"formData", 
	//	    	    	{'user.username':name,'user.age':age});
	//	    	    	}, 
		    	
		    	//flash
		    	'swf': "${pageContext.request.contextPath}/uplodify/uploadify.swf",
		    	
		    	//文件选择后的容器div的id值 
		        'queueID':'uploadfileQueue',
		        
		      //将要上传的文件对象的名称 必须与后台controller中抓取的文件名保持一致    
		        'fileObjName':'pic',
		    	
			});
		});
		    function doUpload() {  
	            $('#file_upload').uploadify('upload', '*');  
	        }  
	        //Ã¥ÂÂÃ¦Â­Â¢Ã¤Â¸ÂÃ¤Â¼Â   
	        function closeLoad() {  
	            $('#file_upload').uploadify('cancel', '*');  
	        }
	        
	        
	        
	        
	</script>
</head>
<body>
<input type="file" name="file_upload" id="file_upload" />
<div id="uploadfileQueue"></div>
<input type="button" value="Ã¤Â¸ÂÃ¤Â¼Â " onclick="doUpload()"/>
<input type="button" value="Ã¥ÂÂÃ¦Â­Â¢" onclick="closeLoad()" />
</body>
</html>