import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sport_alert/home.dart';
import 'package:sport_alert/main.dart';
import 'package:sport_alert/signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade700,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.86,
                      ),
                      // Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUp());
                              },
                              child: const Text(
                                'SIGN UP ',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: 1,
                              color: Color(0xff191D3A),
                            ),
                            // Text('SIGN UP ')
                            GestureDetector(
                              onTap: () {
                                Get.to(HomeScreen());
                              },
                              child: const Text('SIGN IN ',
                                  style: TextStyle(color: Colors.black)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.87,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xff191D3A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/Shape.svg'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Image.asset('assets/purplelogo.png'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'Tract your\ncrypto portfolio',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 30),
                      child: Text(
                        'Your assets at a glance. Keep up to date\nwith your cryptocurrencies.',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: const Image(
                  image: AssetImage('assets/splashAss.png'),
                ),
              ),
            ],
          ),
        ));
  }
}
