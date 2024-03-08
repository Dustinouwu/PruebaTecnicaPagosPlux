import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final double fontSize;
  const InputText({Key? key, required this.label, this.keyboardType = TextInputType.text, this.fontSize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      style: TextStyle(fontSize: this.fontSize),
      initialValue: 'PagoPlux',
      readOnly: true,
      decoration: InputDecoration(labelText: this.label),
    );
  }
}
