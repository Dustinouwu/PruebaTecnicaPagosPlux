import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_loginForm(context)],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: 'PagoPlux',
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Usuario',
          ),
        ),
        TextFormField(
          initialValue: 'PagoPlux',
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'demoppx');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
