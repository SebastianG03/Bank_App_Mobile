import 'package:formz/formz.dart';

enum EmailError { empty, invalid}

class EmailInput extends FormzInput<String, EmailError> {

  static final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty(super.value) : super.dirty();


  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == EmailError.empty) return 'El campo es requerido';
    if(displayError == EmailError.invalid) return 'El correo ingresado no posee el formato apropiado';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if(!emailRegExp.hasMatch(value)) return EmailError.invalid;
    return null;
  }
}