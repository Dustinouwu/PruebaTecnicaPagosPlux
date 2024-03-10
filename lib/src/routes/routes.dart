import 'package:flutter/material.dart';
import 'package:PagoPlux/src/pages/demoppx.dart';
import 'package:PagoPlux/src/pages/login.dart';
import 'package:PagoPlux/src/pages/history.dart';
import 'package:PagoPlux/src/pages/history_detail.dart';
import 'package:PagoPlux/src/pages/splash_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SplashScreen(),
    'login': (BuildContext context) => LoginScreen(),
    'demoppx': (BuildContext context) => PayboxDemoPage(),
    'history': (BuildContext context) => HistoryScreen(),
    'history_detail': (BuildContext context) => HistoryDetail(key: UniqueKey()),
  };
}
