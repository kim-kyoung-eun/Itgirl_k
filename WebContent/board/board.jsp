<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [게시판] </title> 
<style>
@import url('css/shopping.css');
</style>
</head>

<body>
<div  align="center">
 [게시판 입력화면] <p>
	<form name="myform"   action="../GuestServlet">
        <!-- 보물덩어리 -->
        <input type="hidden"  name="command" value="insert.do">	
        <table class="bbs-table-write" width="680px">
		<tr>
			<td width="100px"><b>이름:</b></td>
			<td width="580px"><input type=text name="name"  size="50%"></td>
		</tr>
		<tr>
			<td><b>제목:</b></td>
			<td><input type=text name="title" value="snow" size="50%"></td>
		</tr>
		<tr>   
			<td><b>비밀번호:</b></td>
			<td><input type="password" name="pass" size="55%"></td>
		</tr>
		<tr>   
			<td><b>내용:</b></td>
			<td><textarea name="content" col="50" row="30">test contents </textarea></td>
		</tr>

		</table>
		<input type="submit"   value="MVC2데이타저장"> &nbsp;
		<input type="reset"  value="입력취소">
		<input type="button"   value="리스트" onclick="javascript:location.href='./template.jsp?page=QA'">
		<!-- <input type="button"   value="리스트" onclick="javascript:location.href='GuestServlet?command=list.do'">  -->
	</form>
</div>
</body>
</html>






