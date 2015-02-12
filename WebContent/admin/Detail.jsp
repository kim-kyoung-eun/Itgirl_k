<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [Detail.jsp] </title> 

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">


<style>
@import url('../css/common.css');
</style>
	
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
	
	
</head>

 <body>
<table class="boardlist" width="100%" >
 <tr align="center" >
 	<td colspan=15 align="center">
 	<img src="images/rnew.gif"></td>
 </tr>
 <tr align="center">
 	<td class="boardlist_td">상품번호</td><td class="boardlist_td">상품명</td><td class="boardlist_td">원가</td>
 	<td class="boardlist_td">단가</td><td class="boardlist_td">적립금</td><td class="boardlist_td">수량</td>
 	<td class="boardlist_td">색상</td><td class="boardlist_td">사이즈</td><td class="boardlist_td">분류코드</td>
 	<td class="boardlist_td">파일 1</td><td class="boardlist_td">파일 2</td><td class="boardlist_td">파일 3</td>
 	<td class="boardlist_td">파일 4</td><td class="boardlist_td">파일 5</td><td class="boardlist_td">상세설명</td>
 </tr>

	<tr class="tr">
	
	
			<td>${bean.goodno}</td>
			<td>${bean.goodname}</td>
			<td>${bean.margin}</td>
			<td>${bean.unit}</td>
			<td>${bean.point}</td>
			<td>${bean.ea}</td>
			<td>${bean.goodcolor}</td>
			<td>${bean.goodsize}</td>
			<td>${bean.goodtype}</td>
			
			<!-- pictureurl이 null일때 null.gif 출력 -->
			<td>
			<c:choose>
				<c:when test="${empty bean.pictureurl1}">
				<img src="images/null.gif">
			</c:when>
			<c:otherwise>
				<img src="${bean.pictureurl1}" width=100 height=100 border="0">
			</c:otherwise>
			</c:choose>
			</td>
			
			<td>
				<c:choose>
					<c:when test="${empty bean.pictureurl2}">
					<img src="images/null.gif">
				</c:when>
				<c:otherwise>
					<img src="${bean.pictureurl2}" width=100 height=100 border="0">
				</c:otherwise>
				</c:choose>
			</td>
			
			<td>
				<c:choose>
					<c:when test="${empty bean.pictureurl3}">
					<img src="images/null.gif">
				</c:when>
				<c:otherwise>
					<img src="${bean.pictureurl3}" width=100 height=100 border="0">
				</c:otherwise>
				</c:choose>
			</td>
			
			<td>
				<c:choose>
					<c:when test="${empty bean.pictureurl4}">
					<img src="images/null.gif">
				</c:when>
				<c:otherwise>
					<img src="${bean.pictureurl4}" width=100 height=100 border="0">
				</c:otherwise>
				</c:choose>
			</td>
			
			
			<td>
				<c:choose>
					<c:when test="${empty bean.pictureurl5}">
					<img src="images/null.gif">
				</c:when>
				<c:otherwise>
					<img src="${bean.pictureurl5}" width=100 height=100 border="0">
				</c:otherwise>
				</c:choose>
			</td>
			
			<td>${bean.description}</td>
	</tr>


</table>


<p>
 <h1>&nbsp;
 
 
 
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">데이터 입력</a></li>
    <li><a href="#tabs-2">데이터 삭제</a></li>
    <li><a href="#tabs-3">데이터 수정</a></li>
  </ul>
  <div id="tabs-1">
    <p>
	<form name="myform" enctype="multipart/form-data" method="post" action="BoardServlet?command=Insert">
		<b>상품번호	: </b> <input type=number name="goodno"><br>
		<b>상품명	: </b> <input type=text name="goodname"><br>
		<b>원가		: </b> <input type=number name="margin"> <br>   
		<b>단가		: </b> <input type=number name="unit"><br>
		<b>적립금	: </b> <input type=number name="point"><br>
		<b>수량		: </b> <input type=number name="ea" value="1"><br>
		<b>색상	: </b> <input type=text name="goodcolor"><br>
		<b>사이즈	: </b> <select id=goodsize name="goodsize"><br>
			<option name=size id="S" value="S" checked>S</option>
			<option name=size id="M" value="M">M</option>
			<option name=size id="L" value="L">L</option>
			<option name=size id="LX" value="XL">XL</option></select><br>
		<b>분류타입	: </b> <select id=goodtype name="goodtype"><br>
			<option name=type value="Top" id="Top" checked>Top</option>
			<option name=type value="Bottom" id="Bottom">Bottom</option>
			<option name=type value="Outer" id="Outer">Outer</option></select><br>
		<b>파일선택1	: </b> <input type="file" name="pictureurl1"><br>
		<b>파일선택2	: </b> <input type="file" name="pictureurl2"><br>
		<b>파일선택3	: </b> <input type="file" name="pictureurl3"><br>
		<b>파일선택4	: </b> <input type="file" name="pictureurl4"><br>
		<b>파일선택5	: </b> <input type="file" name="pictureurl5"><br>
		<b>상세설명	: </b><br><textarea rows="10" cols="50" name="description"></textarea><br>
		<input type="submit"   value="저장"> &nbsp;
		<input type="reset"  value="입력취소">
	</form>
    </p>
  </div>
  <div id="tabs-2">
    <p>
        <form name="form" method="post" action="BoardServlet">
        <input type="hidden" name="command" value="Delete">
		<b><font color=red>삭제 상품번호: </font></b> 
		<input type=text name="goodno" value=${bean.goodno} > 
		<input type="submit"  value=" 삭제  "> 
		</form>
    </p>
  </div>
  <div id="tabs-3">
    <p>
    	테스트중
    </p>
    
  </div>
</div>

 
 
 

 
	
 	<a href="admin/List.jsp">데이터출력</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="EditPre.do?idx=${bean.goodno}">데이터수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	
 	
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






