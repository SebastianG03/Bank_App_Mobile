import 'package:bank_app_mobile/presentation/widgets/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit $state');
    // emit(state.copyWith(formStatus: FormStatus.validating));
  }

  void nameChanged(String value) {
    final NameInput username = NameInput.dirty(value: value);
    state.copyWith(
      name: username,
      isValid: Formz.validate([username, state.password]),
    );
  }
  void emailChanged(String value) {
    state.copyWith(
      email: value,
    );
  }
  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value: value);
    state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.name]),
    );
  }
  void cedulaChanged(String value) {
    state.copyWith(
      cedula: value,
    );
  }
  void phoneChanged(String value) {
    state.copyWith(
      phone: value,
    );
  }
}
