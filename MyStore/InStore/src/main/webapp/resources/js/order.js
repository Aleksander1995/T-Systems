var a;

function show(e){
	a=document.querySelector('#price').innerHTML;
	document.querySelector('#payment').innerHTML=(parseFloat(a*e));
}
	
	