<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<title>[zipCheck.jsp]</title>
<style type="text/css">
input, b {
	font-size: 14pt;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	  function  send( ){
		subform.zipcode.value=opener.myform.zipcode.value;
		subform.zipcode.focus( );
	  }
	</script>
</head>
<body bgcolor=yellow onLoad="send( )">
	<form name="subform" action="zipCheckSave.jsp">
		<b><font color=red>우편번호: </font></b> <input type=text name="zipcode">
		<input type="submit" value=" 확 인  ">
	</form>

</body>
</html>






