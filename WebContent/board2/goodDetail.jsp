<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<head> <title> [goodDetail.jsp] </title> 
<style>
  @import url('../css/common.css');
</style>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">

	
<script>
$(function() {  $( "#ea" ).spinner({
     spin: function( event, ui ) {
       if ( ui.value > 100 ) {
         $( this ).spinner( "value", 0 );
         return false;
       } else if ( ui.value < 0 ) {
         $( this ).spinner( "value", 0 );
         return false;
       }
     }
   });
 });

$(function() {
	    $( "#img" ).accordion();
	  });
</script>
	
	
</head>

 <body>
<table class="boardlist2">
	<tr align="center" height="15">
 		<td rowspan="11" width="330"><img src="../filesave/${bean.pictureurl1}" > </td>
		<td colspan="2" height="40"> 
		 ${bean.goodname}
		</td>	
	</tr>

	<tr align="center" height="15">
 		<td align="left" width="100">* 상품번호</td>
 		<td align="right" width="250">
 		${bean.goodno}
 		</td>
	</tr> 
	<tr align="center" height="15">
 		<td align="left" width="100">* 판매가</td>
		<td align="right" width="250" >
		${bean.unit}
 		</td>
	</tr> 
	<tr align="center" height="15">
 		<td align="left" width="100">* 적립금</td>
 		<td align="right" width="250">
 		${bean.point}
 		</td>
	</tr>
	<tr align="center" height="15">
 		<td align="left" width="100">* 타입</td>
 		<td align="right" width="250">
 		${bean.goodtype}
 		</td>
	</tr>  
	
	<tr align="center" height="15">
 		<td align="left" width="100">* 색상</td>
 		<td align="right" width="250">
 			<select type=text name="goodcolor">
 			<option name=color value="1" checked>==필수 옵션입니다==</option>
 			<option name=color value="2">핑크</option>
 			<option name=color value="3">보라</option>
			<option name=color value="4">네이비</option></select>
 		</td>
	</tr>
	<tr align="center" height="15">
 		<td align="left" width="100">* 사이즈</td>
 		<td align="right" width="250">
 			<select type=text name="goodsize">
 			<option name=size value="1" checked>==필수 옵션입니다==</option>
			<option name=size value="2">free</option></select>
 		</td>
	</tr>
	
	<tr align="center" height="15">
 		<td align="left" width="100">
 		<label for="spinner">* 수량</label>
 		</td>
 		<td align="right" width="250">  					
 			<input id="ea" name="value">
 		</td>
	</tr>
	<tr align="center" height="30">
 		<td align="left" width="100"></td>
 		<td align="right" width="250">
 		</td>
	</tr>
	<tr align="center" height="30">
 		<td colspan="2" align="center">
 		<input type="submit"   value="주문하기"> &nbsp;
		<input type="submit"  value="장바구니">&nbsp;
 		</td>
	</tr>
</table> 
<br><p>

<div id="img">
<h3>Product Info</h3>
  <div>
 <img src="${bean.pictureurl1}" ><br>
 <img src="${bean.pictureurl2}" ><br>
 <img src="${bean.pictureurl3}" ><br><br><br><br>
</div>

<h3>Size Info</h3>
 <div>
 <img src="../images/ss4.jpg" ><br><br><br><br>
</div> 	

<h3>Model Size</h3>
<div>
<img src="../images/ss5.jpg" ><br><br><br><br>
</div>

<h3>Review</h3>
<div>
	<jsp:include page="boardlist2.jsp"></jsp:include>
</div>

</div>
</body>
</html>






