<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [����ȭ��] </title> 
</head>
<body>
  <form name="myform" action="GuestServlet">
  	<!-- ������� -->
    <input type="hidden"  name="command" value="delete.do">	
	<b><font color=red>������ ��ȣ: </font></b> 
	<input type=text name="sabun"  > 
	<input type="submit"  value="����"> 
  </form>
 <p>
 
 <h1>
 	<a href="GuestServlet?command=list.do">����Ÿ���</a>  
 </h1>

</body>
</html>






