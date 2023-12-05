import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart';

enum NameError { empty, invalid, length}

class NameInput extends FormzInput<String, NameError> {
  // Call super.pure to represent an unmodified form input.
  const NameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return NameError.empty;
    if(!isAlpha(value)) return NameError.invalid;
    if(value.length < 6 || value.length > 30) return NameError.length;

    return null;
  }
}