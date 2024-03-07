import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('cLICK'),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> fetchData() async {
    String token = ModalRoute.of(context)!.settings.arguments as String;
    print('Token recibido: $token');
    final String _token = 'key= $token';

    final Uri url = Uri.parse(
        'https://apipre.pagoplux.com/intv1/integrations/getTransactionsEstablishmentResource');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key= bzNOWEhHbWZ1ak4zVHl6cDFjeUNEdTN4c3Q6VGtCaFpRUDN6d015eDNKd0M1SGVGcXpYTTRwMGp6c1hwMGhUYldSbkk0cmlVdEpU'
    };

    final Map<String, dynamic> requestBody = {
      "numeroIdentificacion": "0992664673001",
      "initialDate": "2023-04-06",
      "finalDate": "2024-03-07",
      "tipoPago": "unico",
      "estado": "pagado",
      "identificacionCliente": "0992664673001"
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('Autenticación exitosa');
      dynamic responseData = jsonDecode(response.body);
      print(responseData); // Imprime los datos recibidos en la consola
      return responseData;
    } else {
      print('Error en la autenticación ${response.statusCode}');
      dynamic responseData = jsonDecode(response.body);
      print(responseData);
    }
  }
}
