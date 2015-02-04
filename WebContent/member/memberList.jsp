<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberList</title>
<style>
@import url('css/shopping.css');
</style>
</head>
<%!
  private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
  private  Statement  ST; //�������  ST=CN.createStatement( )
  private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure����������
  private  ResultSet RS; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
  
  private  String sql; //insert~ , select,  delete, update ~

  private  int total=0; //���ڵ尹��
  
  private String name, id, pw, birth, gender, email, phone, admin;
  
  /////////////////���߿� ����¡���� �ʵ� ���////////////////////////
%>
<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB����������� 430������ 12����
    CN=DriverManager.getConnection(url, "system","oracle"); //32���� 
  	//out.println("<h1>DB���� ���� ����!!!!! </h1>");
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB���� ���� ����</h1>");
  	System.out.println("����: " + ex.toString() );
  }
%>

<body>


	<%
 try{
   sql="select count(*) as cnt from member";
   ST=CN.createStatement();
   RS=ST.executeQuery(sql); //RS�� ����ϴ� �� 9
   if(RS.next()==true){
   	 total = RS.getInt("cnt") ;
   }
 }catch(Exception ex){ }
 %>
	<table id="memberList">
		<tr>
			<td style=" font-size: 16pt;" height="40" colspan="8" align="center">[ȸ������������]</td>
		</tr>
	</table>
	<table id="memberList" width="100%" cellpadding="0">

		<tr class="tr" bgcolor="#FF77D1" height='50' align="center">
			<td>�̸�</td>
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>����</td>
			<td>����</td>
			<td style="width:200px;">�̸���</td>
			<td style="width:150px;">��ȭ��ȣ</td>
			<td>����</td>
		</tr>
		<%
  try{   
   sql="select * from member" ; //430������ 15����
   ST=CN.createStatement();
   RS=ST.executeQuery(sql);
   while(RS.next()==true){
 	name = RS.getString("name");
    id = RS.getString("id");
    pw = RS.getString("pw");
    gender = RS.getString("gender");
    birth = RS.getString("birth");
    email = RS.getString("email");
    phone = RS.getString("phone");
    admin = RS.getString("admin");
 %>
		<tr class="tr" onMouseOver="style.backgroundColor='#FFCCEE' "
			onMouseOut="style.backgroundColor='#fff'" align="center">
			<td><%= name %></td>
			<td><a href="memberDetail.jsp?idx=<%= name %>"><%= id %></a></td>
			<td><%= pw %></td>
			<td><%= gender %></td>
			<td><%= birth.substring(0,10) %></td>
			<td><%= email %></td>
			<td><%= phone %></td>
			<td><%= admin %></td>
		</tr>

		<%  	
   }//whil end
  }catch(Exception ex){  }
 %>
	</table>

	
</body>
</html>