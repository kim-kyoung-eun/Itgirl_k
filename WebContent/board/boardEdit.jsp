<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title>�Խ��� ���� </title> 
<style>
@import url('css/common.css');
</style>
</head>
<body>
<form method="get" action="GuestServlet">
<input type="hidden"  name="command" value="edit.do">	
   
<table class="boardlist">
	<tr>
		<td align="center"><b>[�Խ��� ����ȭ��]</b></td>
	</tr>
</table>
<table class="boardlist">
	<tr>
		<td width="15%" class="boardlist_td"><b>������ȣ:</b></td>
 		<td><input type=text  name="boardno" value="${daum.boardno}" readonly></td>
	<tr>
		<td width="15%" class="boardlist_td"><b>�����̸�:</b></td>
 	 	<td><input type=text  name="name" value="${daum.name}"></td>
 	</tr>
 	<tr>
 		<td width="15%" class="boardlist_td"><b>��������:</b></td> 
 		<td><input type=text  name="title" value="${daum.title}"></td>
 	</tr>
 	<tr>
 		<td width="15%" class="boardlist_td"><b>��������:</b></td>
 		<td><textarea name="content" row="30" class="boardarea">${daum.content} </textarea></td>
 	</tr>
 	</table>
	<br>
	
	<div align="center">
		<input type="submit"  value="�����ϱ�">
		<input type="reset" value="�������">	
		<input type="button"   value="����" onclick="javascript:location.href='GuestServlet?command=delete.do&boardno=${daum.boardno}'">
		<input type="button"   value="����Ʈ" onclick="javascript:location.href='GuestServlet?command=list.do'">
	</div>
</form>
</body>
</html>






