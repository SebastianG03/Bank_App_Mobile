import 'package:formz/formz.dart';

enum PhoneError { empty, length, format}

class PhoneInput extends FormzInput<String, PhoneError> {

  static final RegExp phoneRegExp = RegExp(r'\d');


  // Call super.pure to represent an unmodified form input.
  const PhoneInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PhoneInput.dirty(super.value) : super.dirty();


  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == PhoneError.empty) return 'El campo es requerido';
    if(displayError == PhoneError.format) return 'La número no es válido';
    if(displayError == PhoneError.length) return 'La el número debe tener el siguiente formato 0xxxxxxxxx';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PhoneError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return PhoneError.empty;
    if(!phoneRegExp.hasMatch(value)) return PhoneError.format;
    if(value.length != 10) return PhoneError.length;
    return null;
  }
}