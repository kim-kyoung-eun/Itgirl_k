<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title align="center"> 리뷰리스트 </title> 
<style type="text/css">
	@import url('css/common.css');
</style>
</head>

<body>

<h3>Review List</h3>
<hr><sup>착용 후기를 올리신 모든분께 적립금을 드립니다.</sup><br><p>

<table  class="boardlist" width="70%" >
	<tr >
        <td colspan="6">
        <a href="GuestServlet2?command=board2.do">게시글 등록</a></td>
	</tr>
<tr height='30'  align="center" >
   	<td width="5%" >No</td>
 	<td width="40%" >제목</td>
 	<td width="15%" >작성자</td>
 	<td width="15%" >작성일</td>
 	<td width="15%" >평점</td>
 	<td width="10%">조회수</td>
</tr>
<c:forEach var="bean" items="${naver}">

<tr >
	
	<td>${bean.boardno}</td>
	<td><a href="GuestServlet2?command=boarddetail2.do&dx=${bean.boardno}">${bean.title}</a></td>
	<td>${bean.name}</td>
	<td>${bean.nalja}</td>
	<td>${bean.grade}</td>
	<td></td>


</tr>
</c:forEach>

	
</table>

</body>
</html>






