import 'package:bank_app_mobile/widgets/text_forms_models.dart';
import 'package:flutter/material.dart';

import 'package:bank_app_mobile/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/models.dart';
import '../screens/user/home_screen.dart';


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
  final Map<String, String> formValues = {};

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        padding: const EdgeInsets.only(top: 23.0),
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
                  child: Container(
                    width: 300.0,
                    height: 190.0,
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormsModels.textForm(controller: loginEmailController, textInputType: TextInputType.emailAddress
                              , focusNode: focusNodeEmail, label: 'Email', icon: FontAwesomeIcons.envelope
                              , formProperty: 'email', formValues: formValues).build(context),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          TextFormsModels.passwordForm(controller: loginPasswordController, textInputType: TextInputType.visiblePassword
                              , focusNode: focusNodePassword, label: 'Contraseña', icon: FontAwesomeIcons.lock
                              , obscureText: _obscureTextPassword, tap: _toggleLogin, formProperty: 'password', formValues: formValues).build(context),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 170.0),
                  decoration: CustomTheme.loginPageBtnContainerDecoration,
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: CustomTheme.loginGradientEnd,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'WorkSansBold',
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: User.create(1, 'Usuario', 'email@gmail.com',
                          '1234567', '0993972', 'Cliente', '2348029358023'), bankAccount: BankAccount.create(1, 1, 1, 25.0)))),

                    ),
                  )
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
      ),
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}