import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  const InputText({Key? key, required this.label, this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      initialValue: 'PagoPlux',
      readOnly: true,
      decoration: InputDecoration(labelText: this.label),
    );
  }
}
