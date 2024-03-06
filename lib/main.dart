import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/pages/demoppx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {'/': (BuildContext context) => PayboxDemoPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
