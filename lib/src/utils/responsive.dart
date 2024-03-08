
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class Responsive {
  double _width = 0, _height = 0, _diagonal = 0; 
  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;
    this._diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  double wp(double porcentaje) => _width * porcentaje / 100;
  double hp(double porcentaje) => _height * porcentaje / 100;
  double dp(double porcentaje) => _diagonal * porcentaje / 100;
}
