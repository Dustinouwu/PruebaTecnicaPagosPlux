import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pagoplux_flutter/src/component/paybox.dart';
import 'package:pagoplux_flutter/src/model/pagoplux_model.dart';
import 'package:pagoplux_flutter/src/model/response_model.dart';
import 'package:pagoplux_flutter/src/utils/responsive.dart';
import 'package:pagoplux_flutter/src/widgets/pay_form.dart';

/*
 * Clase demo para uso de botón de pagos flutter
 * Widget con estado
 */
class PayboxDemoPage extends StatefulWidget {
  @override
  _PayboxDemoPageState createState() => _PayboxDemoPageState();
  String? token;
}

class _PayboxDemoPageState extends State<PayboxDemoPage> {
  final _formKey = GlobalKey<FormState>();
  PagoPluxModel? _paymentModelExample;
  String voucher = 'Pendiente Pago';
  // Controladores de los campos de texto|
  final namesController = TextEditingController();
  final telephoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final valueController = TextEditingController();
  final identificationController = TextEditingController();

  // Se construiye el view<
  @override
  Widget build(BuildContext context) {
    final String _token = ModalRoute.of(context)!.settings.arguments as String;
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin Flutter PPX'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'history', arguments: _token);
            },
            icon: const Icon(Icons.access_alarm),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: responsive.dp(2),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align content to left
                  children: <Widget>[
                    Text(
                      'Formulario de Pago',
                      style: TextStyle(
                        fontSize: responsive.dp(2.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Add more widgets to the Row if needed (optional)
                  ],
                ),
              ),
              SizedBox(height: responsive.dp(5)), // Add spacing
              PayForm(),
            ],
          ),
        ),
      ),
    );
  }

  /*
   * Se encarga de iniciar los datos para el proceso de pago
   */
  /*  openPpx() {
    print('Se habre el botón de pagos');
    this._paymentModelExample = PagoPluxModel();
    this._paymentModelExample?.payboxRemail = 'da.nielrolesppx@gmail.com';
    this._paymentModelExample?.payboxSendmail = emailController.text;
    this._paymentModelExample?.payboxRename = 'Negocio Integracion Flutter';
    this._paymentModelExample?.payboxBase0 =
        double.tryParse(valueController.text) ?? 0;
    this._paymentModelExample?.payboxBase12 =
        double.tryParse(valueController.text) ?? 0 * 0.12;
    this._paymentModelExample?.payboxDescription = 'Pago desde Flutter';
    this._paymentModelExample?.payboxProduction = false;
    this._paymentModelExample?.payboxDirection = addressController.text;
    this._paymentModelExample?.payboxSendname = namesController.text;
    this._paymentModelExample?.payboxClientPhone = telephoneController.text;
    this._paymentModelExample?.payboxClientIdentification = '0992664673001';
    this._paymentModelExample?.payboxEnvironment = 'sandbox';
  }

 

  obtenerDatos(PagoResponseModel datos) {
    voucher = 'Voucher: ${datos.detail.token}';
    print(voucher);

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
            keyboardType: TextInputType.text,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: const InputDecoration(
              labelText: 'Nombres',
              hintText: 'Coloque su nombre',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su nombre';
              }
              return null;
            },
          ),
          TextFormField(
            controller: telephoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            decoration: const InputDecoration(
              labelText: 'Número de teléfono',
              hintText: '0987335353',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su número de teléfono';
              } else if (value.length != 10) {
                return 'El número de teléfono debe tener 10 dígitos';
              } else if (value.contains(RegExp(r'[a-zA-Z]')) ||
                  value.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%]'))) {
                return 'El número de teléfono no puede contener letras ni caracteres especiales';
              } else if (value.contains('.')) {
                return 'El número de teléfono no puede contener el carácter "."';
              }
              return null;
            },
          ),
          TextFormField(
            controller: addressController,
            keyboardType: TextInputType.text,
            inputFormatters: [LengthLimitingTextInputFormatter(200)],
            decoration: const InputDecoration(
              labelText: 'Dirección',
              hintText: 'Avenida 6 de Diciembre y Naciones Unidas',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su dirección';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Correo Electrónico',
              hintText: 'example@gmail.com',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su correo electrónico';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Por favor ingrese un correo electrónico válido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [LengthLimitingTextInputFormatter(10000)],
            decoration: const InputDecoration(
              labelText: 'Valor de pago',
              hintText: '22.5',
            ),
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el valor a pagar';
              } else if (double.tryParse(value) == null) {
                return 'Por favor ingrese un valor numérico';
              } else if (double.tryParse(value)! > 10000) {
                return 'El valor a pagar no puede ser mayor a 10000';
              }
              return null;
            },
            
          ),
          TextFormField(
            initialValue: '0992664673001',
            keyboardType: TextInputType.number,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Identificación',
              hintText: '0992664673001',
            ),
          ),
          const SizedBox(height: 40),
          FloatingActionButton(
            child: const Icon(Icons.payments_rounded),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                openPpx();
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
              }
            },
          )
        ],
      ),
    );
  } */
}
