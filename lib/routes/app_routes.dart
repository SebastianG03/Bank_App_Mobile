
import 'package:bank_app_mobile/screens/user/home_screen.dart';
import 'package:flutter/material.dart';

import '../model/bank_account.dart';
import '../model/user.dart';
import '../screens/user/login_screen.dart';

class AppRoutes {

  final User user;
  final BankAccount bankAccount;

  AppRoutes.userData({required this.user, required this.bankAccount});

  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
  };

}