function scrollHere(where_id = 'scroll-here') {
	$('html, body').animate({ scrollTop: $(`#${where_id}`).offset().top }, 1000, function() {});
}
