<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>    
<%@ page import="net.hb.board.Boardbean"   %>

<html>
<head> <title> [boardList.jsp] </title> 
</head>
<body >
<%!  
  private  String sql2="",  sql3=""; //select   count(*)  as cnt  from  guestreply  where  sabun=2234 ;
  private  String Gname, Gtitle; //�̸�, �����ʵ�
  private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
  private  int total=0, Gtotal=0; //���ڵ尹��
  
  /////////////////���߿� ����¡���� �ʵ� ���////////////////////////
  private  String  pnum ;
  private  int pageNUM=1 ;
  private  int  pagesize=10, limit=10 , start=1, end=10;
  private  int pagecount=1, startpage=1,  temp=0 ;
  private  String skey="", sval="", sqry="" ; //�Ʒ��� �˻����� �ʵ� 
  private  String pageReturn=""  ; //�˻��� ������Ŭ��
%>
 <font size=5 color=blue><b> [�Խ���]</b></font><br>
 
 <table width='800'  border='1' onload="list.do">
 
 <tr height='50' >
 	<td colspan=5  align="center">
 		<img src="images/bar.gif">
 	</td>      
 </tr>
 
 <tr bgcolor="cccccc"   align="center">
 	<td>no</td>     <td>�̸�</td>   
 	<td>����</td>     <td>����</td>   <td>��¥</td>      
 </tr>
 
 	<c:forEach var="bean"  items="${naver}">
 	<tr  
 	   onMouseOver="style.backgroundColor='#00FFFF' "
 	   onMouseOut="style.backgroundColor='' "
 	>
 		<td> ${bean.boardno} </td>
 		<td> ${bean.name} </td>
 		<td> <a href="GuestServlet?command=detail.do&idx=${bean.boardno}"> ${bean.title} </a></td>
 		<td>  ${bean.content}  </td>
 		<td><fmt:formatDate value="${bean.nalja}" pattern="yyyy��-MM��-dd��"/> </td>
    </tr> 	
    </c:forEach>
 </table>
 <table>
<%
try{
	//563������ 23������ jstl�±� ��ȯ
	List list = (List)request.getAttribute("naver");
	for(int i=0; i<list.size(); i++) {
		Boardbean bean = (Boardbean)list.get(i);
		Gtitle = bean.getTitle();
%>

  	<tr>
  	  <td><%= bean.getBoardno()%></td>
  	  <td><%= bean.getName()%></td>
  	  <td><a href="detail.do?idx=<%=bean.getBoardno()%>"><%=Gtitle%></a></td>
  	  <td><%= bean.getNalja()%></td>
  	  <td><%= bean.getContent()%></td>
  	</tr>

<%		
	}
}catch(Exception ex) { }
%>
  </table>
<p>
 <h1>
    &nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="GuestServlet?command=board.do">[����Ÿ�Է�]</a> &nbsp;
 	<a href="GuestServlet?command=boardDel.do">[����Ÿ����]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">[����Ÿ���]</a>

 </h1>

</body>
</html>






