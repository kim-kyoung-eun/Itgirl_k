<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.admin.DBbean"   %>
<%@ page import="net.hb.admin.PageBean"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [List] </title> 

<style>
@import url('./css/common.css');
</style>
	
</head>

<table class="boardlist" width="100%" >
 <tr>
 	<td colspan=15 align="center">
 	<img src="../images/rnew.gif"></td>
 </tr>
 <tr align="center" >
 	<td class="boardlist_td">상품번호</td><td class="boardlist_td">상품명</td><td class="boardlist_td">원가</td>
 	<td class="boardlist_td">단가</td><td class="boardlist_td">적립금</td><td class="boardlist_td">수량</td>
 	<td class="boardlist_td">색상</td><td class="boardlist_td">사이즈</td><td class="boardlist_td">분류코드</td>
 	<td class="boardlist_td">파일 1</td><td class="boardlist_td">파일 2</td><td class="boardlist_td">파일 3</td>
 	<td class="boardlist_td">파일 4</td><td class="boardlist_td">파일 5</td><td class="boardlist_td">상세설명</td>
 	      
 </tr>

	
	<c:forEach var="bean" items="${good}">
		<tr 
			onMouseOver="style.backgroundColor='#00FFFF'"
			onMouseOut="style.backgroundColor=''"
		>
			<td><a href="BoardServlet?command=Detail&idx=${bean.goodno}">${bean.goodno}</a></td>
			<td>${bean.goodname}</td>
			<td>${bean.margin}</td>
			<td>${bean.unit}</td>
			<td>${bean.point}</td>
			<td>${bean.ea}</td>
			<td>${bean.goodcolor}</td>
			<td>${bean.goodsize}</td>
			<td>${bean.goodtype}</td>
			<td><img src="${bean.pictureurl1}" width=50 height=50 border="0"></td>
			<td><img src="${bean.pictureurl2}" width=50 height=50 border="0"></td>
			<td><img src="${bean.pictureurl3}" width=50 height=50 border="0"></td>
			<td><img src="${bean.pictureurl4}" width=50 height=50 border="0"></td>
			<td><img src="${bean.pictureurl5}" width=50 height=50 border="0"></td>
			<td>${bean.description}</td>
		</tr>
	</c:forEach>
<tr class="tr">
	<td colspan=15 align="center">
	



<c:if test="${pb.startpage-10>0}">
	<a href="BoardServlet?command=List&pageNUM=${pb.startpage-10}&keyfield=${pb.skey}&keyword=${pb.sval}">[prev]</a>
</c:if>


 <c:forEach var="i" begin="${pb.startpage}" end="${pb.endpage}">
 	<c:if test="${i<=pb.pagecount}">
  		<a href="BoardServlet?command=List&pageNUM=${i}&keyfield=${pb.skey}&keyword=${pb.sval}">[ 
   			<font color="#000000"> 
   			<c:if test="${pb.pageNUM == i}"></c:if> ${i} </font>] </a>
   		</c:if>
 </c:forEach>
 

<c:if test="${pb.startpage+10<pb.pagecount}">
	<a href="BoardServlet?command=List&pageNUM=${pb.startpage+10}&keyfield=${pb.skey}&keyword=${pb.sval}">[next]</a>
</c:if>


	</td>
</tr>	
	

<br><br>

	<form method="post" action="BoardServlet">
		<input type="hidden" name="command" value="List">
		<tr class="tr" align="center">
			<td colspan=15>검  색
				<select name="keyfield">
					<option value="goodname" selected>상품이름</option>
				</select>
				&nbsp;
					<input type="text" name="keyword" value="">
					<input type="submit" value="검  색">
			</td>			
	</form>
</table>

</body>
</html>






