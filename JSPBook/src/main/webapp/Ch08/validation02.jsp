<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form name="loginForm" action = "validation02_process.jsp" method="post" onsubmit="return false">
		<p> 아 이 디 : <input type="text" name="id">
		<p> 비밀번호 : <input type="password" name="passwd">
		<p> <input type="submit" value="전송" onclick="checkLogin()">
	</form>
	
	<script>
	function checkLogin(){
		var form = document.loginForm;
		if(form.id.value == ""){
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		}else if(form.id.value.length < 4 || form.id.value.length > 12){
				alert("비밀번호는 4자 이상 12자 미만으로 입력하세요");
				form.id.focus();
				return false;
		}else if (form.passwd.value==""){
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return false;
		}
		
		for(i=0; i<form.id.value.length;i++){
			var ch = form.id.value.charAt(i);
			
			if(ch<'a' || ch>'z'){
				alert("아이디는 영문 소문자만 입력 가능합니다");
				form.id.select();
				return;
			}
		}
		
		if(isNaN(form.passwd.value)){
			alert("비밀번호는 숫자만 입력가능합니다");
			form.passwd.select();
			return;
		}
		
		form.submit();
	}
	</script>
</body>
</html>