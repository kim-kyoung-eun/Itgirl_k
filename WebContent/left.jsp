<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [left.jsp] </title> 
	<style type="text/css">
	    input{ font-size:10pt; font-weight:bold;}
		td,th{ font-size:10pt; font-weight:bold;}
		a{font-size:10pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:10pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>

<body>
    <form>
      <b>���̵�:</b><input type=text name="user" size="12"><br>
      <b>��й�:</b><input type=password name="pwd" size="10"><br>
      &nbsp;<input type=button  value="�α���">
      &nbsp;<input type=reset  value="�� ��">
    </form>
    
    <p>
	<div>
		<img src="images/ddd.gif"><p>
		<a href="template.jsp?page=main">main��</a><p> 
		<a href="template.jsp?page=guest">���ȭ��</a><p>
		<a href="template.jsp?page=guestList">����Ʈ</a><p>
		<a href="template.jsp?page=guestDelete">����ȭ��</a>
	</div>
	
	<br><br><br><br>
</body>
</html>



