<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

function CheckAddProduct(){

	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");

	if(!check(/^P[0-9]{4,11}$/, productId,
		"[상품 코드]\nP와 숫자를 조합하여 5~12자 까지 입력하세요\n 첫 글자는 반드시 P로 시작하세요."))
		return false;
		
	if(name.value.length < 4 || name.value.length > 12){
		alert("[상품명]\n 최소 4자리에서 최대 12자까지 입력하세요.");
		name.select();
		name.focus();
		return.false;
	}	
	
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;	
		}
		
	if(unitPrice.value < 0 ){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;	
		}else if ()
		
}

</body>
</html>