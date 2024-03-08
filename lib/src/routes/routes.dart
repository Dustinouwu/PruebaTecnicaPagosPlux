import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/pages/demoppx.dart';
import 'package:pagoplux_flutter/src/pages/login.dart';
import 'package:pagoplux_flutter/src/pages/history.dart';
import 'package:pagoplux_flutter/src/pages/history_detail.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginScreen(),
    'demoppx': (BuildContext context) => PayboxDemoPage(),
    'history': (BuildContext context) => HistoryScreen(),
    'history_detail': (BuildContext context) => HistoryDetail(key: UniqueKey()),
  };
}
