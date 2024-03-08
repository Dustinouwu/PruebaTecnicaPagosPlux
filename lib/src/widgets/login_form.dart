import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: 'PagoPlux',
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Usuario',
            ),
          ),
        ],
      ),
    );
  }
}
