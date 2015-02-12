<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [Edit] </title> 
<style>
@import url('./css/common.css');
</style>
</head>

 <body>
 
	<form method="post" enctype="multipart/form-data" action="BoardServlet?command=Edit">
	
		<b>상품번호	: </b> <input type=number name="goodno" value="${bean.goodno}" readonly><br>
		<b>상품명	: </b> <input type=text name="goodname" value="${bean.goodname}"><br>
		<b>원가		: </b> <input type=number name="margin" value="${bean.margin}"> <br>   
		<b>단가		: </b> <input type=number name="unit" value="${bean.unit}"><br>
		<b>적립금	: </b> <input type=number name="point" value="${bean.point}"><br>
		<b>수량		: </b> <input type=number name="ea" value="${bean.ea}"><br>
		<b>색상	: </b> <input type=text name="goodcolor" value="${bean.goodcolor}"><br>
		<b>사이즈	: </b> <select id=goodsize name="goodsize" value="${bean.goodsize}"><br>
			<option value="S" <c:if test="${bean.goodsize == 'S'}"> <c:out value= "selected=selected"/></c:if>>S</option>
			<option value="M" <c:if test="${bean.goodsize == 'M'}"> <c:out value= "selected=selected"/></c:if>>M</option>
			<option value="L" <c:if test="${bean.goodsize == 'L'}"> <c:out value= "selected=selected"/></c:if>>L</option>
			<option value="XL" <c:if test="${bean.goodsize == 'XL'}"> <c:out value= "selected=selected"/></c:if>>XL</option>		
			</select><br>
		<b>분류타입	: </b> <select id=goodtype name="goodtype" value="${bean.goodtype}"><br>
			<option value="Top" <c:if test="${bean.goodtype == 'Top'}"> <c:out value= "selected=selected"/></c:if>>Top</option>
			<option value="Bottom" <c:if test="${bean.goodtype == 'Bottom'}"> <c:out value= "selected=selected"/></c:if>>Bottom</option>
			<option value="Outer" <c:if test="${bean.goodtype == 'Outer'}"> <c:out value= "selected=selected"/></c:if>>Outer</option>
			</select><br>
		<b>파일선택1	: </b> <input type="file" name="pictureurl1"><br>
		<b>파일선택2	: </b> <input type="file" name="pictureurl2"><br>
		<b>파일선택3	: </b> <input type="file" name="pictureurl3"><br>
		<b>파일선택4	: </b> <input type="file" name="pictureurl4"><br>
		<b>파일선택5	: </b> <input type="file" name="pictureurl5"><br>
		<b>상세설명	: </b><br><textarea rows="10" cols="50" name="description">${bean.description}</textarea><br>
		<input type="hidden" name="images1" value="${bean.pictureurl1}">
		<input type="hidden" name="images2" value="${bean.pictureurl2}">
		<input type="hidden" name="images3" value="${bean.pictureurl3}">
		<input type="hidden" name="images4" value="${bean.pictureurl4}">
		<input type="hidden" name="images5" value="${bean.pictureurl5}">
		
	<input type="submit" value="수정하기">
	<input type="reset" value="수정취소">
	

	</form>


</table>


<p>
 <h1>&nbsp;
 	<a href="Insert.jsp">데이타입력</a> &nbsp;
 	<a href="List.do">데이타출력</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>






