import 'package:flutter/material.dart';

class TransactionAdditionalDetails extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionAdditionalDetails({Key? key, required this.transaction})
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
            Text('Detalles del pago', style: const TextStyle(fontSize: 23)),
            SizedBox(height: 20),
            //
            Row(
              children: [
                Text('Banco'),
                const Spacer(),
                Text(' ${transaction['bancoAdquiriente']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('N° Lote'),
                const Spacer(),
                Text(' ${transaction['numLote']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('N° Autorización'),
                const Spacer(),
                Text(' ${transaction['numAutorizacion']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Tipo de pago'),
                const Spacer(),
                Text(' ${transaction['tipo_pago']}'),
              ],
            ),
            // DESDE AQUÍ
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Marca de tarjeta'),
                const Spacer(),
                Text(' ${transaction['marcaTarjeta']}'),
              ],
            ),
            // HASTA AQUÍ
             SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Cuotas'),
                const Spacer(),
                Text(' ${transaction['cuotas']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('N° Meses de gracia'),
                const Spacer(),
                Text(' ${transaction['numMesesGracia']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Interés'),
                const Spacer(),
                Text(' ${transaction['tieneInteres']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Valor de interés'),
                const Spacer(),
                Text(' ${transaction['valorInteres']}'),
              ],
            ),
            SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Res. Estado'),
                const Spacer(),
                Text(' ${transaction['resEstado']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Define TransactionPaymentDetails y TransactionAdditionalDetails de manera similar
