<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title align="center"> ��ǰ�ı� </title> 
<style>
@import url('css/common.css');
</style>
</head>

<body>
<div id="Write" align="center" >
<h3>��ǰ ��� �ı� �۾���</h3>
<hr><sup>���� �ı⸦ �ø��� ���в� �������� �帳�ϴ�.</sup><br><p>
	<form name="myform" method="post"  action="GuestServlet2">
      <input type="hidden"  name="command" value="insert2.do">	
<table class="boardlist2">

 <tr>
	<td class="boardlist_td2">�ۼ���</td>
	<td><input type="text" name="name" size="28"></td>
	</tr>
 <tr>
	<td class="boardlist_td2">��й�ȣ</td>
	<td><input type="password" name="pass" size="30"></td>
 </tr>
 <tr>
	<td class="boardlist_td2">����</td>
	<td><input type="text" size="68" name="title"></td>
 </tr>
 <tr>
	<td class="boardlist_td2">����</td>
	<td>
		<c:choose>
		<input type="radio" name="grade" value="1">
						<c:when type="radio"  test="${grade eq '1'}">��</c:when>
		<input type="radio" name="grade" value="2">
						<c:when type="radio"  test="${grade eq '2'}">�ڡ�</c:when>
		<input type="radio" name="grade" value="3">
						<c:when  type="radio" test="${grade eq '3'}">�ڡڡ�</c:when>
		<input type="radio" name="grade" value="4">
		                <c:when  type="radio" test="${grade eq '4'}">�ڡڡڡ�</c:when>
		<input type="radio" name="grade" value="5">
						<c:when  type="radio" test="${grade eq '5'}">�ڡڡڡڡ� </c:when>
</c:choose> 
	</td>
 </tr>
 <tr>
	<td>����</td>
	<td><textarea cols="70" rows="15" name="content"></textarea></td>
 </tr>
</table>

		<input type="submit"   value="����Ÿ����"> &nbsp;
		<input type="reset"  value="�Է����">&nbsp;
		<input type="button"   value="����Ʈ" onclick="location.href='GuestServlet2?command=boardlist2.do'"> &nbsp;
</form>
	
</div>
</body>
</html>






