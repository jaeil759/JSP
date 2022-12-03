function CheckAddProduct() {
	var bookId = document.getElementById("bookId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	// 도서 아이디가 ISBN으로 시작되고 숫자를 포함하며 문자 길이가 5~12자인지 검사
	var regExpId = /^ISBN[0-9]{4,11}$/;
	if(!check(/^ISBN[0-9]{1,8}$/, bookId, "[도서코드]\n ISBN과 숫자를 조합하여 5~12자까지 입력하세요.\n첫글자는 반드시 ISBN으로 시작하세요")){
		return false;
	}
	
	// 도서명의 문자 길이가 4~12자인지 검사
	if(name.value.length<4 || name.value.length>12){
		alert("[도서명] 문자길이는 4~12자 이내로 작성해주세요.");
		name.select();
		name.focus();
		return false;
	}
	
	// 가격의 문자 길이가 0인지 숫자인지 검사
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("가격 문제 있음");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	// 가격이 음수인지 검사
	if(unitPrice.value < 0){
		alert("가격이 음수");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	// 재고수가 숫자인지 검사
	if(isNaN(unitsInStock.value)){
		alert("재고수는 숫자로 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
}