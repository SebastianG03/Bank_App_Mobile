import 'package:formz/formz.dart';

enum EmailError { empty, invalid}

class EmailInput extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    const String regex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if(value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if(!RegExp(regex).hasMatch(value)) return EmailError.invalid;
    return null;
  }
}