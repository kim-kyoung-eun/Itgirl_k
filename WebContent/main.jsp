<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>[main.jsp]</title>
<link rel="stylesheet" type="text/css" href="../css/shopping.css">
	<script type="text/javascript">
	   function  notice( ){
		   window.open("popup.jsp", "title", "toobar=no, menubar=no, width=555, height=685, left=200, top=100 ") ;
	   }//notice end
	</script>

</head>

<body onload="notice()">
<div id="main">
	<span><img src="images/main_01.png" id=mainImage alt="MainImage"></span>
	<span id="main2" ><img src="images/main_06.png"></span>
	<span id="main2" ><img src="images/main_05.png"></span>
	<span id="main2" ><img src="images/main_04.png"></span>

</div>
<div  id="item">
<span><img style="width:450px" src="images/hr.png"></span>
<span class="item">NEW ARRIVAL ITEM</span>
<span><img style="width:450px" src="images/hr.png"></span>
</div>
<div  id="main4">	
	<span id="main4"><a href="GuestServlet2?command=boarddetail2.do&idx=64"><img src="images/item_01.png"></a></span>
	<span id="main4"><a href="GuestServlet2?command=boardlist2.do"><img src="images/item_02.png"></a></span>
	<span id="main4"><a href="GuestServlet2?command=board2.do"><img src="images/item_03.png"></a></span>
	<span id="main4"><a href="./board2/goodDetail.jsp"><img src="images/item_04.png"></a></span>
</div>

<div  id="main4">
	<span id="main4"><img src="images/item_05.png"></span>
	<span id="main4" ><img src="images/item_06.png"></span>
	<span id="main4" ><img src="images/item_07.png"></span>
	<span id="main4" ><img src="images/item_08.png"></span>
</div>
<div  id="main4">
	<span id="main4"><img src="images/item_09.png"></span>
	<span id="main4" ><img src="images/item_10.png"></span>
	<span id="main4" ><img src="images/item_11.png"></span>
	<span id="main4" ><img src="images/item_12.png"></span>
</div>
<div id="item" style="padding-top: 30px;">
<span><img style="width:450px" src="images/hr.png"></span>
<span class="item">WEEKLY BEST ITEM</span>
<span><img style="width:450px" src="images/hr.png"></span>
</div>
<div  id="main4">	
	<span id="main4"><img src="images/item_13.png"></span>
	<span id="main4" ><img src="images/item_14.png"></span>
	<span id="main4" ><img src="images/item_15.png"></span>
	<span id="main4" ><img src="images/item_16.png"></span>
</div>

<div  id="main4">
	<span id="main4"><img src="images/item_17.png"></span>
	<span id="main4" ><img src="images/item_18.png"></span>
	<span id="main4" ><img src="images/item_19.png"></span>
	<span id="main4" ><img src="images/item_20.png"></span>
</div>
<div  id="main4">
	<span id="main4"><img src="images/item_21.png"></span>
	<span id="main4" ><img src="images/item_22.png"></span>
	<span id="main4" ><img src="images/item_23.png"></span>
	<span id="main4" ><img src="images/item_24.png"></span>
</div>

	<script>
var myImage=document.getElementById("mainImage");
var imageArray=["images/main_02.png","images/main_03.png"];
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



