import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/infrastructure/model/models.dart';
import 'package:bank_app_mobile/infrastructure/utils/utils.dart' show Util;
import 'package:bank_app_mobile/logic/cubit/login_forms/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import '../../screens/screens.dart';
import '../../widgets/inputs/inputs.dart';
import '../../widgets/widgets.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key}) ;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _obscureTextPassword = true;
  final Map<String, String> formValues = {
    'email': '',
    'password': '',
  };
  Util util = Util();



  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final loginCubit = context.watch<LoginCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 23.0),
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          BlocProvider(
            create: (context) => LoginCubit(),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                _cardForm(context, loginCubit),
                _signInButton(context),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Olvidé mi contraseña',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'WorkSansMedium',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardForm(BuildContext context, LoginCubit loginCubit) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 300.0,
        child: _buildForm(context, loginCubit),
      ),
    );
  }

  Widget _buildForm(BuildContext context, LoginCubit loginCubit) {
    final email = loginCubit.state.email;
    final password = loginCubit.state.password;


    return Form(
      child: Column(
        children: <Widget>[
          TextFormsModel(textInputType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email', icon: const Icon(FontAwesomeIcons.envelope), errorText: email.errorMessage),
            onChanged: (String value) => {
              formValues['email'] = value,
              loginCubit.emailChanged(value),
            },),
          Divider(height: 1, color: Colors.grey[400], thickness: 1,),
          PasswordFormsModel(textInputType: TextInputType.text, label: 'Contraseña', obscureText: _obscureTextPassword,
            onChanged: (String value) => {
            formValues['password'] = value,
              loginCubit.passwordChanged(value),
            }, errorMessage: password.errorMessage, tap: _toggleLogin,),
        ],
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsetsDirectional.only(top: height * 0.28),
      decoration: CustomTheme.loginPageBtnContainerDecoration,
      child: MaterialButtonModel(highlightColor: Colors.transparent, splashColor: CustomTheme.loginGradientEnd,
        content: 'Iniciar Sesión', textColor: Colors.white, fontSize: 25.0, fontFamily: 'WorkSansBold',
        onPressed: () => _signinButtonOnPressed, padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
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