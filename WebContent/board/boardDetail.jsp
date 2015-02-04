<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [수정화면] </title> 
</head>
 <font size=7 color=blue>
 <b> 
  &nbsp;&nbsp;&nbsp;[수정화면] 
 </b></font><br>
 
 <table width='800'  border='1'>
 <tr bgcolor="yellow"  height='60'  align="center">
 	<td>사번</td>     <td>이름</td>   
 	<td>제목</td>     <td>날짜</td>   <td>급여</td>      
 </tr> 
 <tr height='60'>
 	<td> ${bean.boardno} </td>
 	<td> ${bean.name} </td>
 	<td> ${bean.title} </td>
 	<td> <fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/> </td>
 	<td> ${bean.content } </td>
 </tr> 	
</table>

<p>
 <h1>
    &nbsp;&nbsp;&nbsp;
 	<a href="GuestServlet?command=board.do"">[데이타입력]</a> &nbsp;
 	<a href="GuestServlet?command=boardDel.do">[삭제]</a> &nbsp;
 	<a href="GuestServlet?command=editPre.do&idx=${bean.boardno}">[수정]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">[데이타출력]</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






