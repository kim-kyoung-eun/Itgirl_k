<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.admin.DBbean"   %>
<%@ page import="net.hb.admin.PageBean"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="UTF-8"> 
<title> [AdminMemberList] </title> 
<style>
@import url('./css/common.css');
</style>
</head>

<table class="boardlist" width="100%" >
 <tr height='50'>
 	<td colspan=15 align="center">
 	<img src="images/rnew.gif"></td>
 </tr>
 <tr height='50'align="center">
 	<td class="td1" >아이디</td><td>패스워드</td><td>이름</td><td>성별</td><td>생년월일</td><td>주소</td><td>이메일</td><td>전화번호</td><td>Admin</td>
 	
 	      
 </tr>

	<c:forEach var="bean" items="${good}">
		<tr class="tr"
			onMouseOver="style.backgroundColor='#00FFFF'"
			onMouseOut="style.backgroundColor=''"
		>
			
			<td><a href="BoardServlet?command=AdminMemberDetail&idx=${bean.id}">${bean.id}</td>
			<td>${bean.pw}</td>
			<td>${bean.name}</td>
			<td>${bean.gender}</td>
			<td>${bean.birth}</td>
			<td>${bean.addr}</td>
			<td>${bean.email}</td>
			<td>${bean.phone}</td>
			<td>${bean.admin}</td>
						
		</tr>
	</c:forEach>
<tr class="tr">
	<td colspan=15 align="center">
	



<c:if test="${pb.startpage-10>0}">
	<a href="BoardServlet?command=AdminMemberList&pageNUM=${pb.startpage-10}&keyfield=${pb.skey}&keyword=${pb.sval}">[prev]</a>
</c:if>


 <c:forEach var="i" begin="${pb.startpage}" end="${pb.endpage}">
 	<c:if test="${i<=pb.pagecount}">
  		<a href="BoardServlet?command=AdminMemberList&pageNUM=${i}&keyfield=${pb.skey}&keyword=${pb.sval}">[ 
   			<font color="#000000"> 
   			<c:if test="${pb.pageNUM == i}"></c:if> ${i} </font>] </a>
   		</c:if>
 </c:forEach>
 

<c:if test="${pb.startpage+10<pb.pagecount}">
	<a href="BoardServlet?command=AdminMemberList&pageNUM=${pb.startpage+10}&keyfield=${pb.skey}&keyword=${pb.sval}">[next]</a>
</c:if>


	</td>
</tr>	
	

<br><br>

	<form method="post" action="BoardServlet">
		<input type="hidden" name="command" value="AdminMemberList">
		<tr class="tr" align="center">
			<td colspan=15>검  색
				<select name="keyfield">
					<option value="id" selected>아이디</option>
					<option value="name" selected>이름</option>
				</select>
				&nbsp;
					<input type="text" name="keyword" value="">
					<input type="submit" value="검  색">
			</td>			
	</form>
</table>

</body>
</html>






