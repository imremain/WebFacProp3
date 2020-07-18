$(document).ready(function () {
    $('#btnIngresar').attr('disabled', true);

    function validarCorreo(correo) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(correo);
    }

    $('input[type="text"]').on('keyup', function () {
        var nombre = $("#txtNombre").val();
        var correo = $("#txtCorreo").val();
        var direccion = $('#txtDireccion').val();
        var telefono = $('#txtTelefono').val();
        var cp = $("#txtCp").val();
        var rfc = $("#txtRFC").val();

        if (nombre != '' && correo != '' && direccion != '' && telefono != '' && cp != '' && rfc != '' && validarCorreo(correo)) {
            $('#btnIngresar').attr('disabled', false);
        } else {
            $('#btnIngresar').attr('disabled', true);
        }
    });
});