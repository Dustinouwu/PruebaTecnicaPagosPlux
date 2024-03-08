import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/ui/circle.dart';
import 'package:pagoplux_flutter/src/ui/icon_container.dart';
import 'package:pagoplux_flutter/src/utils/globals.dart';
import 'package:pagoplux_flutter/src/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _token;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final Size size = MediaQuery.of(context).size;
    final double primaryColorSize = responsive.wp(80);
    final double secondaryColorSize = responsive.wp(57);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              height: responsive.height,
              /* color: Color.fromRGBO(13, 94, 207, 1), */
              color: Colors.white,
              /* margin: const EdgeInsets.all(10.0), */
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: -primaryColorSize * 0.5,
                    right: -primaryColorSize * 0.2,
                    child: Circle(
                      size: size.width * 0.8,
                      colors: const [
                        Color.fromRGBO(255, 189, 73, 1),
                        Color.fromRGBO(248, 175, 50, 1),
                        /* Color.fromRGBO(54, 213, 161, 1), */
                      ],
                    ),
                  ),
                  Positioned(
                    top: -secondaryColorSize * 0.55,
                    left: -secondaryColorSize * 0.15,
                    child: Circle(
                      size: size.width * 0.57,
                      colors: const [
                        Color.fromRGBO(54, 213, 161, 1),
                        Color.fromRGBO(95, 233, 187, 1),
                      ],
                    ),
                  ),
                  Positioned(
                    top: primaryColorSize * 0.53,
                    child: Column(children: <Widget>[
                      IconContainer(
                        size: responsive.wp(10),
                      ),
                      SizedBox(height: responsive.dp(5)),
                      Text(
                        "Simplifica tus pagos, maximiza tus ventas",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.dp(1.5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 1.5,
                            wordSpacing: 2.0,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                  LoginForm()
                ],
              )
        
              /*  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_loginForm(context)],
            ), */
              ),
        ),
      ),
    );
  }

 /*  Widget _loginForm(BuildContext context) {
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
        print('Token: $_token');
      });
      return token;
    }
  } */
}
