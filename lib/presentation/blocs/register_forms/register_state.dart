part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable{

  final FormStatus formStatus;
  final bool isValid;
  final NameInput name;
  final String email;
  final PasswordInput password;
  final String cedula;
  final String phone;


  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.name = const NameInput.pure(),
    this.isValid = false,
    this.email = "",
    this.password = const PasswordInput.pure(),
    this.cedula = "",
    this.phone = ""
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    NameInput? name,
    bool? isValid,
    String? email,
    PasswordInput? password,
    String? cedula,
    String? phone
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    cedula: cedula ?? this.cedula,
    phone: phone ?? this.phone
  );

  @override
  List<Object> get props => [formStatus, isValid, name, email, password, cedula, phone];

}
