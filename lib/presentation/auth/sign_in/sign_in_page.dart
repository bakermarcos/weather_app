import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/config/constants.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(imgLogoUncircled),
          const Text('Sign In'),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign In'),
          ),
          InkWell(
            onTap: () {},
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
