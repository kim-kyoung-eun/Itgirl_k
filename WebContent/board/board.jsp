<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [�Խ���] </title> 

</head>

<body>
 [�Խ��� �Է�ȭ��] <p>
	<form name="myform"   action="GuestServlet">
        <!-- ������� -->
        <input type="hidden"  name="command" value="insert.do">	
		<b>�̸�:</b> <input type=text name="name"> <br>
		<b>����:</b> <input type=text name="title" value="snow"> <br>   
		<b>����:</b> <textarea name="content" >test contents </textarea> <p>
		
		<input type="submit"   value="MVC2����Ÿ����"> &nbsp;
		<input type="reset"  value="�Է����">
		<input type="button"   value="����Ʈ" onclick="javascript:location.href='GuestServlet?command=list.do'"> &nbsp;
	</form>

</body>
</html>






