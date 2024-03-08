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
}
