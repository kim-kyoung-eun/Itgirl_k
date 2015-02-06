<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title>게시판 수정 </title> 

</head>

<b> 
   게시판 수정
</b>

   <form method="get" action="GuestServlet">
     <!-- 보물덩어리 -->
     <input type="hidden"  name="command" value="edit.do">	
 	 <b>수정번호:</b> 
        <input type=text  name="boardno" value="${daum.boardno}" readonly><br>
 	 <b>수정이름:</b> 
 	   <input type=text  name="name" value="${daum.name}"><br>
 	 <b>수정제목:</b> 
 	   <input type=text  name="title" value="${daum.title}"><br>
     <b>수정내용:</b> 
       <input type=text  name=content value="${daum.content}"><p>
        &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="submit"  value="MVC2수정하기">
       <input type="reset" value="수정취소">
   </form>

<p>
 <h1>
   &nbsp;&nbsp;&nbsp;&nbsp;
   <!-- 
 	<a href="GuestServlet?command=board.do">[데이타입력]</a> &nbsp;
 	<a href="GuestServlet?command=delete.do&boardno=${daum.boardno}">[데이타삭제]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">데이타출력</a>     
    -->
 	<a href="main/template.jsp?page=board">[데이타입력]</a> &nbsp;
 	<a href="GuestServlet?command=delete.do&boardno=${daum.boardno}">[데이타삭제]</a> &nbsp;
 	<a href="main/template.jsp?page=QA">데이타출력</a>  
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






