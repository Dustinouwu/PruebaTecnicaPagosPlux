import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;
  final List<Color> colors;

  const Circle({Key? key, required this.size, required this.colors})
      : assert(size > 0),
        assert(colors.length >= 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      //#0D5ECF
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: this.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}

/* color: const Color(0xFF0D5ECF), */
