<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.board.Boardbean"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head><title>�Խ���</title>
<style>
@import url('css/shopping.css');
</style>
</head>
<%!
private Connection CN ; //db������������ id/pass, CN���� ��ɾ� ����
private Statement ST; //������� ST=CN.createStatement();
private PreparedStatement PST; //�̸������� ��ɾ� PST=CN.prepareStatement(sql);
private CallableStatement CST ; //storedProcedure ������ ����
private ResultSet RS ; //RS=RS.executeQuery("select")��ȸ�� ���

private String sql; //insert~ selet, delete, update..
private int Gsabun; //����ʵ�
private String Gname; //�̸��ʵ�
private String Gtitle; //�����ʵ�
private int total=0; //���ڵ� ����
private int boardtype; //Ÿ��

///////////////// ����¡ ���� �ʵ� ���////////////
private String pnum; //������ ��ȣ
private int pageNUM=1; //������ ��ȣ �⺻�� 1�� �ش�
private int pagesize=10, limit=10, start=1, end=10; 
//������ [1]..10���� ��� / ���������� ���� ��/ �����ִ� ������/ ��������/
private int pagecount=0, startpage=1, temp=0 ; // ������ ���� / ���������� ��(1,10,20..) /  ���������� ���Ҷ� ����� ���� / 
private String skey="", sval="", sqry=""; //�˻��ʵ�
//private String pageReturn=""; //�˻��� ������ Ŭ��
%>

<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
  	String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
	CN=DriverManager.getConnection(url, "system", "oracle"); // ���, id , pw
	System.out.println("<h1>DB���� ���� ����</hl>");
} catch(Exception ex) {
	System.out.println("����:"+ex.toString());
}
%>
<body>
<table width="800" border="1">
<%
try {
	sql="select count(*) as cnt from board";

	ST=CN.createStatement();
	RS=ST.executeQuery(sql);

	if(RS.next()==true) {
	total = RS.getInt("cnt");
	}
	System.out.println(sql);
} catch(Exception ex) { }
%>
<tr align="right"> 
  <td colspan="6"><font size="7">���ڵ� ����:<%=total%> </font></td>
</tr>
<tr align="center">
<td>No</td><td>�̸�</td>
<td>����</td><td>��¥</td><td>����</td><td>��ȸ��</td>
</tr>

<%
try {
 
//����¡ ó���κ�
pnum = request.getParameter("pageNUM");
if(pnum=="" || pnum==null) pnum="1";
pageNUM = Integer.parseInt(pnum);

if(total%pagesize==0) {pagecount = total/pagesize; }
else {
pagecount =(total/pagesize)+1; 
}

start=(pageNUM-1)*pagesize+1; //[2] =>11
//        (2(2������ 10�ܶ���)-1=1)*1+1 = 2 =>2�ܶ� =>11����� ���۵�
end=pageNUM*pagesize ; //[2] =>20

//�˻�
skey = request.getParameter("keyfield");
sval = request.getParameter("keyword");
if(skey=="" || sval=="" || skey==null || sval==null) {
skey=" name ";
sqry=" where "+skey.trim() + " like '%%'";
} else {
sqry = " where " + skey.trim() + " like '%"+sval+"%'";
}

sql = "select * from ( ";
sql +=" select rownum as rn, boardno, name, title, nalja, content, board_count from ";
sql +="( select * from board )" +sqry ;
sql +=" ) where rn between " + start+ " and " +end ;
//startpage �� ���� �� temp ����

temp=(pageNUM-1)%limit ; //29-1%10 = 8
startpage = pageNUM - temp ; //29-8 =21

	ST=CN.createStatement();
	RS=ST.executeQuery(sql);
	while(RS.next()==true) {
	Gsabun = RS.getInt("boardno");
	Gname = RS.getString("name");
	Gtitle = RS.getString("title");

 %>

<tr onMouseOver="this.style.backgrondColor='#00ffff'" onMouseOut="this.style.backgroundColor=''">
  <td><%=RS.getInt("rn") %></td>
  <td><%=Gname%></td>
  <td><a href="../GuestServlet?command=detail.do&idx=<%=Gsabun%>"> <%=Gtitle%> </a>
      <!-- <a href="../main/template.jsp?page=boardDetail&idx=<%=Gsabun%>"><%=Gtitle%> </a> --></td>
  <td><%=RS.getDate("nalja") %></td>
  <td><%=RS.getString("content")%></td>
   <td><%if(RS.getString("board_count")==null ){  } else { out.print(RS.getString("board_count"));} %></td>
</tr>

<%
 	} // while end

} catch(Exception ex) {  }

%>
<tr align="center">
  <td colspan="6" height="50" style="font-size:26px">

<%
//[����] ����(11(startpage)-10(limit)) > 0 ����ϱ�

if((startpage-limit) > 0) {
   out.print("<a href='boardList.jsp?pageNUM="+(startpage-10)+"'>[����]</a>");
}
for(int i=startpage; i<(startpage+pagesize); i++) {
  if(i==pageNUM) {
   out.println("<font color=red>["+i+"]</font>");
  } else {
   out.println("<a href='boardList.jsp?pageNUM="+i+"'>["+i+"]</a>");
}
if(i>=pagecount) break;
}//for end

//�������� (11+10)<=23�϶� ����ض�
if((startpage+limit)<=pagecount) {
 out.print("<a href='boardList.jsp?pageNUM="+(startpage+10)+"'>[����]</a>");
}
%>
</td>
</tr>
</table>
<a href="./template.jsp?page=board">����Ÿ�Է�</a>
<a href="./template.jsp?page=QA">����Ÿ���</a>
</body>
</html>

