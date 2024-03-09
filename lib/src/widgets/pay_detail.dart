import 'package:flutter/material.dart';
import 'package:PagoPlux/src/utils/globals.dart';

class TransactionPaymentDetails extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionPaymentDetails({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0, -1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General', style: const TextStyle(fontSize: 23)),
            SizedBox(height: 20),
            //
            Row(
              children: [
                Text('Nombre de origen'),
                const Spacer(),
                Text(' ${transaction['usuarioCreador']}'),
              ],
            ),
            SizedBox(height: 10),
            divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Descripción'),
                const Spacer(),
                Text(' ${transaction['descripcion']}'),
              ],
            ),
            SizedBox(height: 10),
            divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text('N° Identificación'),
                const Spacer(),
                Text(' ${transaction['numero_identificacion_cliente']}'),
              ],
            ),
            SizedBox(height: 10),
            divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text('N° Teléfono'),
                const Spacer(),
                Text(' ${transaction['numero_telefonico_cliente']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Define TransactionPaymentDetails y TransactionAdditionalDetails de manera similar
