
import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/logic/cubit/login_forms/login_cubit.dart';
import 'package:bank_app_mobile/logic/cubit/register_forms/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../views/views_user.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const name = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
          decoration: _decoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 75.0, bottom: 15.0),
                child: Image(
                  height: MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                  fit: BoxFit.fill,
                  image: const AssetImage('assets/img/login_logo.jpg'),
                ),
              ),
              Expanded(
                flex: 2,
                child: _viewLoginPages(context),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: <Color> [
            CustomTheme.loginGradientStart,
            CustomTheme.loginGradientEnd
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: <double>[0.0, 1.0],
          tileMode: TileMode.clamp
      ),
    );
  }

  Widget _viewLoginPages(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const ClampingScrollPhysics(),
      onPageChanged: (int i) {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {});
      },
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: const SignIn(),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: const SignUp(),
        )
      ],
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        children: <Widget>[
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => _onSignUpButtonPress(),
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(Icons.person_add_alt_1_rounded),
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => _onSignInButtonPress(),
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(Icons.login),
          ),
        ],
      ),
    );
  }


  void _onSignInButtonPress() {
    _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
  }
}