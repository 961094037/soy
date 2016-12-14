
<html>

<script type="text/javascript" src="js/jquery-3.1.1.js"></script>









<head>
<meta charset="utf-8">
<title>text</title>
</head>

<body>
<form action="<%=request.getContextPath() %>/index.do/insert.do" method="post">
<input name="username" type="text" value="123" >
<input name="password" type="text" value="123" >
<input type="submit" value="提交">
</form>
<input id="66" type="button" value="text">
</body>


<script>
  var a=2;
  $("#66").click(function(){
	  $("input[name='username']").val(666);
	  a+=a;
	  alert(a);
  });


</script>


</html>

