<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [twoDelete.jsp] </title> 
	<style type="text/css">
	 	b,input{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:10pt; font-weight:bold;}
		a{font-size:20pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:24pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<body>
  <form name="myform" action="GuestServlet">
  	<!-- ������� -->
    <input type="hidden"  name="command" value="delete.do">	
	<b><font color=red>�����һ��: </font></b> 
	<input type=text name="sabun"  > 
	<input type="submit"  value=" MVC2����  "> 
  </form>
 <p>
<!--  
 <h1>
 	<a href="Board.jsp">����Ÿ�Է�</a> &nbsp;
 	<a href="BoardDelete.jsp">����Ÿ����</a> &nbsp;
 	<a href="GuestServlet?command=list.do">����Ÿ���</a>  
 </h1>
  -->
 <p><br><br><br><br>
</body>
</html>






