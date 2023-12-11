
import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/logic/cubit/register_forms/register_cubit.dart';
import 'package:bank_app_mobile/infrastructure/model/models.dart';
import 'package:bank_app_mobile/infrastructure/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/inputs/inputs.dart';
import '../../widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  bool _obscureTextPassword = true;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'name': '',
    'email': '',
    'password': '',
    'phone': '',
    'cedula': '',
    'role': 'client',
  };
  Util util = Util();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 30.0),
      physics: const ClampingScrollPhysics(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 23.0),
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: _formContent(context, width, height),
            ),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  Widget space(BuildContext context) {
    return Container(
      width: 250.0,
      height: 1.0,
      color: Colors.grey[400],
    );
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  Widget _formContent(BuildContext context, double width, double height) {
    return Form(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: BlocBuilder<RegisterCubit, RegisterFormState>(
              builder: (context, state) => _registerForm(context, state),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: height * 0.8),
            decoration: CustomTheme.loginPageBtnContainerDecoration,
            child: BlocBuilder<RegisterCubit, RegisterFormState>(
              builder: (context, state) => _registerButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerForm(BuildContext context, RegisterFormState state) {
    RegisterCubit registerCubit = context.read<RegisterCubit>();
    final email = state.email;
    final name = state.name;
    final phone = state.phone;
    final dni = state.dni;
    final password = state.password;

    return SizedBox(
      width: 300.0,
      height: 600.0,
        child: Column(
          children: <Widget>[
            TextFormsModel(textInputType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Nombre', icon: Icon(FontAwesomeIcons.person)),
                onChanged: (String value) {
                  formValues['name'] = value;
                  registerCubit.nameChanged(value);
                },
              validator: (String? value) {
                return state.name.errorMessage;
              },
            ),
            space(context),
            TextFormsModel(textInputType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email', icon: const Icon(FontAwesomeIcons.envelope), errorText: email.errorMessage),
              onChanged: (String value) {
                  formValues['email'] = value;
                  registerCubit.emailChanged(value);
                },),
            space(context),
            TextFormsModel(textInputType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Teléfono', icon: const Icon(FontAwesomeIcons.phone), errorText: phone.errorMessage),
                onChanged: (String value) {
                  formValues['phone'] = value;
                  registerCubit.phoneChanged(value);
                },),
            space(context),
            TextFormsModel(textInputType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Cédula', icon: const Icon(FontAwesomeIcons.idCard), errorText: dni.errorMessage),
                onChanged: (String value) {
                  formValues['dni'] = value;
                  registerCubit.cedulaChanged(value);
                },),
            space(context),
            PasswordFormsModel(textInputType: TextInputType.visiblePassword, label: 'Contraseña',
                onChanged: (String value) {
                  registerCubit.passwordChanged(value);
                  formValues['password'] = value;
                }, errorMessage: password.errorMessage, tap: _toggleSignup, obscureText: _obscureTextPassword),
            space(context),
          ],
        ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return MaterialButtonModel(highlightColor: Colors.transparent, splashColor: CustomTheme.loginGradientEnd
        , content: 'Crear Cuenta', onPressed: () => _signupButtonOnPressed(context), padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
        textColor: Colors.white, fontSize: 25.0, fontFamily: 'WorkSansBold');
  }

  void _signupButtonOnPressed(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    RegisterCubit registerCubit = context.read<RegisterCubit>();
    registerCubit.onSubmit();
    bool isValid = registerCubit.state.isValid;
    print(isValid);

    if(isValid) {
      User user = User(idUser: util.users.length, name: formValues['name']!, email: formValues['email']!,
          password: formValues['password']!, phone: formValues['phone']!, role: formValues['role']!, dni: formValues['dni']!);
      BankAccount bankAccount = BankAccount(idAccount: util.bankAccounts.length,
          idUser: user.idUser!, accountNumber: Util().bankAccounts.length, accountAmount: 0.0);
      print('email: ${formValues['email']}');
      print('password: ${formValues['password']}');

      util.users.add(user);
      util.bankAccounts.add(bankAccount);

      Alerts.androidAlertDialog(context: context, title: 'Usuario registrado con éxito', message: 'Por favor inicie sesión');
    } else {
      Alerts.androidAlertDialog(context: context, title: 'Error', message: 'No se pudo crear su cuenta, verifique sus datos');
    }
  }
}