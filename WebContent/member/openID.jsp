<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<title>[openID.jsp]</title>
<style type="text/css">
input, b {
	font-size: 14pt;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	  function  send( ){
		  myform.id.value=opener.myform.id.value;
		  myform.id.focus( );
	  }
	</script>
</head>
<body onLoad="send( )">
	<form name="myform" action="openIDSave.jsp">
		<b><font color=red>���̵�: </font></b> <input type=text name="id">
		<input type="submit" value=" Ȯ ��  ">
	</form>

</body>
</html>






