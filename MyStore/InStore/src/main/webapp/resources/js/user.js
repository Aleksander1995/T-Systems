/*
$(document).ready(function () {
	alert("ready");
	$('img#edit-user').click(function (e) {
		alert(e.innerHTML);
	});
});*/
function showParam(e){
	if($('form#'+e).is(":visible")){
		$('form#'+e).hide();
		return;
	}
	if($('form#'+e).is(':hidden')){
		$('form#'+e).show();
	}
}
function edit() {
	if($('#edit-user').is(":visible")){
		$('.img-form').hide();
		$('.form').hide();
		$('#edit').html('Редактировать пользователя');
		return;
	}
	if($('#edit-user').is(":hidden")){
		$('.img-form').show();
		$('#edit').html('Отменить редактирование');
	}
}