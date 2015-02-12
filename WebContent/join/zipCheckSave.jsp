<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<%@ page import="java.sql.*"  %>

<html>
<head>
<title>[zipCheckSave.jsp]</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css">
	<script type="text/javascript">
		function sendAddress(code, a,b,c)  { //매개인자, 4개지정 시, 구, 동, 번지
			var msg1 =a + " " + b +" " + c ;
			opener.signin.zipcode.value = code;
			opener.signin.addr.value = msg1;
			self.close();
		}
		
	</script>
</head>
<%!
	private Connection CN; //db서버연결정보 id/pass, CN참조 명령어 생성
	private Statement ST; //정적명령 ST=CN.createStatement()
	private PreparedStatement PST; //미리컴파일명령어 PST=CN.prepareStatement(sql);
	private CallableStatement CST ; //storedProcedure 쿼리문실행
	private ResultSet RS; //RS=ST.executeQuery("select") 조회한 결과
	//필드 = 멤버변수, 메소드 등등 선언하는 영역
	private String sql; //쿼리문을 문자열로 기억하는 필드
	private int Gsabun ; //사번필드
	private String Gname; //이름필드
	private String Gtitle; //제목필드
	private int Gpay ; //사번필드
	private int total=0;//레코드갯수
	private String data0; //zipcode 120-842
	private String data1; //area1 시
	private String data2; //area2 구
	private String data3; //area3 동
	private String data4; //area4 번지
	private boolean flag=false; //데이타가 있는지 없는지 체크
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
<%

	String data=request.getParameter("zipcode");
	try {
		
		sql="select * from zipcode where zipcode like '%" + data + "%'" ;
		System.out.println(sql);
 		ST=CN.createStatement();
 		RS=ST.executeQuery(sql);
 		flag=RS.next();
 		if(flag==true) {
 			do{
 				data0 = RS.getString("zipcode");
 				data1 = RS.getString("sido"); //서울시, 경기도, 경상북도
 				data2 = RS.getString("gugun"); //마포구, 송파구
 				data3 = RS.getString("dong"); //성내동, 운하동
 				data4 = RS.getString("bunji"); //93-12번지
 %>
 <br>
 <a href="javascript:sendAddress('<%=data0%>','<%=data1%>','<%=data2%>','<%=data3%>')"><%=data2%> &nbsp; <%=data3%></a><br>
 <%
 			}while(RS.next()==true);
 		} else {
 			out.println("<h1>" + data + "검색데이타가 없습니다.</h1>");

 		}
	} catch(Exception ex) {out.println("<h1>조회 실패 : "+ex.toString() +"</h1>"); }

%>
<body>

</body>
</html>