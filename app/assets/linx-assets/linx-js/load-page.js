function loadPage(page_id = '', first_link='/') {
    $links = $(`[data-reload='false']`);
    $lis = $links.parent('li');

    $links.click(function(event) {
        event.preventDefault();
        $lis.removeClass('active');
        $(this).parent('li').addClass('active');
        $url = $(this).attr('href');
        $loader = '<div>Loading...</div>';

        $.ajax({
            url: $url,
            type: 'GET',
            dataType: 'script',
            data: {
                page_id: page_id
            },
            beforeSend: function() {
        		$(`#${page_id}`).html($loader);
            },
            success: function(response) {
            },
            complete: function(data) {
            }
        });
    });
    
    $(`[href='${first_link}']`).click();
}