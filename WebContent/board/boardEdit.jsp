<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title>�Խ��� ���� </title> 

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
   <!-- 
 	<a href="GuestServlet?command=board.do">[����Ÿ�Է�]</a> &nbsp;
 	<a href="GuestServlet?command=delete.do&boardno=${daum.boardno}">[����Ÿ����]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">����Ÿ���</a>     
    -->
 	<a href="main/template.jsp?page=board">[����Ÿ�Է�]</a> &nbsp;
 	<a href="GuestServlet?command=delete.do&boardno=${daum.boardno}">[����Ÿ����]</a> &nbsp;
 	<a href="main/template.jsp?page=QA">����Ÿ���</a>  
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






