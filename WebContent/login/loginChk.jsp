<%@page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<!DOCTYPE html>
<html>
<title>login 확인하기</title>
</head>
<body>

<%
//String ids=(String)session.getAttribute("id"); 
//out.println(ids);
%>

<script>
	alert("아이디 또는 비밀번호를 다시 입력해주세요");
	location.href="../template.jsp";
</script>
</body>
</html>
