<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title>�Խ��� ���� </title> 
	<style type="text/css">
	    b,input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:20pt; font-weight:bold; font-family:�ü�ü; }
		a{font-size:20pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:24pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>

<b> 
   �Խ��� ����
</b>

   <form method="get" action="GuestServlet">
     <!-- ������� -->
     <input type="hidden"  name="command" value="edit.do">	
 	 <b>������ȣ:</b> 
        <input type=text  name="boardno" value="${daum.boardno}" readonly><br>
 	 <b>�����̸�:</b> 
 	   <input type=text  name="name" value="${daum.name}"><br>
 	 <b>��������:</b> 
 	   <input type=text  name="title" value="${daum.title}"><br>
     <b>��������:</b> 
       <input type=text  name=content value="${daum.content}"><p>
        &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="submit"  value="MVC2�����ϱ�">
       <input type="reset" value="�������">
   </form>

<p>
 <h1>
   &nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="board.jsp">[����Ÿ�Է�]</a> &nbsp;
 	<a href="boardDelete.jsp">[����Ÿ����]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">����Ÿ���</a>  
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






