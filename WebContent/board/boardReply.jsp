<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [boardReply.jsp] </title> 
	<style type="text/css">
	   input,b{ font-size:13pt; font-weight:bold; font-family:Yoon ����� Light_TT;}
	   td { font-size:13pt; font-weight:bold; font-family:Yoon ����� Light_TT;}
	   a{text-decoration:none; font-weight:bold; color:black; }
	   a:hover{
	     font-family:Yoon ����� Light_TT;; 
	     text-decoration:underline; color:#cccccc;
	   }
	</style>
	<script type="text/javascript">

	function del(code) {
		
		location.href="boardReply_del.jsp?ref="+code ;
	}
	</script>
</head>
<%!
private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
private  CallableStatement  CST ; //storedProcedure����������
private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") ��ȸ�Ѱ��

private  String sql; //insert~ , select,  delete, update ~
private  String sql2="", sql3=""; //insert~ , select,  delete, update ~
private  int Gsabun, Gpay; //���, �޿��ʵ� 
private  String Gname, Gtitle; //�̸�, �����ʵ�
private  int Gnum; //��������ȣ ��������
private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
private  int total=0, Gtotal=0; //���ڵ尹��
  
  /////////////////���߿� ����¡���� �ʵ� ���////////////////////////
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
  	String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
    CN=DriverManager.getConnection(url, "system","oracle"); //32���� 
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	System.out.println("����: " + ex.toString() );
  }
%>

<body>
<%
String data1= request.getParameter("boardno");
String data2= request.getParameter("Gname");
String data3= request.getParameter("Gtitle");

%>
 <form name="gt_rpy" action="GuestServlet">
 <input type="hidden"  name="command" value="Replyinsert.do">	
 <table width='800'  border='1'  >
   <tr>
 	<td bgcolor="pink" width="130" align="center"> �۾���  </td>
 	<td><input type="text" name="writer" size="30"></td>
 	<td rowspan="3" align="center" bgcolor="pink">
 	<input type="submit" value="�������" style="height:80px">
 	</td>  
   </tr>
   <tr>     
   	<td bgcolor="pink" width="130" align="center"> �� �� </td>
   	<td><textarea name="content" rows=3 cols=70></textarea>
    </td>                  
 </tr>
    <tr>     
   	<td bgcolor="pink" width="130" align="center"> ��й�ȣ </td>
   	<td><input type="password" name="pass"></td>                  
 </tr>
 </table>
 <input type="hidden" name="boardno" value="<%=data1 %>">
 </form>
 <br>
 

 <table width='800'  border='1'>
 <tr bgcolor="#C6FFFF" align="center">
 	<td width="130">�г���</td>  
 	<td>����</td>      
 	<td width="130">����</td>    
 </tr>
  <%
	
  try{   

   sql3="select * from  board_reply  where  ref="+data1 ;
   ST3 = CN.createStatement();
   RS3 = ST3.executeQuery(sql3);
   while(RS3.next()==true) {
  	 Gnum = RS3.getInt("replyno");
  	 Gwriter = RS3.getString("writer");
  	 Gcontent = RS3.getString("reply");
 %>
<tr>
  <td><%=Gwriter %></td>
  <td><%=Gcontent %></td>
  <td align="center">
  	<a href="GuestServlet?command=boardReplyDel.do&ref=<%=Gnum %>">�����ϱ�</a>
  </td>   
</tr>
 <%  	
   }//while end
  }catch(Exception ex){  }
 %>
</table>

</body>
</html>






