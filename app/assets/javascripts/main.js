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


	$('#menu a').on("click", function(event){
		$('#notice').hide('fade');
		$('#content').hide('fade');
		$('#menu').find('a').removeClass('selected',300);
		$(this).css({'background-color':'#F2C2C2'});
		$(this).addClass('selected',300);
	});

})
