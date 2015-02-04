
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>join</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript">

	function check(){	
		var length = document.forms[0].length-1; 
		// submit을 제외한 모든 input태그의 갯수를 가져옴		 
		for(var i = 0; i < length; i++){     // 루프를 돌면서		 
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
		        alert(document.forms[0][i].name + "을/를 입력하세요."); // 경고창을 띄우고		 
		        document.forms[0][i].focus();           // null인 태그에 포커스를 줌		 
		        return false;		 
		    }//if end		
		}//for end
	
		//성별 체크 유무 확인
		if (sigin.gender[0].checked==false && sigin.gender[1].checked==false){
		 alert("성별을 체크해 주세요");
		 return false;
		}
	}//end
	
	function telcheck(){
		var tel=signin.tel.value;
		var num_check=/^[0-9]*$/;
		if(num_check.test(tel)){
			if( signin.tel.value.length < 9 || signin.tel.value.length > 11 ){
			alert("9~11글자만 입력할수 있습니다.");
			signin.tel.value="";
			signin.tel.focus();
			return false;
			}
			}
			else{
			alert ( "숫자만 입력할 수 있습니다." );
			signin.tel.value="";
			signin.tel.focus();
			return false;
			}
	}//end
	
	function checkid(){
		var a=signin.id.value;
		location.href = "search.do?id="+a;
	}//end
	
	function pass(){
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (signin.password1.value.length<4 || signin.password1.value.length>8){
			 document.getElementById("ch_pw1").innerHTML = "4~6자리를 입력해주세요.";
			 signin.password1.value="";
	         signin.password1.focus();
		}
		else{
			document.getElementById("ch_pw1").innerHTML = "";
		}
	}//end
	
	function pass1(){
		if(signin.password1.value!=signin.password2.value) {
			document.getElementById("ch_pw2").innerHTML = "비밀번호가 일치하지 않습니다";
            signin.password2.value="";
            signin.password1.value="";
            signin.password1.focus();
    	}else if (signin.password1.value==signin.password2.value) {
    		document.getElementById("ch_pw2").innerHTML = "일치 합니다.";
    	}
	}//end
	
	
	function emailcheck(){
		var email = signin.email.value;  
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   		  
		if(regex.test(email) === false) {  
		    alert("잘못된 이메일 형식입니다.");
		    signin.email.value="";
		    signin.email.focus();
		    return false;
		}//if end	
	}//end
	
	function zipcheck(){			
		var data = myform.zipcode.value;
		if(data==""){
		    alert("우편번호 데이타가 공백입니다");
			myform.zipcode.focus();
			return false; //아래문장을 수행하지 않고 탈출
		}
		open("zipCheck.jsp","title","titlebar=no,left=600,top=100,width=600,height=600");
	}		
</script>
</head>
<body>
	<div>It girl</div>
	<form name=myform method=get onsubmit="return check()" action=join.do>

		<table>
			<tr>
				<% String chch=(String)request.getAttribute("idid");
				String uu=(String)request.getAttribute("gg");
				if(uu==null){ uu="";}
				if(chch==null){	chch=""; }
			%>
				<td><input type="text" name="id" placeholder="아이디 영문,숫자 4~12자리"
					value="<%=uu %>" class="ta"> <input type=button
					value="ID중복확인" onClick="checkid()" class="bt">
					<div class="ta2">
						필수 정보입니다.<span class="ta3"><%=chch %></span>
					</div>
					<div id=hr></div></td>
			</tr>
			<tr>
				<td><input type=password name=password1 placeholder=비밀번호
					onblur="pass()" class="ta">
					<div class="ta2">
						필수 정보입니다.<span class="ta3" id="ch_pw1"></span>
					</div>
					<div id=hr></div></td>
			</tr>
			<tr>
				<td><input type=password name=password2 placeholder="비밀번호 재확인"
					onblur="pass1()" class="ta">
					<div class="ta2">
						필수 정보입니다.<span class="ta3" id="ch_pw2"></span>
					</div></td>
			</tr>
		</table>
		<p>
		<table id=login_tableF>
			<tr>
				<td><input type=text name=name placeholder="이름" class="ta">
					<div id=hr></div></td>
			</tr>
			<tr>
				<td>&nbsp;성별 <input type="radio" id="radio1" name="gender"
					value="남" checked><label for="radio1">남자</label> <input
					type="radio" id="radio2" name="gender" value="여"><label
					for="radio2">여자</label>
					<div id=hr></div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;BIRTH DAY <script type="text/javascript"> 
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
					<div id=hr></div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;주소 <input type=text name=zipcode placeholder=동이름
					class="ta4"> <input type=button onClick="zipcheck()"
					value=우편번호 onLoad="send( )" class="bt"> &nbsp;<input
					type=text name=addr class="ta"><br>
					<div id=hr></div>
				</td>
			</tr>
			<tr>
				<td><input type=text name=email placeholder="이메일"
					onblur="emailcheck()" class="ta">
					<div id=hr></div></td>
			</tr>
			<tr>
				<td><input type=text name=tel placeholder="연락처"
					onblur="telcheck()" class="ta">
					<div id=hr></div></td>
			</tr>
			<tr>
				<td>멤버십가입여부&nbsp;<input type=radio name=mem value="Membership"
					checked>Yes <input type=radio name=mem value="NON">No
				</td>
			</tr>
		</table>
		<div id=login_bottom>
			<input type=submit value="가입하기" class="bt2"> <a
				href=../index.jsp><input type=button value="메인화면" class="bt2"></a>
		</div>
	</form>

</body>
</html>