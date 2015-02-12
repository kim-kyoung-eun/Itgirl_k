<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [AdminMemberDetail] </title> 


<style>
@import url('./css/common.css');
</style>

	
</head>

 <body>
<table class="boardlist" width="100%" >
  <tr height='50'>
 	<td colspan=15 align="center" class="title" >
 	<img src="../images/rnew.gif"></td>
 </tr>
 
 <form method="post" action="BoardServlet">
 <tr class="title" >
 	<td>아이디</td><td>패스워드</td><td>이름</td><td>성별</td><td>생년월일</td><td>주소</td><td>이메일</td><td>전화번호</td><td>Admin</td>
 </tr>

	<tr  class="tr">
		<td>${bean.id}</td>
		<td>${bean.pw}</td>
		<td>${bean.name}</td>
		<td>${bean.gender}</td>
		<td>${bean.birth}</td>
		<td>${bean.addr}</td>
		<td>${bean.email}</td>
		<td>${bean.phone}</td>
		<td>
			<input type="checkbox" name="admin"  <c:if test="${bean.admin == '1'}"><c:out value= "checked"/></c:if>>
		</td>	
	</tr>
	<tr  class="tr" align="right">

	
		<td colspan=9>
			<input type="hidden" name="id" value="${bean.id}">
			<input type="hidden" name="command" value="AdminMemberEdit">
			<input type="submit" value="수정">
		</td>
	</form>

</table>


</body>
</html>






