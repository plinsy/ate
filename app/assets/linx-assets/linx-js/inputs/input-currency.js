function loadInputCurrency(unit = 'Ar') {
    $(`input[currency="true"]`).keyup(function(event) {
        $unit = unit;

        if ($(this).val().includes($unit)) {
            $value = "";
            for (let i = 1; i < $(this).val().split(' ').length; i++) {
                $value += $(this).val().split(' ')[i];
            }
        } else {
            $value = $(this).val();
        }
        $(this).val($unit + " " + $value);
    });
}