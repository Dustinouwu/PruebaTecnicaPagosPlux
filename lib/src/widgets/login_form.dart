import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/utils/responsive.dart';
import 'package:pagoplux_flutter/src/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? _token;
  bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 80,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360, minWidth: 300),
        child: Column(
          children: <Widget>[
            InputText(
                label: 'Usuario',
                keyboardType: TextInputType.text,
                fontSize: responsive.dp(1.5)),
            InputText(
                label: 'Contraseña',
                keyboardType: TextInputType.visiblePassword,
                fontSize: responsive.dp(1.5)),
            SizedBox(height: responsive.dp(5)),
            //Boton Login
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 189, 73, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.dp(1.9)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () async {
                  if (!isButtonPressed) {
                    setState(() {
                      isButtonPressed = true;
                    });
                    await fetchData();
                    if (_token != null) {
                      Navigator.pushNamed(
                        context,
                        'demoppx',
                        arguments: _token,
                      );
                    }
                    setState(() {
                      isButtonPressed = false;
                    });
                  }
                },
                child: const Text('Iniciar Sesión',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: responsive.dp(3)),
            //Boton Olvidaste tu contraseña
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(fontSize: responsive.dp(1.6)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Recuperar',
                      style: TextStyle(fontSize: responsive.dp(1.6))),
                  style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 196, 144, 55)),
                ),
              ],
            ),
            SizedBox(
              height: responsive.dp(10),
            )
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
