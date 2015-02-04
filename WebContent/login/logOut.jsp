<%@page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<!DOCTYPE html>
<html>
<title>logout </title>
</head>
<body>
<%
session.invalidate();
%>
<script>
	alert("로그아웃 되었습니다");
	location.href="../main/template.jsp";
</script>
</body>
</html>