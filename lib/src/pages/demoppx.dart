import 'package:flutter/material.dart';
import 'package:PagoPlux/src/utils/responsive.dart';
import 'package:PagoPlux/src/widgets/pay_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:PagoPlux/src/utils/globals.dart';

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
  // Se construiye el view<
  @override
  Widget build(BuildContext context) {
    final String _token = ModalRoute.of(context)!.settings.arguments as String;
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        actionsIconTheme: IconThemeData(color: Colors.black),
        foregroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/logo-pagoplux-02.svg',
          width: responsive.wp(30),
        ),
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
