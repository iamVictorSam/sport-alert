import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sport_alert/checkAuth.dart';
import 'package:sport_alert/main.dart';
import 'package:sport_alert/onboarding.dart';

class InitScreen extends StatefulWidget {
  static String routeName = '/initScreen';
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    print(GetStorage().read('check'));
    return AnimatedSplashScreen(
        splash: SizedBox(
          child:
              Image.asset('assets/purplespoticon.png', width: 150, height: 150),
        ),
        splashIconSize: 280.0,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        nextScreen: const CheckAuth());
  }
}
