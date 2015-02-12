<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>[memberEdit.jsp]</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css">
</head>
<body>

<%
	String data1 = request.getParameter("id");
	String data2=request.getParameter("pw");
 	String data3=request.getParameter("name");
 	String data4=request.getParameter("email");
%>
<form action="../member/memberEditSave.jsp" name="myform">
	<b>ID</b> &nbsp; <input type=text name="id" value="<%=data1 %>" readonly><br>
	<b>PW</b> &nbsp; <input type=text name="pw" value="<%=data2 %>"><br>
	<b>NAME</b> &nbsp; <input type=text name="name" value="<%=data3 %>" readonly><br>
	<b>EMAIL</b> &nbsp; <input type=text name="email" value="<%=data4 %>"><br>
	<input type="submit" value="데이타수정"> &nbsp;
	<input type="reset" value="입력취소">
</form>
<p>
<h1>
	<a href="template.jsp?page=join">데이타입력</a> &nbsp;
	<a href="template.jsp?page=memberDelete">데이타삭제</a> &nbsp;
	<a href="template.jsp?page=member">데이타출력</a> &nbsp;
</h1>
</p>
</body>
</html>