import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? _token;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            InputText(label: 'Usuario', keyboardType: TextInputType.text),
            InputText(
                label: 'Contraseña',
                keyboardType: TextInputType.visiblePassword),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 189, 73, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
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
            ),
          ],
        ),
      ),
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
        print('Token: $_token');
      });
      return token;
    }
  }
}
