import 'package:go_router/go_router.dart';
import 'package:weather_app/presentation/auth/sign_in/sign_in_page.dart';

final routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SignInPage()),
  GoRoute(path: '/sign_up', builder: (context, state) => const SignInPage()),
  GoRoute(path: '/splash', builder: (context, state) => const SignInPage()),
  GoRoute(
      path: '/capital_list', builder: (context, state) => const SignInPage()),
  GoRoute(
      path: '/weather_slider', builder: (context, state) => const SignInPage()),
]);
