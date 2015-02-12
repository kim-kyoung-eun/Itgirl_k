<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [boardReply.jsp] </title> 
	<style type="text/css">

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
<table class="boardlist2" width="70%" >
   <tr>
 	<td align="center"><b>[댓글달기]</b></td>  
   </tr>
</table>
<table class="boardlist2" width="70%" >
   <tr>
 	<td width="10%" align="center" class="boardlist2_td"> 글쓴이  </td>
 	<td width="80%"><input type="text" name="writer" class="boardarea"></td>
 	<td width="10%"rowspan="3" align="center" ">
 	<input type="submit" value="댓글저장" style="height:80px">
 	</td>  
   </tr>
   <tr>     
   	<td align="center" class="boardlist2_td"> 내 용 </td>
   	<td><textarea name="content" rows=3 cols=70 class="boardarea"></textarea>
    </td>                  
 </tr>
    <tr>     
   	<td align="center" class="boardlist2_td"> 비밀번호 </td>
   	<td><input type="password" name="pass" class="boardarea"></td>                  
 </tr>
 </table>
 <input type="hidden" name="boardno" value="<%=data1 %>">
 </form>
 <br>
 

<table class="boardlist2" width="70%" >
 <tr align="center">
 	<td width="10%" class="boardlist2_td">닉네임</td>  
 	<td width="80%" class="boardlist2_td">내용</td>      
 	<td width="10%" class="boardlist2_td">삭제</td>    
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






