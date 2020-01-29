import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';
import 'package:hidden_drawer_menu_app/src/page/first_page.dart';
import 'package:hidden_drawer_menu_app/src/page/second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScreenHiddenDrawer> items = List();

  @override
  void initState() {
    super.initState();

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
        ),
        FirstPage()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 2",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
        ),
        SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.cyan,
      screens: items,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      //    slidePercent: 80.0,
      //    verticalScalePercent: 80.0,
      //    contentCornerRadius: 10.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      backgroundMenu: DecorationImage(
          image: NetworkImage(
              'https://fsb.zobj.net/crop.php?r=iLyhXwU27oCz7PXJKSoD3FOc0LVx7iAuqoW2lknHKQ5ymmhS3q5FZOqz-1S6vjwB7t06C-4_Q3K_akt4jm_NlEL_8pDusC9a1Fs9s7oCtcPRKmEKVyFMW32LbwnVb75qu0RWi_y0cNsGPbW-'
          ),
          fit: BoxFit.cover),
    );
  }
}
