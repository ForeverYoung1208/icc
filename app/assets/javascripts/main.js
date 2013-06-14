$(document).ready(function(){
	$('#menu li').hover(
		function(){
			$(this).find('a').filter(':not(:animated)').animate({
				"background-color": "#FFE0E0"
			});
		},
		function(){
			$(this).find('a').animate({
				"background-color": "#FFFFFF"
			});
		}
	);

	$('#menu li').on("click", function(event){
		$('#menu').find('a').removeClass('selected',300);
		$(this).find('a').css({'background-color':'#F2C2C2'});
		$(this).find('a').addClass('selected',300);
	});
})
