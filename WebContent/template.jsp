<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [template.jsp] </title> 
<style>
@import url('css/shopping.css');
</style>	
</head>
<%
	String pageFile = request.getParameter("pageFile");
    if(pageFile=="" || pageFile==null ||pageFile.equals("main")){
    	pageFile="main.jsp";
    }else if( pageFile.equals("list.do")){
    	//pageFile="board/boardList.jsp";
    	pageFile="list.do";
    //}else if( pageFile.equals("insert.do")){
    //	pageFile="board/board.jsp";
    //}else if( pageFile.equals("delete.do")){
    //	pageFile="board/boardDelete.jsp";
    //}else if( pageFile.equals("detail.do")){
    //	pageFile="board/boardDetail.jsp";
    //}else if( pageFile.equals("edit.do")){
    //	pageFile="board/Edit.jsp";
    }else if( pageFile.equals("login")){
    	pageFile="login/login.jsp";
    }else{
    	pageFile="template.jsp";
    }

%>
	
	<table width="100%" height="100%" border="1" cellspacing="0" >
		<tr>
			<td width="100%" colspan=3 height="45" align="left">
				<jsp:include page="top.jsp" />
			</td>
		</tr>
		
		<tr>
			<td width="100%" colspan=2 align="center">
				<jsp:include page="<%= pageFile %>"   /> 
			</td>
		</tr>
		
		<tr>
			<td  width="100%" colspan=3 height="40" align="left">
				<jsp:include page="bottom.jsp" />
			</td>
		</tr>
	</table>
	
<body>
</body>
</html>


