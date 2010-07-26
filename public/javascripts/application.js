function handleChooserHover() {
	$('.type-chooser').hover(function() {
		$(this).find('.options').show();
	}, function() {
		$(this).find('.options').hide();
	});
}

$(document).ready(function() {
	handleChooserHover();
});