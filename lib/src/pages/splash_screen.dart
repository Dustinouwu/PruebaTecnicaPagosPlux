import 'dart:async';
import 'package:flutter/material.dart';
import 'package:PagoPlux/src/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  _startTime() async {
    print('_startTime()');
    var duration = new Duration(milliseconds: 2600);
    return new Timer(duration, _route);
  }

  _route() {
    print('_route()');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => const LoginScreen(),
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  Widget _body(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    var _appBarSize = AppBar().preferredSize.height;

    return Scaffold(
      body: Container(
        height: _pageSize - (_appBarSize + _notifySize),
        child: Column(
          children: [
            SizedBox(
              height: _appBarSize + 200,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 300,
                child: Image.asset(
                  "assets/loader_api.gif",
                ),
              ),
            ),
            SizedBox(
              height: _appBarSize,
            ),
          ],
        ),
      ),
    );
  }
}
