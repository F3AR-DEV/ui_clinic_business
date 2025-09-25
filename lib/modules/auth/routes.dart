import 'package:go_router/go_router.dart';
import 'ui/screens/login_page.dart';

List<GoRoute> authRoutes() {
  return [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    // GoRoute(path: '/register', builder: (context, state) => const RegisterPage()),
  ];
}
