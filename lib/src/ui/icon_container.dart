import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  IconContainer({Key? key, required this.size,}) : assert(size > 0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromRGBO(13, 94, 207, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 9),
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: SvgPicture.asset(
          'assets/logo-pagoplux-02.svg',
          width: 300,
          height: 100,
        ),
      ),
    );
  }
}
