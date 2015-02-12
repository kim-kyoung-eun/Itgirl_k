<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [게시판] </title> 
<style>
  @import url('css/common.css');
</style>
</head>

<body>
<div  align="center">
<form name="myform"   action="GuestServlet">
<input type="hidden"  name="command" value="insert.do">	
<table class="boardlist">
	<tr>
	<td align="center"><b>[게시판 입력화면]</b></td>
	</tr>
</table>
<table class="boardlist">
	<tr>
	<td width="15%" class="boardlist_td"><b>이름:</b></td>
	<td width="85%"><input type=text name="name"  class="boardarea"></td>
	</tr>
	<tr>
		<td class="boardlist_td"><b>제목:</b></td>
		<td><input type=text name="title" value="snow" class="boardarea"></td>
	</tr>
	<tr>   
		<td class="boardlist_td"><b>비밀번호:</b></td>
		<td><input type="password" name="pass" class="boardarea"></td>
	</tr>
	<tr>   
		<td class="boardlist_td"><b>내용:</b></td>
		<td><textarea name="content" row="30" class="boardarea">test contents </textarea></td>
	</tr>
</table>
<br>
		<input type="submit"   value="저장"> &nbsp;
		<input type="reset"  value="입력취소">
		<input type="button"   value="리스트" onclick="javascript:location.href='GuestServlet?command=list.do'">
	</form>
</div>
</body>
</html>






