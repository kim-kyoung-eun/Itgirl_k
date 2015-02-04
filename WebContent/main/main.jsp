<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<title>[main.jsp]</title>
<style>
@import url('css/shopping.css');
</style>
</head>

<body>
<table>

</table>
<div id="main">
	<span><img src="../images/main_01.png" id=mainImage alt="MainImage"></span>
	<span id="main2" ><img src="../images/main_04.png"></span>
	<span id="main2" ><img src="../images/main_05.png"></span>
	<span id="main2" ><img src="../images/main_06.png"></span>
	<div id="main2" style=" position: absolute; top:448px; right:242px; width:610px; height:190px;"><img style="width:610px; height:190px;" src="../images/main_07.png"></div>
</div>
<div>
	<span id="main3"><img src="../images/main_event_01.jpg"></span>
	<span id="main3" ><img src="../images/main_event_02.jpg"></span>
	<span id="main3" ><img src="../images/main_event_03.jpg"></span>
	<span id="main3" ><img src="../images/main_event_04.jpg"></span>
</div>
<div  id="item">
<span><img style="width:450px" src="../images/hr.png"></span>
<span class="item">NEW ARRIVAL ITEM</span>
<span><img style="width:450px" src="../images/hr.png"></span>
</div>
<div  id="main4">	
	<span id="main4"><img src="../images/item_01.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
	<span id="main4" ><img src="../images/item_02.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
</div>

<div  id="main4">
	<span id="main4"><img src="../images/item_01.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
	<span id="main4" ><img src="../images/item_02.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
</div>
<div  id="main4">
	<span id="main4"><img src="../images/item_01.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
	<span id="main4" ><img src="../images/item_02.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
</div>
<div id="item" style="padding-top: 30px;">
<span><img style="width:450px" src="../images/hr.png"></span>
<span class="item">WEEKLY BEST ITEM</span>
<span><img style="width:450px" src="../images/hr.png"></span>
</div>
<div  id="main4">	
	<span id="main4"><img src="../images/item_01.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
	<span id="main4" ><img src="../images/item_02.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
</div>

<div  id="main4">
	<span id="main4"><img src="../images/item_01.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
	<span id="main4" ><img src="../images/item_02.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
</div>
<div  id="main4">
	<span id="main4"><img src="../images/item_01.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
	<span id="main4" ><img src="../images/item_02.png"></span>
	<span id="main4" ><img src="../images/item_03.png"></span>
</div>
	<script>
var myImage=document.getElementById("mainImage");
var imageArray=["../images/main_02.png","../images/main_03.png"];
var imageIndex=0;

function changeImage(){
	myImage.setAttribute("src",imageArray[imageIndex]);
	imageIndex++;
	if(imageIndex>=imageArray.length){
		imageIndex=0;
	}
}
setInterval(changeImage,3000);
</script>

</body>
</html>



