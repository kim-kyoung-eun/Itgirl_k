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
	alert("�α׾ƿ� �Ǿ����ϴ�");
	location.href="../main/template.jsp";
</script>
</body>
</html>