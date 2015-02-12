<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.board.*"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> 게시판 </title> 
<style type="text/css">
	@import url('css/common.css');
</style>
</head>


<div class="header4" align="center" width="70%" ><font color="#2D2B2B">Q&A</font> 
</div>
<table class="boardlist" width="70%" >
 <tr align="center"  class="boardlist_td">
 	<td width="10%" class="boardlist_td">번호</td>     <td width="10%" class="boardlist_td">이름</td>   
 	<td width="30%" class="boardlist_td">제목</td>     <td widtg="40%"class="boardlist_td">내용</td>   <td width="10%" class="boardlist_td">조회수</td>      
 </tr>

	
	<c:forEach var="bean" items="${board}">
		<tr>
			<td><a href="GuestServlet?command=detail.do&idx=${bean.boardno}">${bean.boardno}</a></td>
			<td>${bean.name}</td>
			<td>${bean.title}</td>
			<td>${bean.content}</td>
			<td>${bean.boardcount}</td>
    </tr> 
	</c:forEach>
<tr>
</table>	


<c:if test="${pb.startpage-10>0}">
	<a href="GuestServlet?command=QA&pageNUM=${pb.startpage-10}&keyfield=${pb.skey}&keyword=${pb.sval}">[prev]</a>
</c:if>


 <c:forEach var="i" begin="${pb.startpage}" end="${pb.endpage}">
 	<c:if test="${i<=pb.pagecount}">
  		<a href="GuestServlet?command=QA&pageNUM=${i}&keyfield=${pb.skey}&keyword=${pb.sval}">[ 
   			<font color="#000000"> 
   			<c:if test="${pb.pageNUM == i}"></c:if> ${i} </font>] </a>
   		</c:if>
 </c:forEach>
 

<c:if test="${pb.startpage+10<pb.pagecount}">
	<a href="GuestServlet?command=QA&pageNUM=${pb.startpage+10}&keyfield=${pb.skey}&keyword=${pb.sval}">[next]</a>
</c:if>


	<form method="post" action="GuestServlet">
		<input type="hidden" name="command" value="QA">
		<select name="keyfield">
					<option value="content" selected>상품이름</option>
				</select>
				&nbsp;
					<input type="text" name="keyword" value="">
					<input type="submit" value="검  색">		
	</form>



</body>
</html>






