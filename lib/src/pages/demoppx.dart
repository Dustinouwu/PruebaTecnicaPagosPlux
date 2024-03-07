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
  final _formKey = GlobalKey<FormState>();
  PagoPluxModel? _paymentModelExample;
  String voucher = 'Pendiente Pago';
  // Controladores de los campos de texto
  final namesController = TextEditingController();
  final telephoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final valueController = TextEditingController();
  final identificationController = TextEditingController();

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
          child: _payForm(context)),
    );
  }

  /*
   * Se encarga de iniciar los datos para el proceso de pago
   */
  openPpx() {
    print('Se habre el botón de pagos');
    this._paymentModelExample = PagoPluxModel();
    this._paymentModelExample?.payboxRemail = 'da.nielrolesppx@gmail.com';
    this._paymentModelExample?.payboxSendmail = emailController.text;
    this._paymentModelExample?.payboxRename = 'PagoPlux Shop';
    this._paymentModelExample?.payboxBase0 = double.tryParse(valueController.text) ?? 0;
    this._paymentModelExample?.payboxBase12 = double.tryParse(valueController.text) ?? 0 * 0.12;
    this._paymentModelExample?.payboxDescription = 'Pago desde Flutter';
    this._paymentModelExample?.payboxProduction = false;
    this._paymentModelExample?.payboxDirection = addressController.text;
    this._paymentModelExample?.payboxSendname = namesController.text;
    this._paymentModelExample?.payboxClientPhone = telephoneController.text;
    this._paymentModelExample?.payboxClientIdentification = '0992664673001';
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

  Widget _payForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: namesController,
            decoration: const InputDecoration(
              labelText: 'Nombres',
              hintText: 'Coloque su nombre',
            ),
          ),
          TextFormField(
            controller: telephoneController,
            decoration: const InputDecoration(
              labelText: 'Número de teléfono',
              hintText: '0987335353',
            ),
          ),
          TextFormField(
            controller: addressController,
            decoration: const InputDecoration(
              labelText: 'Dirección',
              hintText: 'Avenida 6 de Diciembre y Naciones Unidas',
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Correo Electrónico',
              hintText: 'example@gmail.com',
            ),
          ),
          TextFormField(
            controller: valueController,
            decoration: const InputDecoration(
              labelText: 'Valor de pago',
              hintText: '22.5',
            ),
          ),
          TextFormField(
            initialValue: '0992664673001',
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Identificación',
              hintText: '0992664673001',
            ),
          ),
          SizedBox(height: 40),
           FloatingActionButton(
            child: Icon(Icons.payments_rounded),
            onPressed: () {
              openPpx(); // Update payment model before opening modal
              showMaterialModalBottomSheet(
                context: context,
                useRootNavigator: true,
                elevation: 5,
                expand: true,
                builder: (context) => ModalPagoPluxView(
                  pagoPluxModel: _paymentModelExample!,
                  onClose: obtenerDatos,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
