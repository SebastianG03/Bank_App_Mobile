import 'package:bank_app_mobile/screens/user/login_screen.dart';
import 'package:bank_app_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation> [
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tu Banco Online',
      home: const LoginScreen(),
      theme: CustomTheme.lightTheme,
      //initialRoute: ,
      //routes: ,
      );
  }
}