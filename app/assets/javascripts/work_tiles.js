// Change color when hover over
$('.work-hover').hover(function() {
	$(this).siblings('.tile-text').fadeTo("fast", 0);
	$(this).siblings('.overlay').css("background-color", "rgba(0, 0, 0, 0)");
}, function(){
	$(this).siblings('.tile-text').fadeTo("fast", 1.0);
	$(this).siblings('.overlay').css("background-color", "rgba(0, 0, 0, 0.8)");
});