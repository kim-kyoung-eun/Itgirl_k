<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>[openIDSave.jsp]</title>
<style type="text/css">
input, b {
	font-size: 20pt;
	font-weight: bold;
}
</style>
</head>
<%!
  private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
  private  Statement  ST; //�������  ST=CN.createStatement( )
  private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure����������
  private  ResultSet RS; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
  
  private  String sql; //insert~ , select,  delete, update ~
  private  int Gsabun; //����ʵ� 
  private  String Gname; //�̸��ʵ�
  private  String Gtitle; //�����ʵ�
  private  int total=0; //���ڵ尹��
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
  String data = request.getParameter("id"); 

  	sql="select count(*) as cnt from member where id = '" + data + "'" ; 
  	ST=CN.createStatement();
  	RS=ST.executeQuery(sql);
  	if(RS.next()==true){
  		total=RS.getInt("cnt");
  	}
  	
   if(total>0){ 
%>
	<script type="text/javascript">
  	alert("<%= data %> �̹� ��Ͼ����ϴ�");
  	//location.href="guest.jsp"; 
  	opener.myform.id.value="";
  	opener.myform.id.focus( );
  	self.close( ); //�ڵ����� â�ݱ�
  </script>

	<%  			
   }else{ 
%>
	<script type="text/javascript">
  	alert("<%= data %> ��밡���մϴ�");
  	self.close( ); //�ڵ����� â�ݱ�
  </script>
	<%  
   }
 
 %>

</body>
</html>






