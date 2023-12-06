import 'package:formz/formz.dart';

enum PasswordError { empty, length}

class PasswordInput extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == PasswordError.empty) return 'El campo es requerido';
    if(displayError == PasswordError.length) return 'La contraseña debe tener entre 8 y 20 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if(value.length < 8 || value.length > 20) return PasswordError.length;
    return null;
  }
}