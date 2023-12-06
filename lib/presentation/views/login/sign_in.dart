import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/presentation/blocs/register_forms/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import '../../model/models.dart';
import '../../screens/screens.dart';
import '../../utils/util.dart';
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
    final registerCubit = context.watch<RegisterCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 23.0),
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          BlocProvider(
            create: (context) => RegisterCubit(),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                _cardForm(context, registerCubit),
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

  Widget _cardForm(BuildContext context, RegisterCubit registerCubit) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 300.0,
        child: _buildForm(context, registerCubit),
      ),
    );
  }

  Widget _buildForm(BuildContext context, RegisterCubit registerCubit) {
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;


    return Form(
      child: Column(
        children: <Widget>[
          TextFormsModel(textInputType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email', icon: Icon(FontAwesomeIcons.envelope), errorText: ''),
            onChanged: (String value) => {
              formValues['email'] = value,
              registerCubit.emailChanged(value),
            },),
          Divider(height: 1, color: Colors.grey[400], thickness: 1,),
          PasswordFormsModel(textInputType: TextInputType.text, label: 'Contraseña', obscureText: _obscureTextPassword,
            onChanged: (String value) => {
            formValues['password'] = value,
              registerCubit.passwordChanged(value),
            }, errorMessage: '', tap: _toggleLogin,),
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