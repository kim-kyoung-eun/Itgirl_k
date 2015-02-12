<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberList</title>
<link rel="stylesheet" type="text/css" href="../css/shopping.css">
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


<body>

	<table id="memberList">
		<tr>
			<td style=" font-size: 16pt;" height="40" colspan="8" align="center">[나의정보 페이지]</td>
		</tr>
	</table>
	<table id="memberList" cellpadding="0">
<%
	try {
		String id = (String)session.getAttribute("NowUser");
%>
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
	
	
		<tr class="tr" onMouseOver="style.backgroundColor='#FFCCEE' "
			onMouseOut="style.backgroundColor='#fff'" align="center">
			<td><%=id %></td>
			<td>${bb.name}</td>
			<td>${bb.pw}</td>
			<td>${bb.gender}</td>
			<td>${bb.birth}</td>
			<td>${bb.email}</td>
			<td>${bb.phone}</td>
			<td>${bb.admin}</td>
		</tr>

	</table>
<%
	}catch(Exception e){  System.out.println("edit 오류 : "+e.toString());}
%>	
	
</body>
</html>