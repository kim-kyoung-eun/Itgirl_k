<%@page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<!DOCTYPE html>
<html>
<title>login Ȯ���ϱ�</title>
</head>
<body>
���Ǿ��̵�
<%
String ids=(String)session.getAttribute("id"); 
out.println(ids);
%>
</body>
</html>