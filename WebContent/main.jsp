<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head> <title> [main.jsp] </title> 
<link rel="stylesheet" type="text/css' href="css/common.css">
<link href="css/skitter.styles.css" type="text/css" media="all" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/jquery.skitter.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>
<script>
$(function(){
// $('.box_skitter_large').skitter();
//�� �������� �׺���̼� ����
// $('.box_skitter_large').skitter({dots: true});
//�̸����� , �ڸ� ����
 $('.box_skitter_large').skitter({thumbs: true,label: true});
//�̸�����, �ڸ� ���� ����
// $('.box_skitter_large').skitter({thumbs: true,label: false});
//�� �������� ����� �����ϸ鼭 �̸����� ����
// $('.box_skitter_large').skitter({dots: true, preview: true});
// $('.box_skitter_large').skitter({controls: true});
//$('.box_skitter_large').skitter({mouseOverButton: function() {alert("over"); }});
});
</script>


<style> 
* {  padding:0;  }



</style>
</head>

<body>

<div class="box_skitter box_skitter_large">

    <ul>
        <li>
           <a href="template.jsp"><img src="images/0620030001993.jpg" class="random" /></a> 
            <div class="label_text">
                <p>.......<br>
                .................. </p>
            </div>
        </li>
        <li>
           <a href="template.jsp"><img src="images/0620030001993.jpg" class="random" /></a>

            <div class="label_text">
                <p> TGIF���θ� �α��ǰ<br> ȭ���� �̺�Ʈ�� ��¥��ǰ </p>
            </div>
        </li>
        <li>
           <a href="template.jsp"><img src="images/0620030001993.jpg" class="random" /></a>
            <div class="label_text">
                <p>********<br>
                ***************** </p>
            </div>
        </li>
    </ul>

</div>
</body>
</html>



