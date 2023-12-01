class ValidateForms {
  const ValidateForms();

  String validate({required String etiqueta, required String content}) {
    return switch(etiqueta) {
      "email" => _validateEmail(content),
      "password" => _validatePassword(content),
      "name" => _validateName(content),
      "lastName" => _validateLastName(content),
      "dni" => _validateDni(content),
      "phone" => _validatePhone(content),
      _ => "Etiqueta inválida"
    };
  }

  String _validateEmail(String email) {
    return "";
  }

  String _validatePassword(String password) {
    return "";
  }

  String _validateName(String name) {
    return "";
  }

  String _validateLastName(String lastName) {
    return "";
  }

  String _validateDni(String dni) {
    return "";
  }

  String _validatePhone(String phone) {
    return "";
  }

}