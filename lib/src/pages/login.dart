import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/src/ui/circle.dart';
import 'package:pagoplux_flutter/src/ui/icon_container.dart';
import 'package:pagoplux_flutter/src/utils/globals.dart';
import 'package:pagoplux_flutter/src/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    top: -primaryColorSize * 0.55,
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
                    top: primaryColorSize * 0.48,
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
}
