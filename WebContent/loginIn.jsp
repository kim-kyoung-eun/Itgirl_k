<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String id = "pink";
String pwd = "1234";

if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd"))) {
	session.setAttribute("id", id);
	response.sendRedirect("template.jsp");
} else {
	response.sendRedirect("login.jsp");
}



%>
