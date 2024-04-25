window.onload=function(){
	const myForm = document.getElementById('myForm');
	// 이벤트 연결
	myForm.onsubmit = function(){
		const items = document.querySelectorAll('input[type="text"], input[type="number"]');
		for(let i = 0; i < items.length; i++){
			if(items[i].value.trim() == ''){
				const label = document.querySelector('label[for="' + items[i].id + '"]');
				alert(label.textContent + ' 항목은 필수 입력입니다.');
				items[i].value ='';
				items[i].focus();
				return false;
			}
		}		
	};
};