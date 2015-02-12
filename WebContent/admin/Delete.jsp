<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head> <title> [Delete.jsp] </title> 
<style>
@import url('./css/common.css');
</style>
	
</head>
<body>
<%
	String data=request.getParameter("idx");
	System.out.println(data);
%>
  <form name="myform" action="Delete.do">
	<b><font color=red>삭제 상품명: </font></b> 
	<input type=text name="goodno" value=<%= data %> > 
	<input type="submit"  value=" 삭제  "> 
  </form>
 <p>
 
 <p><br><br><br><br>
</body>
</html>






