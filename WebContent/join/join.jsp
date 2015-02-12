<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/shopping.css">
<script type="text/javascript">
	function check() {
		var length = document.forms[0].length - 1;
		// submit을 제외한 모든 input태그의 갯수를 가져옴		 
		for (var i = 0; i < length; i++) { // 루프를 돌면서		 
			if (document.forms[0][i].value == null
					|| document.forms[0][i].value == "") {
				alert(document.forms[0][i].name + "을/를 입력하세요."); // 경고창을 띄우고		 
				document.forms[0][i].focus(); // null인 태그에 포커스를 줌		 
				return false;
			}//if end		
		}//for end

		//성별 체크 유무 확인
		if (sigin.gender[0].checked == false
				&& sigin.gender[1].checked == false) {
			alert("성별을 체크해 주세요");
			return false;
		}
	}//end


function checkid() {
		if (signin.id.value == "") {
			alert("아이디가 공백입니다.");
			signin.id.focus();
			return;
		}
		open("./join/openID.jsp", "title",
				"toobar=no, menubar=no, width=400, height=150, left=400, top=300 ");
	
	}//end

	function pass() {
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (signin.password1.value.length<4 || signin.password1.value.length>8) {
			document.getElementById("ch_pw1").innerHTML = "4~6자리를 입력해주세요.";
			signin.pw1.value = "";
			signin.pw1.focus();
		} else {
			document.getElementById("ch_pw1").innerHTML = "";
		}
	}//end

	function pass1() {
		if (signin.pw1.value != signin.pw2.value) {
			document.getElementById("ch_pw2").innerHTML = "비밀번호가 일치하지 않습니다";
			signin.pw2.value = "";
			signin.pw1.value = "";
			signin.pw1.focus();
		} else if (signin.pw1.value == signin.pw2.value) {
			document.getElementById("ch_pw2").innerHTML = "일치 합니다.";
		}
	}//end

	function zipcheck(){			
		var data = signin.zipcode.value;
		if(data==""){
		    alert("우편번호 데이타가 공백입니다");
			signin.zipcode.focus();
			return false; //아래문장을 수행하지 않고 탈출
		}
		open("./join/zipCheck.jsp","title","titlebar=no,left=600,top=100,width=600,height=600");
	}		
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>
</head>
<body>
	<center>
	<!--  <form name="signin" action="./join/joinSave.jsp">-->
	<form name=signin method=get onsubmit="return check()" action=./join/join.do>
		<table id="j_ta1">
			<tr><td colspan="4" class="title" align="center" height="30px" bgcolor="#F384AE">회원 정보 입력 하기</td></tr>
			
			<tr>
				<td class="td1" colspan="2">&nbsp;이름 : &nbsp;&nbsp;<input type=text name=name></td>
				<td class="td1" colspan="2">&nbsp;아이디 : &nbsp;&nbsp;<input type="text" name="id">
					&nbsp;&nbsp;<input type=button class="bt" value="ID중복확인" onClick="checkid()">
				</td>
			</tr>
			<tr>
				<td class="td1" colspan="2">&nbsp;비밀번호 :&nbsp;&nbsp;<input type=password name=pw1 onblur="pass()" class="ta">
					<div class="ta2">
						<span class="ta3" id="ch_pw1"></span>
					</div>
				<td class="td1" colspan="2">&nbsp;비밀번호확인 :&nbsp;&nbsp;<input type=password name=pw2
					onblur="pass1()" class="ta">
					<span class="ta3" id="ch_pw2"></span>
				</td>
			</tr>
			<tr>
				<td class="td1" colspan="2">&nbsp;생일/성별 : &nbsp;
					<script type="text/javascript"> 
						var today = new Date(); 
						var toyear = parseInt(today.getYear()); 
						var start = (toyear+1900) - 5;
						var end = (toyear+1900) - 70; 
						
						document.write("<font size=2><select name=year>"); 
						document.write("<option value='' placeholder=생년 selected>"); 
						for (i=start; i>=end;i--) document.write("<option>"+i); 
						document.write("</select>년  "); 
						
						document.write("<select name=month>"); 
						document.write("<option value='' placeholder=월 selected>"); 
						for (i=1; i<=12;i++) document.write("<option>"+i); 
						document.write("</select>월  "); 
						
						document.write("<select name=day>"); 
						document.write("<option value='' placeholder=일 selected>"); 
						for (i=1; i<=31;i++) document.write("<option>"+i); 
						document.write("</select>일  </font>"); 
					</script> 
				</td>
			
				<td id="td1" colspan="2" >
				&nbsp;<input type="radio" id="radio1" name="gender"
						value="남" checked><label for="radio1">남</label>&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="radio" id="radio2" name="gender" value="여"><label
						for="radio2">여</label>
				</td>
			</tr>
			<tr>
		    	<td colspan="4">
			    	&nbsp;우편번호 : 
			 
					<input type=text name=zipcode  class="ta4" size="30">
				    <input type=button onClick="zipcheck()" value=우편번호 onLoad="send( )" class="bt">
		    	</td>
		    </tr>
		    <tr>
			    <td colspan="4">&nbsp;상세주소 : <input type=text name=addr class="ta" style="width:250px">
			    	<div id=hr></div>
			    </td>
 			</tr>
			<tr>
				<td colspan="4" align="center"><img width="580px" src="./images/hr.jpg"></td>
			</tr>
					
				<tr>
					<td colspan="4"> &nbsp;이메일 : &nbsp;<input type="text" name="email"
						style="width:250px" id="email"></td>
				</tr>
				<tr>
					<td colspan="4"> &nbsp;연락처 : &nbsp;<input type="text" name="phone" style="width:250px" /> 
				</tr>
				<tr>
					<td  colspan="4"> &nbsp;권한 : &nbsp;<input type="radio" name="admin" value="0"
						 />관리자 <input type="radio" name="admin" value="1" checked="checked"/>사용자
					</td>
				</tr>
			<tr>
				<td colspan="4" align="center">
					 <input type="submit" class="bt" value="전송" style="height: 30px; width: 55px;">&nbsp;&nbsp;&nbsp;
					<input type="reset" class="bt" value="취소" style="height: 30px; width: 55px;">
				</td>
			</tr>
		</table>
		
		</form>

	</center>
</body>
</html>