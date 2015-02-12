<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<title>It girl</title>
<style>
@import url('css/shopping.css');
</style>
</head>
<%
	String pageFile = request.getParameter("page");
    if(pageFile=="" || pageFile==null){
    	pageFile="main.jsp";
    }else if( pageFile.equals("join")){
    	pageFile="./join/join.jsp";
    }else if( pageFile.equals("new")){
    	pageFile="#";
    }else if( pageFile.equals("top")){
    	pageFile="#";
    }else if( pageFile.equals("outer")){
    	pageFile="#";
    }else if( pageFile.equals("pants")){
    	pageFile="#";
    }else if( pageFile.equals("shoes")){
    	pageFile="#";
    }else if( pageFile.equals("QA")){
    	pageFile="./board/boardList.jsp";
    }else if( pageFile.equals("boardDetail")){
    	pageFile="./board/boardDetail.jsp";
    }else if( pageFile.equals("board")){
    	pageFile="./board/board.jsp";
    }else if( pageFile.equals("boardEdit")){
    	pageFile="./board/boardEdit.jsp";
    }else if( pageFile.equals("member")){
    	pageFile="./member/memberList.jsp";
    }else if( pageFile.equals("login")){
    	pageFile="./login/login.jsp";   	
    }else{
    	pageFile="template.jsp";
    }

%>

<table width="100%" height="100%" cellspacing="0">
	<tr>
		<td width="100%" height="45" align="left"><jsp:include
				page="top.jsp" /></td>
	</tr>

	<tr>
		<td width="85%" align="center"><jsp:include
				page="<%= pageFile %>" /></td>
	</tr>
	<hr>
	<tr>
		<td width="100%" height="40" align="left"><jsp:include
				page="bottom.jsp" /></td>
	</tr>
</table>

<body>
</body>
</html>


