import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  bool isloading = false;
  void initState() {
    setState(() {
      check = true;
    });
    GetStorage().write('check', check);
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://app.spotalertweb.com/login',
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                setState(() {
                  isloading = true;
                });
                debugPrint('progressing $progress');
              },
              onPageFinished: (String done) {
                print('done $done');
                setState(() {
                  isloading = false;
                });
              },
              onPageStarted: (String done) {
                print('started $done');
                setState(() {
                  isloading = true;
                });
              },
            ),
            Align(
              alignment: Alignment.center,
              child: isloading == true
                  ? const CircularProgressIndicator()
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
