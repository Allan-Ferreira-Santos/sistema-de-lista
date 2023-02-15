import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_lista/screens/homeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: 'assets/images/loading.gif',
      splashIconSize: 150,
      animationDuration: const Duration(seconds: 3),
      duration: 2500,
      nextScreen: const HomeScreen(),
    );
  }
}
