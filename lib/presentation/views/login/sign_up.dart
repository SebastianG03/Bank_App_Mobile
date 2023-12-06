
import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/presentation/blocs/register_forms/register_cubit.dart';
import 'package:bank_app_mobile/presentation/model/models.dart';
import 'package:bank_app_mobile/presentation/utils/utils.dart';
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
  bool _obscureTextConfirmPassword = true;

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
    final registerCubit = context.watch<RegisterCubit>();
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
              child: _formContent(context, width, height, registerCubit),
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

  void _toggleSignUpConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  Widget _formContent(BuildContext context, double width, double height, RegisterCubit registerCubit) {
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
            child: _registerForm(context, registerCubit),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: height * 0.8),
            decoration: CustomTheme.loginPageBtnContainerDecoration,
            child: _registerButton(context),
          ),
        ],
      ),
    );
  }

  Widget _registerForm(BuildContext context, RegisterCubit registerCubit) {
    final email = registerCubit.state.email;
    final name = registerCubit.state.name;
    final phone = registerCubit.state.phone;
    final dni = registerCubit.state.dni;
    final password = registerCubit.state.password;

    return SizedBox(
      width: 300.0,
      height: 600.0,
        child: Column(
          children: <Widget>[
            TextFormsModel(textInputType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Nombre', icon: const Icon(FontAwesomeIcons.person), errorText: name.errorMessage),
                onChanged: (String value) {
                  formValues['name'] = value;
                  registerCubit.nameChanged(value);
                },),
            space(context),
            TextFormsModel(textInputType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email', icon: const Icon(FontAwesomeIcons.envelope), errorText: email.errorMessage),
              onChanged: (String value) {
                  formValues['email'] = value;
                  registerCubit.emailChanged(value);
                },),
            space(context),
            TextFormsModel(textInputType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Teléfono', icon: Icon(FontAwesomeIcons.phone)),
                onChanged: (String value) {
                  formValues['phone'] = value;
                  registerCubit.phoneChanged(value);
                },),
            space(context),
            TextFormsModel(textInputType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Cédula', icon: Icon(FontAwesomeIcons.idCard)),
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
        , content: 'Crear Cuenta', onPressed: () => _signupButtonOnPressed, padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
        textColor: Colors.white, fontSize: 25.0, fontFamily: 'WorkSansBold');
  }

  void _signupButtonOnPressed() {
    FocusScope.of(context).requestFocus(FocusNode());
    // registerCubit.submit();

    if(formValues.isEmpty || formValues['name']!.isEmpty || formValues['email']!.isEmpty
        || formValues['password']!.isEmpty || formValues['phone']!.isEmpty
        || formValues['dni']!.isEmpty ) {
      Alerts.androidAlertDialog(context: context, title: 'No se pudo registrar el usuario',
          message: 'Por favor llene todos los campos');
    } else {

      User user = User(idUser: util.users.length, name: formValues['name']!, email: formValues['email']!,
          password: formValues['password']!, phone: formValues['phone']!, role: formValues['role']!, dni: formValues['dni']!);
      BankAccount bankAccount = BankAccount(idAccount: util.bankAccounts.length,
          idUser: user.idUser!, accountNumber: Util().bankAccounts.length, accountAmount: 0.0);
      print('email: ${formValues['email']}');
      print('password: ${formValues['password']}');

      util.users.add(user);
      util.bankAccounts.add(bankAccount);

      Alerts.androidAlertDialog(context: context, title: 'Usuario registrado con éxito', message: 'Por favor inicie sesión');
    }
  }
}