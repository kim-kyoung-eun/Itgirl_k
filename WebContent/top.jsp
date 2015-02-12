<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>[top.jsp]</title>
<link rel="stylesheet" type="text/css" href="./css/shopping.css">
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
			|<a
					href="template.jsp?page=join">JOIN</a>
			|<a href="#">CART</a> |<a
					href="#">ORDER</a>|<a href="template.jsp?page=mypage">MYPAGE</a>
			<%
			} else { //회원이면
				
				if(session.getAttribute("admin").equals("1")) {out.print("관리자"); //관리자이면
			%>
				<a href="./login/logOut.jsp">LOGOUT</a>|<a href="admin/Admin.jsp">관리자페이지</a>
			<%
				
				} else {out.print(session.getAttribute("id"));
			%>
			<a href="login/logOut.jsp">LOGOUT</a>
			|<a href="#">CART</a> |<a
					href="#">ORDER</a>|<a href="template.jsp?page=mypage">MYPAGE</a>
			   
			<%} 
			} %>	
				
			</div>
		</div>
		<div class="happy">
			<img src="images/top_13.jpg">
		</div>
		<div class="header2">
			<a href="./template.jsp"><img src="images/logo.png"></a>
		</div>

		<div class="header4">
			<a href="#"> NEW </a> <a href="#"> TOP </a> <a href="#"> OUTER </a> <a
				href="#"> PANTS </a> <a href="#"> SHOES </a> <a href="./GuestServlet?command=list.do"> Q&A </a>
		</div>
		<img class="hr" src="images/hr.png">
	</div>





</body>
</html>



