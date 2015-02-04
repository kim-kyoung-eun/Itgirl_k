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
		function sendAddress(code, a, b, c){ //매개인자 4개지정 시, 구 , 동  , 번지 
		   var msg = a + " " + b + " "  + c;
		   opener.myform.zipcode.value=code;
		   opener.myform.address.value=msg;
		   self.close( );
		}
	</script>
</head>
<%!
  private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
  private  Statement  ST; //정적명령  ST=CN.createStatement( )
  private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure쿼리문실행
  private  ResultSet RS; //RS=ST.executeQuery("select") 조회한결과
  
  private  String sql; //insert~ , select,  delete, update ~
  private  int Gsabun; //사번필드 
  private  String Gname; //이름필드
  private  String Gtitle; //제목필드
  private  int total=0; //레코드갯수
  
  private  String data0; //zipcode   120-842
  private  String data1; //area1=시  서울시, 경기도
  private  String data2; //area2=구  마포구, 강남구
  private  String data3; //area3=동  일원동, 대흥동
  private  String data4; //area4=번지  83-1번지
  
  private  boolean  flag=false;//데이타있는지없는지 체크
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
    //String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB서버정보기술 430페이지 12라인
	String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
    CN=DriverManager.getConnection(url, "system","oracle"); //32라인 
  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  }catch(Exception ex){
  	System.out.println("에러: " + ex.toString() );
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
  	  	data1 = RS.getString("area1"); //서울시, 경기도, 경상북도
  	  	data2 = RS.getString("area2"); //마포구, 송파구
  	  	data3 = RS.getString("area3"); //신수동, 운하동
  	  	data4 = RS.getString("area4"); //93-12번지
 %>
	<br>
	<a
		href="javascript:sendAddress('<%= data0  %>',  '<%= data1 %>', '<%= data2 %>' , '<%= data3 %>')">
		<%= data1 %> &nbsp; <%= data2 %> &nbsp; <%= data3 %>
	</a>
	<% 	  	
  	  }while(RS.next()==true);
  	}else{out.println("<h1>" + data + " 검색데이타가 없습니다</h1>"); }
   }catch(Exception ex){ 
  	out.println("<h1>조회실패: " + ex.toString() + "</h1>");
  }
 %>
</body>
</html>






