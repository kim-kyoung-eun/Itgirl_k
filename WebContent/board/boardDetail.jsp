<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [����ȭ��] </title> 
</head>
 <font size=7 color=blue>
 <b> 
  &nbsp;&nbsp;&nbsp;[����ȭ��] 
 </b></font><br>
 
 <table width='800'  border='1'>
 <tr bgcolor="yellow"  height='60'  align="center">
 	<td>���</td>     <td>�̸�</td>   
 	<td>����</td>     <td>��¥</td>   <td>�޿�</td>      
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
 	<a href="GuestServlet?command=board.do"">[����Ÿ�Է�]</a> &nbsp;
 	<a href="GuestServlet?command=boardDel.do">[����]</a> &nbsp;
 	<a href="GuestServlet?command=editPre.do&idx=${bean.boardno}">[����]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">[����Ÿ���]</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






