<!DOCTYPE html>
<html>
<head>
	<title>My Uploadify Implementation</title>
	<link rel="stylesheet" type="text/css" href="uploadify.css">
	<script type="text/javascript" src="jquery-3.1.1.js"></script>
	<script type="text/javascript" src="jquery.uploadify.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#file_upload').uploadify({
			'swf'      : 'uploadify.swf',
			'uploader' : 'uploadify.php'
			// Your options here
		});
	});
	    function doUpload() {  
            $('#file_upload').uploadify('upload', '*');  
        }  
        //停止上传  
        function closeLoad() {  
            $('#file_upload').uploadify('cancel', '*');  
        }  
	</script>
</head>
<body>
<input type="file" name="file_upload" id="file_upload" />
<input type="button" value="上传" onclick="doUpload()"/>
<input type="button" value="停止" onclick="closeLoad()" />
</body>
</html>