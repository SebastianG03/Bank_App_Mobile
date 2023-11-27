import 'package:bank_app_mobile/screens/temp/custom_snack_bar.dart';
import 'package:bank_app_mobile/theme.dart';
import 'package:bank_app_mobile/widgets/formsModels.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  late String name;
  late String email;
  late String password;
  late String confirmPassword;
  late String phone;
  late String role;
  late String dni;

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
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      FormsModels.textFormFieldModel(context, name, signupNameController, TextInputType.text, focusNodeName
                          , 'Nombre', FontAwesomeIcons.person),
                      space(context),
                      FormsModels.textFormFieldModel(context, email, signupEmailController, TextInputType.emailAddress,
                          focusNodeEmail, 'Correo electrónico', FontAwesomeIcons.envelope),
                      space(context),
                      FormsModels.textFormFieldModel(context, phone, signupPhoneController, TextInputType.phone,
                          focusNodePhone, 'Teléfono', FontAwesomeIcons.phone),
                      space(context),
                      FormsModels.textFormFieldModel(context, dni, signupCedulaController, TextInputType.number,
                          focusNodeCedula, 'Cédula', FontAwesomeIcons.idCard),
                      space(context),
                      FormsModels.textFormFieldModel(context, role, signupRoleController, TextInputType.text,
                          focusNodeRole, 'Rol', FontAwesomeIcons.user),
                      space(context),
                      FormsModels.passwordFormFieldModel(context, password, signupPasswordController, TextInputType.visiblePassword,
                      focusNodePassword, 'Contraseña', FontAwesomeIcons.lock, _obscureTextPassword, _toggleSignup),
                      space(context),
                      FormsModels.passwordFormFieldModel(context, confirmPassword, signupConfirmPasswordController, TextInputType.visiblePassword,
                          focusNodeConfirmPassword, "Confirmar contraseña", FontAwesomeIcons.lock, _obscureTextConfirmPassword, _toggleSignUpConfirm),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 340.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
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
                    colors: <Color>[
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
                  onPressed: _toggleSignUpButton,
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
                ),
              )
            ],
          )
        ],
      )
    );
  }

  Widget space(BuildContext context) {
    return Container(
      width: 250.0,
      height: 1.0,
      color: Colors.grey[400],
    );
  }
  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('Sign up pressed'));
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
}