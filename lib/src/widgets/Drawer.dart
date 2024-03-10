import 'package:PagoPlux/src/utils/globals.dart';
import 'package:PagoPlux/src/utils/responsive.dart';
import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  String? token;
  Drawer({Key? key, required token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;
    final Responsive responsive = Responsive.of(context);
    final double drawerWidth = responsive.wp(70);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          Scaffold.of(context).openDrawer();
        }
      },
      child: Container(
        width: drawerWidth,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: drawerWidth,
              height: responsive.hp(25),
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: responsive.wp(10),
                    backgroundImage: const AssetImage('assets/logo-icon.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'PagoPlux',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Historial de Transacciones'),
              iconColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, 'history', arguments: token);
                Scaffold.of(context).openEndDrawer();
                print('tokenhistory: $token');
              },
            ),
            SizedBox(height: 2),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              iconColor: Colors.black,
              onTap: () {
                Navigator.pushReplacementNamed(context, 'login');
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
