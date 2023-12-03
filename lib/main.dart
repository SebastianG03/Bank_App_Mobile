import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/routes/app_router.dart';
import 'config/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation> [
    DeviceOrientation.portraitUp
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tu Banco Online',
      routerConfig: appRouter,
      theme: CustomTheme.lightTheme,
      );
  }
}