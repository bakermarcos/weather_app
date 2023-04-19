import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/routes/routes.dart';
import 'package:weather_app/core/services/local_auth_service.dart';
import 'core/inject/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authProvider = LocalAuthService();

  @override
  Widget build(BuildContext context) {
    authProvider.initSharedPreferences();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      routeInformationParser: routes.routeInformationParser,
      routerDelegate: routes.routerDelegate,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
