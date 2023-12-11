import 'package:formz/formz.dart';

enum AmountError { empty, format }

class AmountInput extends FormzInput<String, AmountError> {
  static final RegExp numberRegExp = RegExp(r'^[0-9]+(\.[0-9]{0,2})?$');

  const AmountInput.pure() : super.pure('');
  const AmountInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AmountError.empty) return 'El campo es requerido';
    if (displayError == AmountError.format) return 'El valor debe ser un número positivo con el siguiente formato (1.50)';
    return null;
  }

  @override
  AmountError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return AmountError.empty;
    if (!numberRegExp.hasMatch(value)) return AmountError.format;
    return null;
  }
}