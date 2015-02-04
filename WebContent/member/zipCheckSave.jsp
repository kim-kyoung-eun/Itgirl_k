<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>[zipCheckSave.jsp]</title>
<style type="text/css">
input, b {
	font-size: 20pt;
	font-weight: bold;
}

a {
	font-size: 20pt;
	text-decoration: none;
	font-weight: bold;
}

a:hover {
	font-size: 24pt;
	text-decoration: underline;
	font-weight: bold;
}
</style>

<script type="text/javascript">
		function sendAddress(code, a, b, c){ //�Ű����� 4������ ��, �� , ��  , ���� 
		   var msg = a + " " + b + " "  + c;
		   opener.myform.zipcode.value=code;
		   opener.myform.address.value=msg;
		   self.close( );
		}
	</script>
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
  
  private  String data0; //zipcode   120-842
  private  String data1; //area1=��  �����, ��⵵
  private  String data2; //area2=��  ������, ������
  private  String data3; //area3=��  �Ͽ���, ���ﵿ
  private  String data4; //area4=����  83-1����
  
  private  boolean  flag=false;//����Ÿ�ִ��������� üũ
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
    //String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB����������� 430������ 12����
	String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
    CN=DriverManager.getConnection(url, "system","oracle"); //32���� 
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	System.out.println("����: " + ex.toString() );
  }
%>

<body>
	<% 
  String data = request.getParameter("zipcode");  
  try{
  	sql="select * from zipcode where zipcode = '" + data + "'" ; 
  	ST=CN.createStatement();
  	RS=ST.executeQuery(sql);
  	flag=RS.next();
  	if(flag==true){
  	  do{
  	  	data0 = RS.getString("zipcode");
  	  	data1 = RS.getString("area1"); //�����, ��⵵, ���ϵ�
  	  	data2 = RS.getString("area2"); //������, ���ı�
  	  	data3 = RS.getString("area3"); //�ż���, ���ϵ�
  	  	data4 = RS.getString("area4"); //93-12����
 %>
	<br>
	<a
		href="javascript:sendAddress('<%= data0  %>',  '<%= data1 %>', '<%= data2 %>' , '<%= data3 %>')">
		<%= data1 %> &nbsp; <%= data2 %> &nbsp; <%= data3 %>
	</a>
	<% 	  	
  	  }while(RS.next()==true);
  	}else{out.println("<h1>" + data + " �˻�����Ÿ�� �����ϴ�</h1>"); }
   }catch(Exception ex){ 
  	out.println("<h1>��ȸ����: " + ex.toString() + "</h1>");
  }
 %>
</body>
</html>






