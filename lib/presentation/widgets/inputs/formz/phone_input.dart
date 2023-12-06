import 'package:formz/formz.dart';

enum DniError { empty, length, format}

class DniInput extends FormzInput<String, DniError> {

  static final RegExp dniRegExp = RegExp(r'\d');


  // Call super.pure to represent an unmodified form input.
  const DniInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const DniInput.dirty(String value) : super.dirty(value);


  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == DniError.empty) return 'El campo es requerido';
    if(displayError == DniError.format) return 'La cédula no es válida';
    if(displayError == DniError.length) return 'La cédula debe estar conformada de 10 números';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  DniError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return DniError.empty;
    if(!dniRegExp.hasMatch(value)) return DniError.format;
    if(value.length != 10) return DniError.format;
    return null;
  }
}