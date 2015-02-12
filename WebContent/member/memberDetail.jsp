<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestDetail.jsp] </title> 
	<link rel="stylesheet" type="text/css" href="../css/shopping.css">
</head>
<%!
private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
private  CallableStatement  CST ; //storedProcedure쿼리문실행
private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") 조회한결과

private  String sql; //insert~ , select,  delete, update ~
private  String sql2="", sql3=""; //insert~ , select,  delete, update ~

private String name, id, pw, birth, gender, email, phone, admin;
private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
private  int total=0, Gtotal=0; //레코드갯수
  
  /////////////////나중에 페이징관련 필드 기술////////////////////////
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
    String url="jdbc:oracle:thin:@localhost:1521:XE"; //DB서버정보기술 430페이지 12라인
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
   String data = request.getParameter("idx"); 
   sql="select * from member where id='"+data+"'" ;
   
   ST=CN.createStatement();
   RS=ST.executeQuery(sql);
   if(RS.next()==true){
 	id = RS.getString("id");
 	pw = RS.getString("pw");
 	name = RS.getString("name");
 	gender = RS.getString("gender");
 	birth = RS.getString("birth");
 	email = RS.getString("email");
 	phone = RS.getString("phone");
 	admin = RS.getString("admin");
 %>
 <table id="memberList">
		<tr>
			<td style=" font-size: 16pt;" height="40" colspan="8" align="center">[<%=data %>님의 상세정보]</td>
		</tr>
	</table>
 <table  id="memberList" width="100%"  border='1' cellpadding="0" cellspacing="0">

  <tr class="tr" bgcolor="#FF77D1" height='50' align="center">
 	<td>이름</td>    
 	<td>아이디</td>   <td>비밀번호</td> <td>성별</td>   
 	<td>생일</td>   
 	<td style="width:200px;">이메일</td>
	<td style="width:150px;">전화번호</td> 
 	<td>권한</td>         
 </tr>

<tr class="tr" onMouseOver="style.backgroundColor='#FFCCEE' "
			onMouseOut="style.backgroundColor='#fff'" align="center">
	<td><%= name%></td>
	<td><%= id%></td>
	<td><%= pw%> </td>
	<td><%= gender%> </td>
	<td><%= birth.substring(0,10)%> </td>
	<td><%= email%> </td>
	<td><%= phone%> </td>
	<td><%= admin%> </td>
 </tr>
 <%  	
   }//whil end
  }catch(Exception ex){  }
 %>

</table>

<p><br>
 <h1>
 	<a href="template.jsp?page=memberEdit&id=<%= id%>&name=<%=name %>&pw=<%=pw%>&email=<%=email%>">데이타수정</a> &nbsp;
 	<a href="../member/memberDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="template.jsp?page=member">데이타출력</a> 
 	<a href="template.jsp?page=join">데이타입력</a> 
 </h1>
 
</body>
</html>






