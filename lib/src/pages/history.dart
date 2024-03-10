import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:PagoPlux/src/pages/history_detail.dart';
import 'package:PagoPlux/src/utils/globals.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});
  String? token;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
  
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        actionsIconTheme: IconThemeData(color: primaryColor),
        foregroundColor: Colors.black,
        title: Text('Actividad de transacciones', style: TextStyle(color: Colors.black))
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: fetchData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: primaryColor,
                    ));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: primaryColor,
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    dynamic responseData = snapshot.data;
                    List<dynamic> transactions =
                        responseData['detail']['transactionsData'];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          var transaction = transactions[index];
                          return ListTile(
                            title: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 3,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Text(
                                      '${transaction['bancoAdquiriente']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Text('${transaction['fecha_transaccion']}'),
                                  ]),
                                  Row(
                                    children: [
                                      Text('Monto: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('${transaction['monto']}'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Estado: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        '${transaction['estado_transaccion']}',
                                        style: TextStyle(
                                            color: transaction[
                                                        'estado_transaccion'] ==
                                                    'pagado'
                                                ? Colors.red
                                                : Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            onTap: () {
                              final transaction = transactions[index];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryDetail(
                                      transaction: transaction,
                                      key: Key('history_detail')),
                                ),
                              );
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
    final String token = ModalRoute.of(context)!.settings.arguments as String;

    final Uri url = Uri.parse(
        'https://apipre.pagoplux.com/intv1/integrations/getTransactionsEstablishmentResource');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key= $token'
    };

    final Map<String, dynamic> requestBody = {
      "numeroIdentificacion": "0992664673001",
      "initialDate": "2023-04-06",
      "finalDate": "2024-04-08",
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
      print('Consummo api exitoso');
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
