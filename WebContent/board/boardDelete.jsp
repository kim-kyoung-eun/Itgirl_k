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
  	<!-- 보물덩어리 -->
    <input type="hidden"  name="command" value="delete.do">	
	<b><font color=red>삭제할사번: </font></b> 
	<input type=text name="sabun"  > 
	<input type="submit"  value=" MVC2삭제  "> 
  </form>
 <p>
<!--  
 <h1>
 	<a href="Board.jsp">데이타입력</a> &nbsp;
 	<a href="BoardDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="GuestServlet?command=list.do">데이타출력</a>  
 </h1>
  -->
 <p><br><br><br><br>
</body>
</html>






