import 'package:PagoPlux/src/model/pay_model.dart';
import 'package:flutter/material.dart';
import 'package:PagoPlux/src/utils/globals.dart';

class TransactionBasicInfo extends StatelessWidget {
  final TransaccionModel transaction;

  const TransactionBasicInfo({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${transaction.monto}',
                style: const TextStyle(fontSize: 30)),
            divider(),
            Text('${transaction.fecha_transaccion}'),
            SizedBox(height: 20),
            Text('Estado: ${transaction.estado_transaccion}'),
            SizedBox(height: 15),
            divider(),
            SizedBox(height: 15),
            Row(
              children: [
                Text('Número de referencia'),
                const Spacer(),
                Text(' ${transaction.numReferencia}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


