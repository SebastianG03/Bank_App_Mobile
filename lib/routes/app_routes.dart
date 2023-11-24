
import 'package:bank_app_mobile/screens/user/home_screen.dart';
import 'package:flutter/material.dart';

import '../model/bank_account.dart';
import '../model/user.dart';
import '../screens/user/login_screen.dart';

class AppRoutes {

  late User user;
  late BankAccount bankAccount;


  AppRoutes();


  AppRoutes.userData({required this.user, required this.bankAccount});

  static const initialRoute = LoginScreen();

  static Map<String, Widget Function(BuildContext)> userRoutes = {
  };

}