$(document).ready(function(){
	$('#menu li').on("mouseenter", function(){
				$(this).find('a').animate({
				"background-color": "#FFE0E0",
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
				$('#content').effect('fade');
				$.ajax({
					url:"services"
				}).done(function(){
					$('#content').effect('fade');
				});
	});
})
