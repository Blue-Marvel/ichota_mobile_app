import 'package:go_router/go_router.dart';
import 'package:ichota_mobile_app/features/auth/presentation/login.dart';
import 'package:ichota_mobile_app/features/dashboard/dash_board.dart';

class Routes {
  static final GoRouter routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: DashBoard.routeName,
      builder: (context, state) => const DashBoard(),
    ),
  ]);
}
