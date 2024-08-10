import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/views/loginview/loginScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  List<dynamic> colors = [appColor, Colors.black];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1000,
        splash: const Text(
          "AUVNET APP",
          style: TextStyle(fontSize: 32, color: appColor),
        ),
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
