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
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    _iconVisible = _obscureText ? Icons.visibility_off : Icons.visibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.read(localAuthService);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 60, 8, 10),
                  child: SizedBox(
                      height: 200, child: Image.asset(imgLogoUncircled)),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24, color: primaryColor),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: authProvider.formKeySignIn,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor.withAlpha(100))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor.withAlpha(100))),
                            labelText: 'Username',
                            labelStyle:
                                TextStyle(color: primaryColor.withAlpha(150)),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: primaryColor,
                            ),
                          ),
                          controller: authProvider.userTextController,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          controller: authProvider.passwordTextController,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor.withAlpha(100))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor.withAlpha(100))),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: primaryColor.withAlpha(150)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _iconVisible,
                                color: primaryColor,
                              ),
                              onPressed: _toggleObscureText,
                            ),
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
                      if (authProvider.formKeySignIn.currentState!.validate()) {
                        authProvider
                            .signIn(authProvider.userTextController.text,
                                authProvider.passwordTextController.text)
                            .then((value) {
                          if (authProvider.isAuthenticated) {
                            context.go('/capitals_list');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Invalid credentials'),
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      context.go('/sign_up');
                    },
                    child: const Text('Sign Up',
                        style: TextStyle(fontSize: 14, color: primaryColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
