<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<title>[top.jsp]</title>
<style>
@import url('css/shopping.css');
</style>
</head>

<body>
	<div id="header">
		<div class="header3"
			style="background-color: #EBEBEB; color: #353535; width: 1800px; height: 30px;">
			<div class="header3-1">
			<%
			if(session.getAttribute("id")==null || session.getAttribute("id")=="" ) {
			%>
			<a href="template.jsp?page=login">LOGIN</a>
			<%
			} else {
			%>
			<%=session.getAttribute("id") %>�� �ȳ��ϼ���!<br>
			    <form method="post" action="../login/logOut.jsp">
			    <input type="submit" value="�α׾ƿ�">
			    </form>
			<% } %>	
				|<a
					href="template.jsp?page=join">JOIN</a>|<a href="#">CART</a> |<a
					href="#">ORDER</a>|<a href="#">MYPAGE</a>
			</div>
		</div>
		<div class="happy">
			<img src="../images/top_13.jpg">
		</div>
		<div class="header2">
			<img src="../images/logo.png">
		</div>

		<div class="header4">
			<a href="#"> NEW </a> <a href="#"> TOP </a> <a href="#"> OUTER </a> <a
				href="#"> PANTS </a> <a href="#"> SHOES </a> <a href="#"> Q&A </a>
				<a href="template.jsp?page=member"> MEMBER </a>
 <!-- MEMBER�� admin���� �α����������� ���� -->
		</div>
		<img class="hr" src="../images/hr.png">
	</div>





</body>
</html>



