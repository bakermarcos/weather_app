import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool animateLogo = false;

  activeAnimateLogo() async {
    await Future.delayed(const Duration(milliseconds: 50), (() {
      animateLogo = true;
      setState(() {});
    }));
  }

  @override
  void initState() {
    activeAnimateLogo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              child: AnimatedContainer(
                onEnd: (() {
                  context.go('/sign_in');
                }),
                padding: const EdgeInsets.all(20),
                height: (!animateLogo) ? 0 : MediaQuery.of(context).size.height,
                width: (!animateLogo) ? 0 : MediaQuery.of(context).size.width,
                duration: const Duration(seconds: 2),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: Image.asset(imgLogo)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
