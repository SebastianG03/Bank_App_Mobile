import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


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
    ),
    GoRoute(
      name: HistorialTransferencias.name,
      path: '/historial_transferencias/:idBankAccount',
      builder: (context, state) => HistorialTransferencias(idBankAccount: int.parse(state.pathParameters['idBankAccount']!)),
    )
  ],
);
