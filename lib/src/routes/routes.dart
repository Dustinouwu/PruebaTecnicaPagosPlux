import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/pages/demoppx.dart';
import 'package:pagoplux_flutter/src/pages/login.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginScreen(),
    'demoppx': (BuildContext context) => PayboxDemoPage()
  };
}
