
import 'package:bank_app_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../utils/bubble_indicator_painter.dart';
import '../../views/sign_in.dart';
import '../../views/sign_up.dart';


class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> with SingleTickerProviderStateMixin {
  late PageController _pageController;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: _decoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Image(
                height: MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                fit: BoxFit.fill,
                image: const AssetImage('assets/img/login_logo.jpg'),
              ),
            ),
            const Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[

              ],
            )
          ],
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

  Widget _buildFloatingButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: Icon(Icons.close),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => (
                print("pressed")
            ),
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(Icons.person_add_alt_1_rounded),
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => (
                print("pressed login")
            ),
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(Icons.login),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpPress,
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpPress() {
    _pageController?.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}