import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/services/local_auth_service.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = ref.read(localAuthService);
    return Center(
      child: Column(
        children: [
          Image.asset(imgLogoUncircled),
          const Text('Sign In'),
          Form(
            key: authProvider.formKeySignIn,
            child: Column(
              children: [
                TextFormField(
                  controller: authProvider.userTextController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                TextFormField(
                  controller: authProvider.passwordTextController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (authProvider.formKeySignIn.currentState!.validate()) {
                authProvider.signIn(authProvider.userTextController.text,
                    authProvider.passwordTextController.text);
              }
            },
            child: const Text('Sign In'),
          ),
          InkWell(
            onTap: () {
              context.push('/sign-up');
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
