<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [�Խ���] </title> 
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
	<td align="center"><b>[�Խ��� �Է�ȭ��]</b></td>
	</tr>
</table>
<table class="boardlist">
	<tr>
	<td width="15%" class="boardlist_td"><b>�̸�:</b></td>
	<td width="85%"><input type=text name="name"  class="boardarea"></td>
	</tr>
	<tr>
		<td class="boardlist_td"><b>����:</b></td>
		<td><input type=text name="title" value="snow" class="boardarea"></td>
	</tr>
	<tr>   
		<td class="boardlist_td"><b>��й�ȣ:</b></td>
		<td><input type="password" name="pass" class="boardarea"></td>
	</tr>
	<tr>   
		<td class="boardlist_td"><b>����:</b></td>
		<td><textarea name="content" row="30" class="boardarea">test contents </textarea></td>
	</tr>
</table>
<br>
		<input type="submit"   value="����"> &nbsp;
		<input type="reset"  value="�Է����">
		<input type="button"   value="����Ʈ" onclick="javascript:location.href='GuestServlet?command=list.do'">
	</form>
</div>
</body>
</html>






