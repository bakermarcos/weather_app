import 'package:go_router/go_router.dart';
import 'package:weather_app/core/services/local_auth_service.dart';
import 'package:weather_app/presentation/auth/sign_in/sign_in_page.dart';
import 'package:weather_app/presentation/auth/sign_up/sign_up_page.dart';
import 'package:weather_app/presentation/capitals_weathers/list_capitals_weather_page.dart';
import 'package:weather_app/presentation/splash_screen/splash_screen.dart';
import 'package:weather_app/presentation/weather/detailed_capitals_weathers_page.dart';

final LocalAuthService localAuthService = LocalAuthService();

final routes = GoRouter(
    initialLocation: '/capital_list',
    refreshListenable: localAuthService,
    redirect: (context, state) {
      final isAuthenticated = localAuthService.isAuthenticated;
      final isLoginRoute = state.subloc == '/sign_in';
      if (!isAuthenticated) {
        return isLoginRoute ? null : '/sign_in';
      }
      if (isLoginRoute) return '/capital_list';
      return null;
    },
    routes: [
      GoRoute(
          path: '/sign_in', builder: (context, state) => const SignInPage()),
      GoRoute(
          path: '/sign_up', builder: (context, state) => const SignUpPage()),
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: '/capitals_list',
          builder: (context, state) => const CapitalsListPage()),
      GoRoute(
          path: '/detailed_weather',
          builder: (context, state) => const DetailedWeatherPage()),
    ]);
