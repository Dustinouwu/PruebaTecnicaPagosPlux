import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final double fontSize;
  final TextEditingController controller;
  final bool readOnly;
  //Validator
  final String? Function(String?)? validator;
  const InputText({
    Key? key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.fontSize = 15,
    this.readOnly = false,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      style: TextStyle(fontSize: this.fontSize),
      readOnly: readOnly,
      decoration: InputDecoration(labelText: this.label),
      controller: this.controller,
      validator: this.validator,
    );
  }
}
