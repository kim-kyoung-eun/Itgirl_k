<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [�Խ���] </title> 
<style>
@import url('css/shopping.css');
</style>
</head>

<body>
<div  align="center">
 [�Խ��� �Է�ȭ��] <p>
	<form name="myform"   action="../GuestServlet">
        <!-- ������� -->
        <input type="hidden"  name="command" value="insert.do">	
        <table class="bbs-table-write" width="680px">
		<tr>
			<td width="100px"><b>�̸�:</b></td>
			<td width="580px"><input type=text name="name"  size="50%"></td>
		</tr>
		<tr>
			<td><b>����:</b></td>
			<td><input type=text name="title" value="snow" size="50%"></td>
		</tr>
		<tr>   
			<td><b>��й�ȣ:</b></td>
			<td><input type="password" name="pass" size="55%"></td>
		</tr>
		<tr>   
			<td><b>����:</b></td>
			<td><textarea name="content" col="50" row="30">test contents </textarea></td>
		</tr>

		</table>
		<input type="submit"   value="MVC2����Ÿ����"> &nbsp;
		<input type="reset"  value="�Է����">
		<input type="button"   value="����Ʈ" onclick="javascript:location.href='./template.jsp?page=QA'">
		<!-- <input type="button"   value="����Ʈ" onclick="javascript:location.href='GuestServlet?command=list.do'">  -->
	</form>
</div>
</body>
</html>






