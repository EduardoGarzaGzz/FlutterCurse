
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;

  const InputText({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: this.label,
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
    );
  }
}
