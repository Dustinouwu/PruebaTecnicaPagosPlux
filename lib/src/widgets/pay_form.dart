import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:PagoPlux/src/component/paybox.dart';
import 'package:PagoPlux/src/utils/responsive.dart';
import 'package:PagoPlux/src/widgets/input_text_pay.dart';
import 'package:PagoPlux/src/model/pagoplux_model.dart';
import 'package:PagoPlux/src/model/response_model.dart';
import 'package:PagoPlux/src/utils/globals.dart';

class PayForm extends StatefulWidget {
  final String? token;
  const PayForm({Key? key, required this.token}) : super(key: key);
  @override
  State<PayForm> createState() => _PayFormState();
}

class _PayFormState extends State<PayForm> {
  final _formKey = GlobalKey<FormState>();
  PagoPluxModel? _paymentModelExample;
  String voucher = 'Pendiente Pago';
  // Controladores de los campos de texto|
  final namesController = TextEditingController();
  final telephoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;
    final Responsive responsive = Responsive.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 360, minWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            InputText(
              label: 'Nombre',
              keyboardType: TextInputType.text,
              fontSize: responsive.dp(1.5),
              controller: namesController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su Nombre';
                }
                return null;
              },
            ),

            InputText(
              controller: telephoneController,
              fontSize: responsive.dp(1.5),
              keyboardType: TextInputType.phone,
              label: 'Teléfono',
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

            InputText(
              controller: addressController,
              fontSize: responsive.dp(1.5),
              keyboardType: TextInputType.text,
              label: 'Dirección',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su dirección';
                }
                return null;
              },
            ),

            InputText(
              controller: emailController,
              fontSize: responsive.dp(1.5),
              keyboardType: TextInputType.emailAddress,
              label: 'Correo Electrónico',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su correo electrónico';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Por favor ingrese un correo electrónico válido';
                }
                return null;
              },
            ),

            InputText(
              controller: valueController,
              fontSize: responsive.dp(1.5),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              label: 'Valor de pago',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el valor a pagar';
                } else if (double.tryParse(value) == null) {
                  return 'Por favor ingrese un valor numérico';
                } else if (double.tryParse(value)! > 10000) {
                  return 'El valor a pagar no puede ser mayor a 10000';
                } else if (double.tryParse(value)! <= 0) {
                  return 'El valor a pagar no puede ser menor o igual a 0';
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
              style: TextStyle(
                fontSize: responsive.dp(1.5),
              ),
            ),
            SizedBox(height: responsive.dp(5)),
            //Boton Login
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      openPpx();
                      showMaterialModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        elevation: 5,
                        expand: true,
                        builder: (context) => ModalPagoPluxView(
                          token: token,
                          pagoPluxModel: _paymentModelExample!,
                          onClose: obtenerDatos,
                        ),
                      );
                      clearInputFields();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.payments_rounded, color: Colors.white),
                      const SizedBox(width: 20),
                      Text('Realizar Pago',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                )),
            SizedBox(height: responsive.dp(3)),
          ],
        ),
      ),
    );
  }

  /*
   * Se encarga de iniciar los datos para el proceso de pago
   */
  openPpx() {
    double valor = double.tryParse(valueController.text) ?? 0;
    double aumento = valor * 0.12;
    double valorFinal = valor + aumento;
    print('Se habre el botón de pagos');
    this._paymentModelExample = PagoPluxModel();
    this._paymentModelExample?.payboxRemail = 'da.nielrolesppx@gmail.com';
    this._paymentModelExample?.payboxSendmail = emailController.text;
    this._paymentModelExample?.payboxRename = 'Negocio Integracion Flutter';
    this._paymentModelExample?.payboxBase0 =
        double.tryParse(valueController.text) ?? 0;
    this._paymentModelExample?.payboxBase12 = valorFinal;
    this._paymentModelExample?.payboxDescription = 'Pago desde Flutter';
    this._paymentModelExample?.payboxProduction = false;
    this._paymentModelExample?.payboxDirection = addressController.text;
    this._paymentModelExample?.payboxSendname = namesController.text;
    this._paymentModelExample?.payboxClientPhone = telephoneController.text;
    this._paymentModelExample?.payboxClientIdentification = '0992664673001';
    this._paymentModelExample?.payboxEnvironment = 'sandbox';
  }

  void clearInputFields() {
    namesController.clear();
    telephoneController.clear();
    addressController.clear();
    emailController.clear();
    valueController.clear();
  }

  obtenerDatos(PagoResponseModel datos) {
    voucher = 'Voucher: ${datos.detail.token}';
    print(voucher);
    setState(() {});
    print('LLego ' + datos.detail.token);
  }
}
