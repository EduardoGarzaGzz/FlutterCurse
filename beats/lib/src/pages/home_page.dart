import 'package:beats/src/widgets/buy_button_widget.dart';
import 'package:beats/src/widgets/cards_view_widget.dart';
import 'package:beats/src/widgets/custom_appbar_widget.dart';
import 'package:beats/src/widgets/fondo_circular_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoCircularWidget(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBarWidget(),
                  _Header(),
                  CardsViewWidget(),
                ],
              ),
            ),
          ),
          BuyButtonWidget(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 45,
          ),
          Text(
            'Beats',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          Text(
            'By Dre',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
