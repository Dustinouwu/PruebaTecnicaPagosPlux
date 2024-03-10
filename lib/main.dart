import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:PagoPlux/src/routes/routes.dart' as routes;
import 'package:PagoPlux/src/utils/globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'PagoPlux',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: primarySwatchColor(),
      ),
      initialRoute: '/',
      routes: routes.getApplicationRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
