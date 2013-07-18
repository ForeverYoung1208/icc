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

	$('.tile').hover(
		function(){
			$(this).filter(':not(:animated)').animate({
				boxShadow: "10px 10px 6px 2px #AA5252"
			});
		},
		function(){
			$(this).animate({
				boxShadow: "4px 4px 6px 2px #777777"
			});
		}
	);

	$('.tile').on("click", function(event){
		$(this).stop().animate({
			boxShadow: "1px 1px 6px #777777 50"
		});
		$('#notice').hide('fade');
		$('#content').hide('fade');
		$('#menu').find('a').removeClass('selected',300);
	});


	$('#menu a').on("click", function(event){
		$('#notice').hide('fade');
		$('#content').hide('fade');
		$('#menu').find('a').removeClass('selected',300);
		$(this).css({'background-color':'#F2C2C2'});
		$(this).addClass('selected',300);
	});

})
