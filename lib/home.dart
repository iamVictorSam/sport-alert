// ignore_for_file: prefer_const_constructors

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
  bool check = true;
  int _currentIndex = 0;

  final List _children = [Home(), Market()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    GetStorage().write('check', check);
    print('this is check $check');
  }

  @override
  Widget build(BuildContext context) {
    print(GetStorage().read('check'));
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // n
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Market',
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool check = true;
  @override
  void initState() {
    setState(() {
      check = true;
    });
    GetStorage().write('check', check);
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              },
              onPageFinished: (String done) {
                setState(() {
                  isloading = false;
                });
              },
              onPageStarted: (String done) {
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

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  void initState() {
    // setState(() {
    //   check = true;
    // });
    // GetStorage().write('check', check);
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://app.spotalertweb.com/user/trade/market',
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                setState(() {
                  isloading = true;
                });
              },
              onPageFinished: (String done) {
                setState(() {
                  isloading = false;
                });
              },
              onPageStarted: (String done) {
                setState(() {
                  isloading = true;
                });
              },
              onWebResourceError: (e) {
                setState(() {
                  isloading = false;
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
