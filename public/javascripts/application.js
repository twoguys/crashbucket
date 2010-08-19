function handleChooserHover() {
	$('.type-chooser').hover(function() {
		$(this).find('.options').show();
	}, function() {
		$(this).find('.options').hide();
	});
}

function setupTableSorting() {
  $('table.tablesorter').tablesorter();
}

$(document).ready(function() {
	handleChooserHover();
	setupTableSorting();
});