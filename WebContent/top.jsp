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
		<a href="template.jsp?pageFile=main">메인| </a>
		<a href="template.jsp?pageFile=boardList">방명록| </a>


	<%
		if(session.getAttribute("id")==null || session.getAttribute("id")=="" ) {
		%>
		<a href="template.jsp?pageFile=login">로그인|</a>
		<%
		} else {
		%>
		<%=session.getAttribute("id") %>님 안녕하세요!<br>
		    <form method="post" action="login/logOut.jsp">
		    <input type="submit" value="로그아웃">
		    </form>
		<% } %>	
		
</body>
</html>




