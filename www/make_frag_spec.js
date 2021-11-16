$(document).on("shiny:connected", function(e) {
	$("body").addClass("sidebar-mini");
	$('.dropdown-menu').css('width', window.innerWidth/4.8);
});

$(document).on("click", "#draw", function() {
	Shiny.onInputChange("input_table_draw", Math.random()); 
	Shiny.onInputChange("input_table_vals", 
		$("#input_table input").toArray().map(x => x.value));
})