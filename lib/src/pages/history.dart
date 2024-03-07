import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});
  String? token;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  

  @override
  Widget build(BuildContext context) {
    final String _token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de pagos'),
      ),
      body: Center(
        child: Text('Token: $_token'),
      ),
    );
  }
}