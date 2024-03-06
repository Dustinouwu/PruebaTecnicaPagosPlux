import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pagoplux_flutter/src/component/paybox.dart';
import 'package:pagoplux_flutter/src/model/pagoplux_model.dart';
import 'package:pagoplux_flutter/src/model/response_model.dart';

/*
 * Clase demo para uso de botón de pagos flutter
 * Widget con estado
 */
class PayboxDemoPage extends StatefulWidget {
  @override
  _PayboxDemoPageState createState() => _PayboxDemoPageState();
}

class _PayboxDemoPageState extends State<PayboxDemoPage> {
  PagoPluxModel? _paymentModelExample;
  String voucher = 'Pendiente Pago';
  // Se construiye el view<
  Widget build(BuildContext context) {
    openPpx();
    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin Flutter PPX'),
        actions: [Icon(Icons.access_alarm)],
      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        margin: EdgeInsets.all(20),
        child: Text(this.voucher,
            style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payments_rounded),
        onPressed: () => showBarModalBottomSheet(
          topControl: crearTop(context),
          useRootNavigator: true,
          elevation: 5,
          expand: true,
          context: context,
          builder: (context) => ModalPagoPluxView(
            pagoPluxModel: _paymentModelExample!,
            onClose: obtenerDatos,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  /*
   * Se encarga de iniciar los datos para el proceso de pago
   */
  openPpx() {
    print('Se habre el botón de pagos');
    this._paymentModelExample = PagoPluxModel();
    this._paymentModelExample?.payboxRemail = 'cristian.bastidas@aol.com';
    this._paymentModelExample?.payboxSendmail = 'jhondoe@gmail.com';
    this._paymentModelExample?.payboxRename = 'PagoPlux Shop';
    this._paymentModelExample?.payboxBase0 = 1.0;
    this._paymentModelExample?.payboxBase12 = 2.212;
    this._paymentModelExample?.payboxDescription = 'Pago desde Flutter';
    this._paymentModelExample?.payboxProduction = false;
    this._paymentModelExample?.payboxDirection = 'Quito, Pichincha, Ecuador';
    this._paymentModelExample?.payboxSendname = 'John Doe';
    this._paymentModelExample?.payboxClientPhone = '987654321';
    this._paymentModelExample?.payboxClientIdentification = '1002003001';
    this._paymentModelExample?.payboxEnvironment = 'product';
  }

  Widget crearTop(BuildContext context) {
    return Container(height: 0);
  }

  obtenerDatos(PagoResponseModel datos) {
    this.voucher = 'Voucher: ' + datos.detail.token;
    setState(() {});
    print('LLego ' + datos.detail.token);
  }
}
