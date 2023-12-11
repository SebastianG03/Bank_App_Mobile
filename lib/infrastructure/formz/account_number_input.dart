import 'package:formz/formz.dart';

enum AccountError { empty, format}

class AccountInput extends FormzInput<String, AccountError> {

  static final RegExp accountRegExp = RegExp(r'\d');


  // Call super.pure to represent an unmodified form input.
  const AccountInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const AccountInput.dirty(super.value) : super.dirty();


  String? get errorMessage {
    if(isValid || isPure) return null;
    if(displayError == AccountError.empty) return 'El campo es requerido';
    if(displayError == AccountError.format) return 'El número de cuenta no es válido';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  AccountError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return AccountError.empty;
    if(!accountRegExp.hasMatch(value)) return AccountError.format;
    return null;
  }
}