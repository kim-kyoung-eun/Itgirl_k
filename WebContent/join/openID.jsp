<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>[openID.jsp]</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">

<script type="text/javascript">
	  function  send( ){
		  subform.id.value=opener.signin.id.value;
		  subform.id.focus( );
	  }
	</script>
</head>
<body onLoad="send( )">
	<form name="subform" action="openIDSave.jsp">
		<div style="height: 100px; border:1px solid #FF1AB2;"> 
		
		<div style=" position: absolute; top:45px; left:50px;"><b><font color="fff">아이디: </font></b><input type=text name="id">
		<input type="submit" value=" 확 인  "></div>
		</div>
	</form>

</body>
</html>






