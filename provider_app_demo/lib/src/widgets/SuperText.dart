import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/src/providers/heroes_info.dart';

class SuperText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<HeroesInfo>(
          builder: (ctx, heroesInfo, _) => Text(
            heroesInfo.hero,
            style: TextStyle(fontSize: 30.0, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
