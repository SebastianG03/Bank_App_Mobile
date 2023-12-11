part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating }

class LoginFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final EmailInput email;
  final PasswordInput password;


  const LoginFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  LoginFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    EmailInput? email,
    PasswordInput? password,
  }) => LoginFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  List<Object> get props => [formStatus, isValid, email, password];

}
