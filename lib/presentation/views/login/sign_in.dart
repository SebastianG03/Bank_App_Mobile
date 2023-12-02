import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import '../../model/models.dart';
import '../../screens/screens.dart';
import '../../utils/util.dart';
import '../../widgets/widgets.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key}) ;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'email': '',
    'password': '',
  };
  Util util = Util();

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 23.0),
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 190.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormsModels.textForm(controller: loginEmailController, textInputType: TextInputType.emailAddress
                            , focusNode: focusNodeEmail, nextFocusNode: focusNodePassword, label: 'Email', icon: FontAwesomeIcons.envelope
                            , formProperty: 'email', formValues: formValues),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        TextFormsModels.passwordForm(controller: loginPasswordController, textInputType: TextInputType.visiblePassword
                            , focusNode: focusNodePassword, label: 'Contraseña', icon: FontAwesomeIcons.lock
                            , obscureText: _obscureTextPassword, tap: _toggleLogin, formProperty: 'password', formValues: formValues),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 185.0),
                decoration: CustomTheme.loginPageBtnContainerDecoration,
                  child: MaterialButtonModel(
                    highlightColor: Colors.transparent,
                    splashColor: CustomTheme.loginGradientEnd,
                    content: 'Iniciar Sesión',
                    textColor: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'WorkSansBold',
                    onPressed: () => _signinButtonOnPressed,
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Olvidé mi contraseña',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'WorkSansMedium',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _signinButtonOnPressed() {
    if(formValues.isEmpty || formValues['email']!.isEmpty || formValues['password']!.isEmpty) {
      Alerts.androidAlertDialog(context: context, title: 'No se pudo iniciar sesión',
        message: 'Por favor llene todos los campos');
    } else {
      User user = util.users.firstWhere((element) => element.email == formValues['email']! && element.password == formValues['password']!);
      BankAccount bankAccount = util.bankAccounts.firstWhere((element) => element.idUser == user.idUser);
      if(bankAccount != null) {

        print('email: ${formValues['email']}');
        print('password: ${formValues['password']}');

        print('user email: ${user.email}');
        print('user password: ${user.password}');
        context.goNamed(HomeScreen.name, pathParameters: {'idUser': user.idUser.toString()});

      } else {
        Alerts.androidAlertDialog(context: context, title: 'No se pudo iniciar sesión',
          message: 'Credenciales incorrectas');
      }
    }
  }
}