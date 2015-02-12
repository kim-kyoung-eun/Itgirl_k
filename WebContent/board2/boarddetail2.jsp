<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title align="center"> detail page </title> 
<style>
  @import url('css/common.css');
</style>
</head>

<body>

<h3>Detail Page</h3>
<table class="boardlist">

 <tr><td colspan="4">&nbsp;</td>
 </tr>
 <tr>
 	<td width="10%" align="center" height='40'>No</td>
 	<td width="30%" align="center"> ${bean.boardno} </td>
 	<td width="10%" align="center" height='40'>����</td>
 	<td width="30%" align="center"> ${bean.grade} </td>
 </tr>
 <tr>	
 	<td width="10%" align="center" height='40'>�ۼ���</td> 
 	<td width="30%" align="center"> ${bean.name} </td>
 	<td width="10%" align="center" height='40'>�ۼ���</td>
 	<td width="30%" align="center"> <fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/> </td>
 </tr>
 
 <tr >	
 	<td width="10%" align="center" height='40' >����</td>
 	<td width="70%" colspan="3" align="center"> ${bean.title} </td>
 </tr>
 
 <tr > 	
 	<td width="10%" align="center" height='150' >����</td>
 	<td width="70%" colspan="3" align="center"> ${bean.content} </td>
 </tr>

<tr > 	
 	<td colspan="4" align="center" height='40' border='0' >
 	<input type="button"   value="�����ϱ�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<input type="button"   value="�����ϱ�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<input type="button"   value="���ư���" onclick="javascript:location.href='GuestServlet2?command=boardlist2.do'">
 	</td>
 	
 </tr>
 
</table>


</body>
</html>






