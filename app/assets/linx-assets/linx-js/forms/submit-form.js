function submitForm(form_tag = 'form', loader = '<div class="pre-loader">Loading...</div>') {
    $forms = $(form_tag), $loader = loader;
    $forms.submit(function(event) {
    	event.preventDefault();
        $form = $(this);
    	$form.addClass('disabled');
    	$initialContent = $form.children(`[type=submit]`).html();
        $form.children(`[type=submit]`).html($loader);
        $form.children(`[type=submit]`).html($loader);

    	$url = $form.attr('action');
    	$method = $form.data('method');
    	$dataType = $form.data('remote') == true ? 'script' : 'html';
    	$data = $form.serialize();

    	$.ajax({
    		url: $url,
    		type: $method,
    		dataType: $dataType,
    		data: {$data}
    	})
    	.done(function() {
    		console.log("success");
    		$form.removeClass('disabled');
        	$form.children(`[type=submit]`).html($initialContent);
    	})
    	.fail(function() {
    		console.log("error");
    	})
    	.always(function() {
    		console.log("complete");
    	});
    });

}