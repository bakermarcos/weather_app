import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
      body: Center(
        child: Column(
          children: [
            const Text('Sign Up'),
            Form(
              key: ref.read(localAuthService).formKeySignUp,
              child: Column(
                children: [
                  TextFormField(
                    controller: authProvider.userTextController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                  TextFormField(
                    controller:
                        ref.read(localAuthService).passwordTextController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (authProvider.formKeySignUp.currentState!.validate()) {
                  authProvider.signUp(authProvider.userTextController.text,
                      authProvider.passwordTextController.text);
                }
              },
              child: const Text('Sign Up'),
            ),
            InkWell(
              onTap: () {
                context.push('/sign-in');
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
