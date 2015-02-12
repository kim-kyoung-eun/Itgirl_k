<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<style>
@import url('./css/common.css');
</style>
<body>
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
</body>
</html>

