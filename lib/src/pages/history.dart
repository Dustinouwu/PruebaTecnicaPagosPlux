import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final String token; // Agrega una propiedad para almacenar el token

  const HistoryScreen({Key? key, required this.token}) : super(key: key); // Modifica el constructor para recibir el token

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: Center(
        child: Text('Token: ${widget.token}'), // Accede al token usando widget.token
      ),
    );
  }
}
