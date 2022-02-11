import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final Function(String) validator;
  final bool isObscure;
  final TextInputType inputType;

  const InputText(
      {Key key, @required this.label, this.validator, this.isObscure = false, this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.inputType,
      obscureText: this.isObscure,
      validator: this.validator,
      decoration: InputDecoration(labelText: this.label, contentPadding: EdgeInsets.symmetric(vertical: 10)),
    );
  }
}
