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
  private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
  private  Statement  ST; //정적명령  ST=CN.createStatement( )
  private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure쿼리문실행
  private  ResultSet RS; //RS=ST.executeQuery("select") 조회한결과
  
  private  String sql; //insert~ , select,  delete, update ~

  private  int total=0; //레코드갯수
  
  private String name, id, pw, birth, gender, email, phone, admin;
  
  /////////////////나중에 페이징관련 필드 기술////////////////////////
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
 try{
   sql="select count(*) as cnt from member";
   ST=CN.createStatement();
   RS=ST.executeQuery(sql); //RS가 기억하는 값 9
   if(RS.next()==true){
   	 total = RS.getInt("cnt") ;
   }
 }catch(Exception ex){ }
 %>
	<table id="memberList">
		<tr>
			<td style=" font-size: 16pt;" height="40" colspan="8" align="center">[회원관리페이지]</td>
		</tr>
	</table>
	<table id="memberList" width="100%" cellpadding="0">

		<tr class="tr" bgcolor="#FF77D1" height='50' align="center">
			<td>이름</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>성별</td>
			<td>생일</td>
			<td style="width:200px;">이메일</td>
			<td style="width:150px;">전화번호</td>
			<td>권한</td>
		</tr>
		<%
  try{   
   sql="select * from member" ; //430페이지 15라인
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