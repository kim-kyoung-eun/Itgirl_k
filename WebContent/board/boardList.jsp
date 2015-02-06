<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.board.Boardbean"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head><title>게시판</title>
<style>
@import url('css/shopping.css');
</style>
</head>
<%!
private Connection CN ; //db서버연결정보 id/pass, CN참조 명령어 생성
private Statement ST; //정적명령 ST=CN.createStatement();
private PreparedStatement PST; //미리컴파일 명령어 PST=CN.prepareStatement(sql);
private CallableStatement CST ; //storedProcedure 쿼리문 실행
private ResultSet RS ; //RS=RS.executeQuery("select")조회한 결과

private String sql; //insert~ selet, delete, update..
private int Gsabun; //사번필드
private String Gname; //이름필드
private String Gtitle; //제목필드
private int total=0; //레코드 갯수
private int boardtype; //타입

///////////////// 페이징 관련 필드 기술////////////
private String pnum; //페이지 번호
private int pageNUM=1; //페이지 번호 기본은 1로 준다
private int pagesize=10, limit=10, start=1, end=10; 
//페이지 [1]..10개씩 출력 / 한페이지의 행의 수/ 보여주는 시작행/ 마지막행/
private int pagecount=0, startpage=1, temp=0 ; // 페이지 갯수 / 시작페이지 수(1,10,20..) /  시작페이지 구할때 사용할 변수 / 
private String skey="", sval="", sqry=""; //검색필드
//private String pageReturn=""; //검색시 페이지 클릭
%>

<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
  	String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
	CN=DriverManager.getConnection(url, "system", "oracle"); // 경로, id , pw
	System.out.println("<h1>DB서버 연결 성공</hl>");
} catch(Exception ex) {
	System.out.println("에러:"+ex.toString());
}
%>
<body>
<table width="800" border="1">
<%
try {
	sql="select count(*) as cnt from board";

	ST=CN.createStatement();
	RS=ST.executeQuery(sql);

	if(RS.next()==true) {
	total = RS.getInt("cnt");
	}
	System.out.println(sql);
} catch(Exception ex) { }
%>
<tr align="right"> 
  <td colspan="6"><font size="7">레코드 갯수:<%=total%> </font></td>
</tr>
<tr align="center">
<td>No</td><td>이름</td>
<td>제목</td><td>날짜</td><td>내용</td><td>조회수</td>
</tr>

<%
try {
 
//페이징 처리부분
pnum = request.getParameter("pageNUM");
if(pnum=="" || pnum==null) pnum="1";
pageNUM = Integer.parseInt(pnum);

if(total%pagesize==0) {pagecount = total/pagesize; }
else {
pagecount =(total/pagesize)+1; 
}

start=(pageNUM-1)*pagesize+1; //[2] =>11
//        (2(2페이지 10단락씩)-1=1)*1+1 = 2 =>2단락 =>11행부터 시작됨
end=pageNUM*pagesize ; //[2] =>20

//검색
skey = request.getParameter("keyfield");
sval = request.getParameter("keyword");
if(skey=="" || sval=="" || skey==null || sval==null) {
skey=" name ";
sqry=" where "+skey.trim() + " like '%%'";
} else {
sqry = " where " + skey.trim() + " like '%"+sval+"%'";
}

sql = "select * from ( ";
sql +=" select rownum as rn, boardno, name, title, nalja, content, board_count from ";
sql +="( select * from board )" +sqry ;
sql +=" ) where rn between " + start+ " and " +end ;
//startpage 값 구할 때 temp 변수

temp=(pageNUM-1)%limit ; //29-1%10 = 8
startpage = pageNUM - temp ; //29-8 =21

	ST=CN.createStatement();
	RS=ST.executeQuery(sql);
	while(RS.next()==true) {
	Gsabun = RS.getInt("boardno");
	Gname = RS.getString("name");
	Gtitle = RS.getString("title");

 %>

<tr onMouseOver="this.style.backgrondColor='#00ffff'" onMouseOut="this.style.backgroundColor=''">
  <td><%=RS.getInt("rn") %></td>
  <td><%=Gname%></td>
  <td><a href="../GuestServlet?command=detail.do&idx=<%=Gsabun%>"> <%=Gtitle%> </a>
      <!-- <a href="../main/template.jsp?page=boardDetail&idx=<%=Gsabun%>"><%=Gtitle%> </a> --></td>
  <td><%=RS.getDate("nalja") %></td>
  <td><%=RS.getString("content")%></td>
   <td><%if(RS.getString("board_count")==null ){  } else { out.print(RS.getString("board_count"));} %></td>
</tr>

<%
 	} // while end

} catch(Exception ex) {  }

%>
<tr align="center">
  <td colspan="6" height="50" style="font-size:26px">

<%
//[이전] 조건(11(startpage)-10(limit)) > 0 출력하기

if((startpage-limit) > 0) {
   out.print("<a href='boardList.jsp?pageNUM="+(startpage-10)+"'>[이전]</a>");
}
for(int i=startpage; i<(startpage+pagesize); i++) {
  if(i==pageNUM) {
   out.println("<font color=red>["+i+"]</font>");
  } else {
   out.println("<a href='boardList.jsp?pageNUM="+i+"'>["+i+"]</a>");
}
if(i>=pagecount) break;
}//for end

//다음조건 (11+10)<=23일때 출력해라
if((startpage+limit)<=pagecount) {
 out.print("<a href='boardList.jsp?pageNUM="+(startpage+10)+"'>[다음]</a>");
}
%>
</td>
</tr>
</table>
<a href="./template.jsp?page=board">데이타입력</a>
<a href="./template.jsp?page=QA">데이타출력</a>
</body>
</html>

