<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title align="center"> 상품후기 </title> 
<style>
@import url('css/common.css');
</style>
</head>

<body>
<div id="Write" align="center" >
<h3>상품 사용 후기 글쓰기</h3>
<hr><sup>착용 후기를 올리신 모든분께 적립금을 드립니다.</sup><br><p>
	<form name="myform" method="post"  action="GuestServlet2">
      <input type="hidden"  name="command" value="insert2.do">	
<table class="boardlist2">

 <tr>
	<td class="boardlist_td2">작성자</td>
	<td><input type="text" name="name" size="28"></td>
	</tr>
 <tr>
	<td class="boardlist_td2">비밀번호</td>
	<td><input type="password" name="pass" size="30"></td>
 </tr>
 <tr>
	<td class="boardlist_td2">제목</td>
	<td><input type="text" size="68" name="title"></td>
 </tr>
 <tr>
	<td class="boardlist_td2">평점</td>
	<td>
		<c:choose>
		<input type="radio" name="grade" value="1">
						<c:when type="radio"  test="${grade eq '1'}">★</c:when>
		<input type="radio" name="grade" value="2">
						<c:when type="radio"  test="${grade eq '2'}">★★</c:when>
		<input type="radio" name="grade" value="3">
						<c:when  type="radio" test="${grade eq '3'}">★★★</c:when>
		<input type="radio" name="grade" value="4">
		                <c:when  type="radio" test="${grade eq '4'}">★★★★</c:when>
		<input type="radio" name="grade" value="5">
						<c:when  type="radio" test="${grade eq '5'}">★★★★★ </c:when>
</c:choose> 
	</td>
 </tr>
 <tr>
	<td>내용</td>
	<td><textarea cols="70" rows="15" name="content"></textarea></td>
 </tr>
</table>

		<input type="submit"   value="데이타저장"> &nbsp;
		<input type="reset"  value="입력취소">&nbsp;
		<input type="button"   value="리스트" onclick="location.href='GuestServlet2?command=boardlist2.do'"> &nbsp;
</form>
	
</div>
</body>
</html>






