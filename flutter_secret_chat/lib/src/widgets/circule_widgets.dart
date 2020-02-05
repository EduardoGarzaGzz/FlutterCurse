import 'package:flutter/material.dart';

class CirculeWidget extends StatelessWidget {
  final double radius;
  final List<Color> colors;

  CirculeWidget({@required this.radius, @required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.radius * 2,
      width: this.radius * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.radius),
          gradient: LinearGradient(colors: this.colors, begin: Alignment.topRight, end: Alignment.bottomLeft)),
    );
  }
}
