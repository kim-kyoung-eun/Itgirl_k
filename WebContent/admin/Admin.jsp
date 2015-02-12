<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.admin.DBbean"   %>
<%@ page import="net.hb.admin.PageBean"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [Main] </title> 
<style>
@import url('css/common.css');
</style>
</head>
<body>
<table id="adminlist"> 
 <tr><td>
<a href="../BoardServlet?command=List">상품 리스트</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="../BoardServlet?command=AdminMemberList">멤버 리스트</a>
</td></tr>
</table>

</body>
</html>






