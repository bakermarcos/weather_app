import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/services/local_auth_service.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = ref.read(localAuthService);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/sign_in'),
        ),
        backgroundColor: primaryColor,
        title: const Text('Sign Up', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    SizedBox(height: 200, child: Image.asset(imgLogoUncircled)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: authProvider.formKeySignUp,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor.withAlpha(50))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor.withAlpha(50))),
                          labelText: 'Username',
                          labelStyle:
                              TextStyle(color: primaryColor.withAlpha(50)),
                          suffixIcon: const Icon(Icons.person),
                        ),
                        controller: authProvider.registerUserTextController,
                      ),
                      TextFormField(
                        controller: authProvider.registerPasswordTextController,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor.withAlpha(50))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor.withAlpha(50))),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: primaryColor.withAlpha(50)),
                          suffixIcon: const Icon(Icons.password),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => primaryColor,
                    ),
                  ),
                  onPressed: () {
                    if (authProvider.formKeySignUp.currentState!.validate()) {
                      authProvider.signUp(authProvider.userTextController.text,
                          authProvider.passwordTextController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Signed Up!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
