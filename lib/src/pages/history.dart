import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagoplux_flutter/src/model/response_model.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: fetchData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    dynamic responseData = snapshot.data;
                    List<dynamic> transactions =
                        responseData['detail']['transactionsData'];
        
                    return SizedBox(
                      // Envuelve el ListView con un Container
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          var transaction = transactions[index];
                          return ListTile(
                            title: Text(
                                'Descripción: ${transaction['descripcion']}'),
                            subtitle: Text('Monto: ${transaction['monto']}'),
                            onTap: (){
                              
                            },
                            // Agrega aquí más detalles que desees mostrar
                          );
                        },
                        
                      ),
                    );
                  }
                },
              ),
            ],
          ),
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
      'Authorization': 'key= $token'
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
