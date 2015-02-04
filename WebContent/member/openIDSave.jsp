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
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB서버정보기술 430페이지 12라인
    CN=DriverManager.getConnection(url, "system","oracle"); //32라인 
  	//out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB서버 연결 실패</h1>");
  	System.out.println("에러: " + ex.toString() );
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
  	alert("<%= data %> 이미 등록었습니다");
  	//location.href="guest.jsp"; 
  	opener.myform.id.value="";
  	opener.myform.id.focus( );
  	self.close( ); //자동으로 창닫기
  </script>

	<%  			
   }else{ 
%>
	<script type="text/javascript">
  	alert("<%= data %> 사용가능합니다");
  	self.close( ); //자동으로 창닫기
  </script>
	<%  
   }
 
 %>

</body>
</html>






