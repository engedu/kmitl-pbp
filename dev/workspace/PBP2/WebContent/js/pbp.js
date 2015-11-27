/*$().ready(function() {
	closeWaiting();
	$('a[rel!=notLoading]').click(function(){
		openWaiting();
	});

	$('.button[rel!=notLoading]').click(function(){
		openWaiting();
	});
});
*/
var flagConfirm=false;
function confirmPage(msg){
	if(confirm(msg)){
		flagConfirm=false;
		return true;
	}else{
		flagConfirm=true;
		return false;
	}
}