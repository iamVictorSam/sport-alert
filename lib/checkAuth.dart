import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sport_alert/home.dart';
import 'package:sport_alert/onboarding.dart';
import 'package:sport_alert/signup.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool auth = false;
  @override
  void initState() {
    // TODO: implement initState

    if (GetStorage().hasData('check')) {
      auth = GetStorage().read('check');
    } else
      return;
    print(auth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: auth ? HomeScreen() : OnboardingScreen());
  }
}
