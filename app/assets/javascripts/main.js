$(document).ready(function(){
	$('#menu li').on("mouseenter", function(){
				$(this).find('a').animate({
				"background-color": "#FFF9F9",
		})
	});
	$('#menu li').on("mouseleave", function(){
				$(this).find('a').animate({
				"background-color": "#FFFFFF",
		}).queue(function(){
	        $(this).queue("fx", [])
        });
	});
	$('#menu li').on("click", function(event){
				event.preventDefault();
				$(this).find('a').explode;
	});
})
