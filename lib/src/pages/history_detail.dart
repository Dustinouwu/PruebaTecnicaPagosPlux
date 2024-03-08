import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/widgets/add_detail.dart';
import 'package:pagoplux_flutter/src/widgets/card_detail.dart';
import 'package:pagoplux_flutter/src/widgets/pay_detail.dart';

class HistoryDetail extends StatelessWidget {
  final dynamic transaction;
  const HistoryDetail({required Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher: ${transaction['voucher']}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              child: TransactionBasicInfo(transaction: transaction),
            ),
            TransactionPaymentDetails(transaction: transaction),
            SizedBox(height: 20),
            TransactionAdditionalDetails(transaction: transaction),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}



/* 
Column(
          children: [
            Text('fecha_transaccion: ${transaction['fecha_transaccion']}'),
            Text('descripcion: ${transaction['descripcion']}'),
            Text('monto:${transaction['monto']}'),
            Text(
                'numero_identificacion_cliente: ${transaction['numero_identificacion_cliente']}'),
            Text(
                'numero_telefonico_cliente: ${transaction['numero_telefonico_cliente']}'),
            Text('estado_transaccion:${transaction['estado_transaccion']}'),
            Text('tipo_pago: ${transaction['tipo_pago']}'),
            Text('usuarioCreador: ${transaction['usuarioCreador']}'),
            Text('marcaTarjeta:${transaction['marcaTarjeta']}'),
            Text('bancoAdquiriente: ${transaction['bancoAdquiriente']}'),
            Text('voucher: ${transaction['voucher']}'),
            Text('cuotas:${transaction['cuotas']}'),
            Text('numMesesGracia: ${transaction['numMesesGracia']}'),
            Text('tieneInteres: ${transaction['tieneInteres']}'),
            Text('valorInteres:${transaction['valorInteres']}'),
            Text('numReferencia: ${transaction['numReferencia']}'),
            Text('numLote:${transaction['numLote']}'),
            Text('numAutorizacion: ${transaction['numAutorizacion']}'),
            Text('resEstado: ${transaction['resEstado']}'),
            // ... add other transaction details
          ],
        ), */