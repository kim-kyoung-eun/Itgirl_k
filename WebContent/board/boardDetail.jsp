<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [����ȭ��] </title> 
<style type="text/css">
	@import url('css/common.css');
</style>
</head>
 <font size=3 color=blue>
 <div align="center">

 
<table class="boardlist" width="70%" >
 <tr><td colspan="5"><b>[�󼼺���]</b></td></tr>
 <tr height='25' align="center">
 	<td class="boardlist_td" width="10%">��ȣ</td>
 	<td class="boardlist_td" width="20%">�̸�</td>   
 	<td class="boardlist_td" width="20%">����</td>
 	<td class="boardlist_td" width="40%">����</td>
 	<td class="boardlist_td" width="10%">��¥</td>        
 </tr> 
 <tr height='60'>
 	<td align="center"> ${bean.boardno} </td>
 	<td align="center"> ${bean.name} </td>
 	<td align="center"> ${bean.title} </td>
 	<td align="center"> ${bean.content } </td>
 	<td align="center"> <fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/> </td>
 </tr> 	
 </table><br>
<div align="center">
    <b> <a href="GuestServlet?command=board.do">[Q&A]���</a>
 		<a href="GuestServlet?command=editPre.do&idx=${bean.boardno}">[�󼼼���]</a> &nbsp;
 		<a href="GuestServlet?command=list.do">[Q&A]</a>
 	</b>
</div>


<p>
 <h1>
    &nbsp;&nbsp;&nbsp;

 </h1>
 <p>
  <!--  ��� �ޱ� ����  -->
 <hr color="#1F50B5"><p>
    <jsp:include page="boardReply.jsp" flush="false">
       <jsp:param value="${bean.boardno}" name="boardno"/>
       <jsp:param value="${bean.name}" name="Gname"/>
       <jsp:param value="${bean.title}" name="Gtitle"/>
    </jsp:include>
</div>
</body>
</html>






