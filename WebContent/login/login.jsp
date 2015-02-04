<%@page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<!DOCTYPE html>
<html>
<title>로그인하기</title>
</head>
<body>
 <form method="post" action="login.do">
	<label for="userid">아이디 : </label>
	<input type="text" name="UID" id="UID"><br>

	<label for="pwd">암 호 : </label>
	<input type="password" name="UPWD" id="UPWD"><br>	
	<input type="submit" value="로그인">
</form>
</body>
</html>