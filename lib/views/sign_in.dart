import 'package:bank_app_mobile/widgets/formsModels.dart';
import 'package:flutter/material.dart';

import 'package:bank_app_mobile/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/models.dart';
import '../screens/temp/custom_snack_bar.dart';


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
  late User user;
  late String email;
  late String password;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Column(
                    children: <Widget>[
                      FormsModels.textFormFieldModel(context, email, loginEmailController, TextInputType.emailAddress,
                          focusNodeEmail, 'Email', FontAwesomeIcons.envelope),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      FormsModels.passwordFormFieldModel(context, password, loginPasswordController, TextInputType.visiblePassword,
                          focusNodePassword, 'Contraseña', FontAwesomeIcons.lock, _obscureTextPassword, _toggleLogin),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 170.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow> [
                    BoxShadow(
                      color: CustomTheme.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: CustomTheme.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: <Color> [
                      CustomTheme.loginGradientEnd,
                      CustomTheme.loginGradientStart
                    ],
                    begin: FractionalOffset(0.2, 0.2),
                    end: FractionalOffset(1.0, 1.0),
                    stops: <double>[0.0, 1.0],
                    tileMode: TileMode.clamp
                  ),
                ),
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
                    onPressed: () => CustomSnackBar(context, const Text('Login button pressed')),
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
    );
  }

  void debug(dynamic value) {
    print('$value');
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Sign in button pressed'));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}