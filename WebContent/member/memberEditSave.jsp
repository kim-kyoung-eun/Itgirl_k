<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"  %>
<%@ page import="java.sql.*"  %>

<html>
<head>
<title>[guestEditSave.jsp]</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css">
</head>
<%!
	private Connection CN; //db서버연결정보 id/pass, CN참조 명령어 생성
	private Statement ST; //정적명령 ST=CN.createStatement()
	private PreparedStatement PST; //미리컴파일명령어 PST=CN.prepareStatement(sql);
	private CallableStatement CST ; //storedProcedure 쿼리문실행
	private ResultSet RS; //RS=ST.executeQuery("select") 조회한 결과
	//필드 = 멤버변수, 메소드 등등 선언하는 영역
	private String sql; //쿼리문을 문자열로 기억하는 필드
 	 private String name, id, pw, birth, gender, email, phone, admin;
	private int total=27;//레코드갯수

%>

<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:XE";		
		CN = DriverManager.getConnection(url, "system", "oracle");	
		out.println("<h1>DB서버 연결 성공</h1>");
		
	}catch(Exception e) {
		out.println("<h1>DB서버 연결 실패</h1>");
		System.out.println(e.toString());
	}
%>
<body>

<%
String data1=request.getParameter("id");
String data2=request.getParameter("pw");
 	String data3=request.getParameter("name");
 	//String data4=request.getParameter("gender");
 	//String data5=request.getParameter("birth");
 	//String data6=request.getParameter("addr");
 	String data4=request.getParameter("email");
 	//String data8=request.getParameter("phone");
 	//String data9=request.getParameter("admin");
 	System.out.println("=================수정내용===============");
 	System.out.println(data1);
 	System.out.println(data2);
 	System.out.println(data3);
	System.out.println(data4);

	try {	
		//sql="udpate guest set name=?, title=?, nalja=sysdate, pay=? where sabun=?";
	 	  sql="update member set pw=?, name=? , email=? where id=? "  ;

		//sql="udpate guest set name='"+data2 +"', title='"+data3+"', nalja=sysdate, pay="+data4+" where sabun="+data1;
		//out.println(sql);
	    PST=CN.prepareStatement(sql);
	    PST.setString(1,data2);
	    //PST.setString(2,data6);
	    PST.setString(2,data3);
	    PST.setString(3,data4);
	    PST.setString(4,data1);
	    PST.executeUpdate();// 진/짜 저장처리
	    response.sendRedirect("../main/template.jsp?page=member");
		System.out.println("<hl>member테이블 수정성공</h>");
	
	} catch(Exception ex) { 
		System.out.println("member테이블 수정실패"+ex.toString());
    	response.sendRedirect("../main/template.jsp?page=member");
	}
%>



</body>
</html>