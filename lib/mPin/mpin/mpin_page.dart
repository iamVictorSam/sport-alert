import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sport_alert/home.dart';
import 'package:sport_alert/mPin/mpin/comfirm_mpin_page.dart';
import 'package:sport_alert/mPin/mpin/mpin_widget.dart';
import 'package:sport_alert/services/biometrics/auth.dart';

class MPinPage extends StatefulWidget {
  @override
  _MPinPageState createState() => _MPinPageState();
}

class _MPinPageState extends State<MPinPage> {
  MPinController mPinController = MPinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //   colors: [Colors.blue, Colors.purple, Colors.pink],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // )
              color: Colors.purple,
              // image: DecorationImage(
              //     image: AssetImage(
              //       'assets/slpas.png',
              //     ),
              //     fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.pinkAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        'Enter Your PIN to unlock App',
                        style: TextStyle(
                          color: Colors.white12,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Input your PIN',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    MPinWidget(
                      pinLength: 5,
                      controller: mPinController,
                      onCompleted: (mPin) {
                        print('You entered -> $mPin');

                        // Get.offAll(const Home());
                        Get.to(ConfirmMpin());
                        GetStorage().write('mPin', mPin);
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return const AlertDialog(
                        //         title: Text('Pin Set Success'),
                        //         content: Text('Go to next page'),
                        //       );
                        //     });
                      },
                    ),
                    // SizedBox(height: 32),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            childAspectRatio: 1.6,
                            children: List.generate(
                                9, (index) => buildMaterialButton(index + 1)),
                          ),
                          GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            childAspectRatio: 1.6,
                            children: [
                              // MaterialButton(
                              //   onPressed: () async {},
                              //   textColor: Colors.black,
                              //   child: const Icon(Icons.fingerprint),
                              // ),
                              Container(),
                              buildMaterialButton(0),
                              MaterialButton(
                                onPressed: () {
                                  mPinController.delete!();
                                },
                                textColor: Colors.black,
                                child: const Icon(Icons.backspace_outlined),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // MaterialButton(
                          //   onPressed: () {},
                          //   textColor: Colors.blue,
                          //   child: const Text(
                          //     'Sign In',
                          //     style: TextStyle(fontSize: 16),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Unlock App',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton buildMaterialButton(int input) {
    return MaterialButton(
      onPressed: () {
        mPinController.addInput!('$input');
      },
      textColor: Colors.black,
      child: Text(
        '$input',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
