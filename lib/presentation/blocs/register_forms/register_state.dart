part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable{

  final FormStatus formStatus;
  final bool isValid;
  final NameInput name;
  final EmailInput email;
  final PasswordInput password;
  final DniInput dni;
  final String phone;


  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.name = const NameInput.pure(),
    this.isValid = false,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.dni = const DniInput.pure(),
    this.phone = ""
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    NameInput? name,
    bool? isValid,
    EmailInput? email,
    PasswordInput? password,
    DniInput? cedula,
    String? phone
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    dni: cedula ?? this.dni,
    phone: phone ?? this.phone
  );

  @override
  List<Object> get props => [formStatus, isValid, name, email, password, dni, phone];

}
