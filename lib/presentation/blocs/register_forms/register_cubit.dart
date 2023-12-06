import 'package:bank_app_mobile/presentation/widgets/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit $state');
    emit(
        state.copyWith(
          formStatus: FormStatus.validating,
          name: NameInput.dirty( state.name.value),
          email: EmailInput.dirty( state.email.value),
          password: PasswordInput.dirty( state.password.value),
          cedula: DniInput.dirty(state.dni.value),
          phone: state.phone,
          isValid: Formz.validate([state.name, state.email, state.password, /*state.cedula, state.phone*/]),
        )
    );
  }

  void nameChanged(String value) {
    final NameInput username = NameInput.dirty(value);
    state.copyWith(
      name: username,
      isValid: Formz.validate([username, state.password]),
    );
  }
  void emailChanged(String value) {
    final EmailInput email = EmailInput.dirty(value);
    state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    );
  }
  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.name]),
    );
  }
  void cedulaChanged(String value) {
    final DniInput cedula = DniInput.dirty(value);
    state.copyWith(
      cedula: cedula,
      isValid: Formz.validate([cedula, state.name]),
    );
  }
  void phoneChanged(String value) {
    state.copyWith(
      phone: value,
    );
  }
}
