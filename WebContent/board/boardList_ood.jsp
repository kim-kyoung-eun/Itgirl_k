<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.board.Boardbean"   %>

<html>
<head> <title> �Խ��� </title> 
<style type="text/css">
	@import url('css/common.css');
</style>
</head>
<%!  
  private  int Gsabun; //����ʵ� 
  private  String Gname, Gtitle; //�̸�, �����ʵ�
  private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
  private  int total=0, Gtotal=0; //���ڵ尹��
  
 /////////////////���߿� ����¡���� �ʵ� ���////////////////////////
 private  String  pnum ;
 private  int pageNUM=1 ;
 private  int pagesize=10, limit=10 , start=1, end=10;
 private  int pagecount=1, startpage=1,  temp=0 ;
 private  String skey="", sval="", sqry="" ; //�Ʒ��� �˻����� �ʵ� 
 private  String pageReturn=""  ; //�˻��� ������Ŭ��
%>

<div class="header4" align="center" width="70%" ><font color="#2D2B2B">Q&A</font> 
</div>
<table class="boardlist" width="70%" >
 <tr align="center"  class="boardlist_td">
 	<td width="10%" class="boardlist_td">��ȣ</td>     <td width="10%" class="boardlist_td">�̸�</td>   
 	<td width="30%" class="boardlist_td">����</td>     <td widtg="40%"class="boardlist_td">����</td>   <td width="10%" class="boardlist_td">��ȸ��</td>      
 </tr>
 <%
  try{   
  	 //563������   23���� JSTL�±� ��ȯ 
     List list = (List)request.getAttribute("naver");
     for(int i=0; i<list.size(); i++){
     	Boardbean bean = (Boardbean)list.get(i);
     	Gsabun = bean.getBoardno();
     	Gtitle =  bean.getTitle();

 %>
 	<tr>
 		<td> <%= bean.getBoardno() %> </td>
 		<td> <%= bean.getName() %> </td>
 		<td> <a href="GuestServlet?command=detail.do&idx=<%= Gsabun %>"> <%= Gtitle %> </a></td>
 		<td> <%= bean.getContent() %> </td>
 		<td align="center"> <% if(bean.getBoardcount()==null){ }  else { out.print(bean.getBoardcount());}%> </td>
    </tr> 	
 <%    	
     }//for end
     
  }catch(Exception ex){  }
 %>
</table>
			<%
			/*
			if(startpage>=10){
				out.print("<a href='G_guest.do?pageNUM="+(startpage-pageSize)+"'>�� ����</a>&nbsp;");
				
			}
			for(int i=startpage; i<(startpage+pagesize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>["+i+"]</font>&nbsp;"); }
				else{
					out.print("<a href='G_guest.do?pageNUM="+i+"'>"+i+"</a>&nbsp;");
				}
				if(i>=bean.getPagecount()) break;
			}
			if(startpage+pagesize<=bean.getPagecount()){
				out.print("<a href='G_guest.do?pageNUM="+(startpage+pagesize)+"'>���� ��</a>");
			}
			*/
			%>
<p><br>

     &nbsp;&nbsp;&nbsp;
 	<a href="GuestServlet?command=board.do">[����Ÿ�Է�]</a> &nbsp;
 	<a href="GuestServlet?command=list.do">[����Ÿ���]</a> 

</body>
</html>






