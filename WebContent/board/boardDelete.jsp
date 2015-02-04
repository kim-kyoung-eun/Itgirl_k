<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [삭제화면] </title> 
</head>
<body>
  <form name="myform" action="GuestServlet">
  	<!-- 보물덩어리 -->
    <input type="hidden"  name="command" value="delete.do">	
	<b><font color=red>삭제할 번호: </font></b> 
	<input type=text name="sabun"  > 
	<input type="submit"  value="삭제"> 
  </form>
 <p>
 
 <h1>
 	<a href="GuestServlet?command=list.do">데이타출력</a>  
 </h1>

</body>
</html>






