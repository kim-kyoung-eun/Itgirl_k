<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [top.jsp] </title>
<style>
@import url('css/shopping.css');
</style>	 
</head>

<body>

<div align="right">
		<img src="images/logo.gif" height="70" width=900 ><p>
		<a href="template.jsp?pageFile=main">����| </a>
		<a href="template.jsp?pageFile=boardList">����| </a>


	<%
		if(session.getAttribute("id")==null || session.getAttribute("id")=="" ) {
		%>
		<a href="template.jsp?pageFile=login">�α���|</a>
		<%
		} else {
		%>
		<%=session.getAttribute("id") %>�� �ȳ��ϼ���!<br>
		    <form method="post" action="login/logOut.jsp">
		    <input type="submit" value="�α׾ƿ�">
		    </form>
		<% } %>	
		
</body>
</html>




