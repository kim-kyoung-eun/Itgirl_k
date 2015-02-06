<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [boardReply.jsp] </title> 
	<style type="text/css">
	   input,b{ font-size:13pt; font-weight:bold; font-family:Yoon 사춘기 Light_TT;}
	   td { font-size:13pt; font-weight:bold; font-family:Yoon 사춘기 Light_TT;}
	   a{text-decoration:none; font-weight:bold; color:black; }
	   a:hover{
	     font-family:Yoon 사춘기 Light_TT;; 
	     text-decoration:underline; color:#cccccc;
	   }
	</style>
	<script type="text/javascript">

	function del(code) {
		
		location.href="boardReply_del.jsp?ref="+code ;
	}
	</script>
</head>
<%!
private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
private  CallableStatement  CST ; //storedProcedure쿼리문실행
private  ResultSet RS, RS2, RS3; //RS=ST.executeQuery("select") 조회한결과

private  String sql; //insert~ , select,  delete, update ~
private  String sql2="", sql3=""; //insert~ , select,  delete, update ~
private  int Gsabun, Gpay; //사번, 급여필드 
private  String Gname, Gtitle; //이름, 제목필드
private  int Gnum; //시퀀스번호 가져오기
private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
private  int total=0, Gtotal=0; //레코드갯수
  
  /////////////////나중에 페이징관련 필드 기술////////////////////////
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
  	String url="jdbc:oracle:thin:@203.236.209.116:1521:XE"; 
    CN=DriverManager.getConnection(url, "system","oracle"); //32라인 
  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  }catch(Exception ex){
  	System.out.println("에러: " + ex.toString() );
  }
%>

<body>
<%
String data1= request.getParameter("boardno");
String data2= request.getParameter("Gname");
String data3= request.getParameter("Gtitle");

%>
 <form name="gt_rpy" action="GuestServlet">
 <input type="hidden"  name="command" value="Replyinsert.do">	
 <table width='800'  border='1'  >
   <tr>
 	<td bgcolor="pink" width="130" align="center"> 글쓴이  </td>
 	<td><input type="text" name="writer" size="30"></td>
 	<td rowspan="3" align="center" bgcolor="pink">
 	<input type="submit" value="댓글저장" style="height:80px">
 	</td>  
   </tr>
   <tr>     
   	<td bgcolor="pink" width="130" align="center"> 내 용 </td>
   	<td><textarea name="content" rows=3 cols=70></textarea>
    </td>                  
 </tr>
    <tr>     
   	<td bgcolor="pink" width="130" align="center"> 비밀번호 </td>
   	<td><input type="password" name="pass"></td>                  
 </tr>
 </table>
 <input type="hidden" name="boardno" value="<%=data1 %>">
 </form>
 <br>
 

 <table width='800'  border='1'>
 <tr bgcolor="#C6FFFF" align="center">
 	<td width="130">닉네임</td>  
 	<td>내용</td>      
 	<td width="130">삭제</td>    
 </tr>
  <%
	
  try{   

   sql3="select * from  board_reply  where  ref="+data1 ;
   ST3 = CN.createStatement();
   RS3 = ST3.executeQuery(sql3);
   while(RS3.next()==true) {
  	 Gnum = RS3.getInt("replyno");
  	 Gwriter = RS3.getString("writer");
  	 Gcontent = RS3.getString("reply");
 %>
<tr>
  <td><%=Gwriter %></td>
  <td><%=Gcontent %></td>
  <td align="center">
  	<a href="GuestServlet?command=boardReplyDel.do&ref=<%=Gnum %>">삭제하기</a>
  </td>   
</tr>
 <%  	
   }//while end
  }catch(Exception ex){  }
 %>
</table>

</body>
</html>






