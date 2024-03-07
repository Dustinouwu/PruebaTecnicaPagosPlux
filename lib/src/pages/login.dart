import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _token;

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
          onPressed: () async {
            await fetchData();
            if (_token != null) {
              Navigator.pushNamed(
                context,
                'demoppx',
                arguments: _token,
                
              );
              print('Token: $_token');
            }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  Future<dynamic> fetchData() async {
    const String username = 'o3NXHGmfujN3Tyzp1cyCDu3xst';
    const String password = 'TkBhZQP3zwMyx3JwC5HeFqzXM4p0jzsXp0hTbWRnI4riUtJT';
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final Uri url = Uri.parse('https://apipre.pagoplux.com/intv1');
    final Map<String, String> headers = {'Authorization': basicAuth};

    final response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('Autenticación exitosa');
      return jsonDecode(response.body);
    } else {
      print('Error en la autenticación: ${response.statusCode}');
      final errorMessage = response.body;
      /* print('Error: $errorMessage'); */
      final tokenMatch = RegExp(r"'([^']*)'").firstMatch(errorMessage);
      final token = tokenMatch?.group(1);
      /* print('Token: $token'); */
      setState(() {
        _token = token;
      });
      return token;
    }
  }
}
