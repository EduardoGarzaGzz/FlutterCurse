import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;
  return (num.tryParse(s) == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String msg) {
  showDialog(context: context, builder: (BuildContext ctx) {
    return AlertDialog(
      title: Text('Informacion incorrecta'),
      content: Text(msg),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  });
}
