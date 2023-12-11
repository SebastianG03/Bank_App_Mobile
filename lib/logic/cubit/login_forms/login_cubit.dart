
import 'package:bank_app_mobile/infrastructure/formz/formz.dart' show EmailInput, PasswordInput;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginFormState> {
  LoginCubit() : super(const LoginFormState());

  void onSubmit() {
    print('Submit $state');
    emit(
        state.copyWith(
          formStatus: FormStatus.validating,
          email: EmailInput.dirty( state.email.value),
          password: PasswordInput.dirty( state.password.value),
          isValid: Formz.validate([state.email, state.password]),
        )
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
      isValid: Formz.validate([password, state.email]),
    );
  }
}
