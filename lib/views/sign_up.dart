import 'package:bank_app_mobile/model/models.dart';
import 'package:bank_app_mobile/theme/theme.dart';
import 'package:bank_app_mobile/widgets/text_forms_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/user/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusNodePhone = FocusNode();
  final FocusNode focusNodeCedula = FocusNode();
  final FocusNode focusNodeRole = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupCedulaController = TextEditingController();
  TextEditingController signupRoleController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {};

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    focusNodePhone.dispose();
    focusNodeCedula.dispose();
    focusNodeRole.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 23.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Card(
                      elevation: 2.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: _registerForm(context),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 550.0),
                      decoration: CustomTheme.loginPageBtnContainerDecoration,
                      child: _registerButton(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

  Widget _registerForm(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 600.0,
        child: Column(
          children: <Widget>[
            TextFormsModels.textForm(controller: signupNameController, textInputType: TextInputType.text, focusNode: focusNodeName
                , label: 'Nombre', icon: FontAwesomeIcons.person, formProperty: 'name', formValues: formValues).build(context),
            space(context),
            TextFormsModels.textForm(controller: signupEmailController, textInputType: TextInputType.emailAddress, focusNode: focusNodeEmail
                , label: 'Correo electrónico', icon: FontAwesomeIcons.envelope, formProperty: 'email', formValues: formValues).build(context),
            space(context),
            TextFormsModels.textForm(controller: signupPhoneController, textInputType: TextInputType.phone, focusNode: focusNodePhone
                , label: 'Teléfono', icon: FontAwesomeIcons.phone, formProperty: 'phone', formValues: formValues).build(context),
            space(context),
            TextFormsModels.textForm(controller: signupCedulaController, textInputType: TextInputType.number, focusNode: focusNodeCedula
                , label: 'Cédula', icon: FontAwesomeIcons.idCard, formProperty: 'dni', formValues: formValues).build(context),
            space(context),
            TextFormsModels.passwordForm(controller: signupPasswordController, textInputType: TextInputType.visiblePassword, focusNode: focusNodePassword,
                label: 'Contraseña', icon: FontAwesomeIcons.lock, obscureText: _obscureTextPassword, tap: _toggleSignup, formProperty: 'password',
                formValues: formValues).build(context),
            space(context),
            TextFormsModels.passwordForm(controller: signupConfirmPasswordController, textInputType: TextInputType.visiblePassword
                , focusNode: focusNodeConfirmPassword, label: "Confirmar contraseña", icon: FontAwesomeIcons.lock
                , obscureText: _obscureTextConfirmPassword, tap: _toggleSignUpConfirm, formProperty: 'confirmPassword', formValues: formValues).build(context),
          ],
        ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.transparent,
      splashColor: CustomTheme.loginGradientEnd,
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        print(formValues);
      },
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: User.create(1, 'Usuario', 'email@gmail.com',
          // '1234567', '0993972', 'Cliente', '2348029358023'), bankAccount: BankAccount.create(1, 1, 1, 25.0)))),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
        child: Text(
          'Iniciar Sesión',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontFamily: 'WorkSansBold',
          ),
        ),
      ),
    );
  }
}