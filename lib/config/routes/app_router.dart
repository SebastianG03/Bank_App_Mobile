
import 'package:bank_app_mobile/views/home_views/estados_cuenta.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: '/home/:idUser',
      builder: (context, state) => HomeScreen(idUser: int.parse(state.pathParameters['idUser']!)),
      routes: [
        GoRoute(
          name: HistorialTransferencias.name,
          path: 'historial_transferencias/:idBankAccount',
          builder: (context, state) => HistorialTransferencias(idUser: int.parse(state.pathParameters['idUser']!),
              idBankAccount: int.parse(state.pathParameters['idBankAccount']!)),
        )
      ],
    ),
  ],
);
