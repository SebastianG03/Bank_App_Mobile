
import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/presentation/model/models.dart';
import 'package:bank_app_mobile/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/widgets.dart';

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
  final Map<String, String> formValues = {
    'name': '',
    'email': '',
    'password': '',
    'confirmPassword': '',
    'phone': '',
    'cedula': '',
    'role': 'client',
  };
  Util util = Util();

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
                , nextFocusNode: focusNodeEmail, label: 'Nombre', icon: FontAwesomeIcons.person, formProperty: 'name', formValues: formValues),
            space(context),
            TextFormsModels.textForm(controller: signupEmailController, textInputType: TextInputType.emailAddress, focusNode: focusNodeEmail
                , nextFocusNode: focusNodePhone, label: 'Correo electrónico', icon: FontAwesomeIcons.envelope, formProperty: 'email', formValues: formValues),
            space(context),
            TextFormsModels.textForm(controller: signupPhoneController, textInputType: TextInputType.phone, focusNode: focusNodePhone
               , nextFocusNode: focusNodeCedula, label: 'Teléfono', icon: FontAwesomeIcons.phone, formProperty: 'phone', formValues: formValues),
            space(context),
            TextFormsModels.textForm(controller: signupCedulaController, textInputType: TextInputType.number, focusNode: focusNodeCedula
                , nextFocusNode: focusNodePassword, label: 'Cédula', icon: FontAwesomeIcons.idCard, formProperty: 'dni', formValues: formValues),
            space(context),
            TextFormsModels.passwordForm(controller: signupPasswordController, textInputType: TextInputType.visiblePassword, focusNode: focusNodePassword,
                 nextFocusNode: focusNodeConfirmPassword, label: 'Contraseña', icon: FontAwesomeIcons.lock, obscureText: _obscureTextPassword, tap: _toggleSignup, formProperty: 'password',
                formValues: formValues),
            space(context),
            TextFormsModels.passwordForm(controller: signupConfirmPasswordController, textInputType: TextInputType.visiblePassword
                , focusNode: focusNodeConfirmPassword, label: "Confirmar contraseña", icon: FontAwesomeIcons.lock
                , obscureText: _obscureTextConfirmPassword, tap: _toggleSignUpConfirm, formProperty: 'confirmPassword', formValues: formValues),
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

    if(formValues.isEmpty || formValues['name']!.isEmpty || formValues['email']!.isEmpty
        || formValues['password']!.isEmpty ||  formValues['confirmPassword']!.isEmpty || formValues['phone']!.isEmpty
        || formValues['dni']!.isEmpty ) {
      Alerts.androidAlertDialog(context: context, title: 'No se pudo registrar el usuario',
          message: 'Por favor llene todos los campos');
    } else if(formValues['password'] != formValues['confirmPassword']) {
      Alerts.androidAlertDialog(context: context, title: 'No se pudo registrar el usuario',
          message: 'Las contraseñas no coinciden');
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