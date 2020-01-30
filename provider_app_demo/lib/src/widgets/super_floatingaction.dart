import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/src/providers/heroes_info.dart';

class SuperFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end ,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.access_time),
          backgroundColor: Colors.red,
          onPressed: () => heroesInfo.hero = 'Ironman',
        ),
        SizedBox(height: 10.0,),
        FloatingActionButton(
          child: Icon(Icons.http),
          backgroundColor: Colors.blue,
          onPressed: () => heroesInfo.hero = 'Capitan America',
        ),
      ],
    );
  }
}
