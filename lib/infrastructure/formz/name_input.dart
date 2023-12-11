import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart';

enum NameError { empty, invalid, length}

class NameInput extends FormzInput<String, NameError> {
  // Call super.pure to represent an unmodified form input.
  const NameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == NameError.empty) return 'El campo es requerido';
    if(displayError == NameError.invalid) return 'El nombre solo puede contener letras';
    if(displayError == NameError.length) return 'El nombre debe tener entre 6 y 30 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return NameError.empty;
    if(!isAlpha(value)) return NameError.invalid;
    if(value.length < 6 || value.length > 30) return NameError.length;

    return null;
  }
}