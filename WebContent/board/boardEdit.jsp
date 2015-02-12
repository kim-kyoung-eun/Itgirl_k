<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title>게시판 수정 </title> 
<style>
@import url('css/common.css');
</style>
</head>
<body>
<form method="get" action="GuestServlet">
<input type="hidden"  name="command" value="edit.do">	
   
<table class="boardlist">
	<tr>
		<td align="center"><b>[게시판 수정화면]</b></td>
	</tr>
</table>
<table class="boardlist">
	<tr>
		<td width="15%" class="boardlist_td"><b>수정번호:</b></td>
 		<td><input type=text  name="boardno" value="${daum.boardno}" readonly></td>
	<tr>
		<td width="15%" class="boardlist_td"><b>수정이름:</b></td>
 	 	<td><input type=text  name="name" value="${daum.name}"></td>
 	</tr>
 	<tr>
 		<td width="15%" class="boardlist_td"><b>수정제목:</b></td> 
 		<td><input type=text  name="title" value="${daum.title}"></td>
 	</tr>
 	<tr>
 		<td width="15%" class="boardlist_td"><b>수정내용:</b></td>
 		<td><textarea name="content" row="30" class="boardarea">${daum.content} </textarea></td>
 	</tr>
 	</table>
	<br>
	
	<div align="center">
		<input type="submit"  value="수정하기">
		<input type="reset" value="수정취소">	
		<input type="button"   value="삭제" onclick="javascript:location.href='GuestServlet?command=delete.do&boardno=${daum.boardno}'">
		<input type="button"   value="리스트" onclick="javascript:location.href='GuestServlet?command=list.do'">
	</div>
</form>
</body>
</html>






