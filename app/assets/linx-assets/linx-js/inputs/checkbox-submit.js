function checkBox(form = 'form:first', checkboxes = "[type='checkbox']"){
	$form = form;
	$checkboxes = $form.find(checkboxes);
	$checkboxes.click(function(event) {
		$form.find('[type=submit]').click();
	});
}