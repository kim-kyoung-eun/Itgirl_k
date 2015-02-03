<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [게시판] </title> 
	<style type="text/css">
	    b,input{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:10pt; font-weight:bold;}
		a{font-size:20pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:24pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>	
</head>

<body>
 <font size=7 color=blue>[게시판 입력화면] </font><p>
	<form name="myform"   action="GuestServlet">
        <!-- 보물덩어리 -->
        <input type="hidden"  name="command" value="insert.do">	
		<b>이름:</b> <input type=text name="name"> <br>
		<b>제목:</b> <input type=text name="title" value="snow"> <br>   
		<b>내용:</b> <textarea name="content" >test contents </textarea> <p>
		
		<input type="submit"   value="MVC2데이타저장"> &nbsp;
		<input type="reset"  value="입력취소">
		<input type="button"   value="리스트" onclick="javascript:location.href='GuestServlet?command=list.do'"> &nbsp;
	</form>

</body>
</html>






