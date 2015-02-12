<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title>★Welcome It girl ★</title> 
<link href="css/skitter.styles.css" type="text/css" media="all" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/jquery.skitter.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<script>
$(function(){
// $('.box_skitter_large').skitter();
//점 형식으로 네비게이션 제공
// $('.box_skitter_large').skitter({dots: true});
//미리보기 , 자막 제공
 $('.box_skitter_large').skitter({thumbs: true,label: true});
//미리보기, 자막 제공 안함
// $('.box_skitter_large').skitter({thumbs: true,label: false});
//점 형식으로 썸네일 제공하면서 미리보기 제공
// $('.box_skitter_large').skitter({dots: true, preview: true});
// $('.box_skitter_large').skitter({controls: true});
//$('.box_skitter_large').skitter({mouseOverButton: function() {alert("over"); }});
});
</script>
</head>
<body>
<div id="main">
<span>
		<div class="box_skitter box_skitter_large">
		    <ul>
		        <li>
		           <a href="template.jsp"><img src="images/pop_item01.png" width="600" height=450" id=mainImage alt="MainImage"></a> 
		        </li>
		        <li>
		           <a href="template.jsp"><img src="images/pop_item02.png" width="600" height=450"></a> 
		        </li>
		        <li>
		           <a href="template.jsp"><img src="images/pop_item03.png" width="600" height=450"></a> 
		        </li>		        
		        <li>
		           <a href="template.jsp"><img src="images/pop_item04.png" width="600" height=450"></a> 
		        </li>	
		        <li>
		           <a href="template.jsp"><img src="images/pop_item05.png" width="600" height=450"></a> 
		        </li>	
		    </ul>
		   
		</div>
	<!-- <img src="images/main_01.png" id=mainImage alt="MainImage"> -->
	
</span>
<div><img style="width:536;" src="images/main_07.png"></div>
</body>
</html>






