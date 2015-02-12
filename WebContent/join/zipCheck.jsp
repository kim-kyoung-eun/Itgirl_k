<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>[zipCheck.jsp]</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css">
	<script type="text/javascript">
		function send() {
			subform.zipcode.value=opener.signin.zipcode.value;
			subform.zipcode.focus();
		}
	</script>
</head>
<body bgcolor=pink onload="send()">
  <form method="post" name="subform" action="zipCheckSave.jsp">
    <b><font color=red>우편번호: </font></b>
	  <input type=text name=zipcode>
	  <input type="submit" value="확인">
  </form>
</body>
</html>