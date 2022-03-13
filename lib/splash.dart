import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
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
    return AnimatedSplashScreen(
        splash: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: Image.asset('assets/purplespoticon.png',
                    width: double.infinity, height: double.infinity),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Sport Alert',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        splashIconSize: 280.0,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        nextScreen: const CheckAuth());
  }
}
