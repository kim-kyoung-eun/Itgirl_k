<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title align="center"> detail page </title> 
<style>
@import url('css/shopping.css');
</style>
</head>

<body>
<form name="myform" method="post"  action="GuestServlet2">
      <input type="hidden"  name="command" value="boarddetail2.do">	

<h3>detail page</h3>

<table width="80%" border='1' align="center">


 <tr>
 	<td width="15%" align="center" height='40'>No</td>
 	<td width="35%" align="center" > ${bean.boardno} </td>
 	<td width="15%" align="center" height='40'>평점</td>
 	<td width="35%" align="center">
 		<input type="text"   value="${bean.grade}">
 	 </td>
 </tr>
 <tr>	
 	<td width="15%" align="center" height='40'>작성자</td> 
 	<td width="35%" align="center"> ${bean.name} </td>
 	<td width="15%" align="center" height='40'>작성일</td>
 	<td width="35%" align="center"> <fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/> </td>
 </tr>
 
 <tr >	
 	<td width="15%" align="center" height='40' >제목</td>
 	<td width="85%" colspan="5" align="center">
 	<input type="text"   size="35%" value="${bean.title}"> 
     </td>
 </tr>
 
 <tr > 	
 	<td align="center" height='150' >내용</td>
 	<td colspan="3" align="center">
 	<textarea cols="70%" rows="12"  value="${bean.content}"></textarea>
 	</td>
 </tr>

<tr > 	
 	<td colspan="4" align="center" height='40' border='0' >
 	<input type="submit"   value="수정확인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<input type="reset"   value="취소하기">
 	</td>
 	
 </tr>
 
</table>

</form>
</body>
</html>






