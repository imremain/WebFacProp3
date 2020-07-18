$(document).ready(function () {
    $('#btnIngresar').attr('disabled', true);

    $('input[type="text"]').on('keyup', function () {
        var txtNombre = $("#txtNombre").val();
        var txtDireccion = $('#txtDireccion').val();
        var txtTelefono = $('#txtTelefono').val();

        if (txtNombre != '' && txtDireccion != '' && txtTelefono != '') {
            $('#btnIngresar').attr('disabled', false);
        } else {
            $('#btnIngresar').attr('disabled', true);
        }
    });
});