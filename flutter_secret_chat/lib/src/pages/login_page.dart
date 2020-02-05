import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secret_chat/src/widgets/circule_widgets.dart';
import 'package:flutter_secret_chat/src/widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -size.width * 0.36,
                  right: -size.width * 0.22,
                  child: CirculeWidget(
                    radius: size.width * 0.45,
                    colors: [
                      Colors.pink,
                      Colors.pinkAccent,
                    ],
                  ),
                ),
                Positioned(
                  top: -size.width * 0.34,
                  left: -size.width * 0.15,
                  child: CirculeWidget(
                    radius: size.width * 0.35,
                    colors: [
                      Colors.orange,
                      Colors.deepOrange,
                    ],
                  ),
                ),
                SingleChildScrollView(
                    child: Container(
                        width: size.width,
                        height: size.height,
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 90,
                                    width: 90,
                                    margin: EdgeInsets.only(top: size.width * 0.3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 25)]),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Hello again. \nWelcome back',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 350, minWidth: 350),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          InputText(label: 'EMAIL ADDRESS'),
                                          SizedBox(height: 30,),
                                          InputText(label: 'PASSWORD')
                                        ],
                                      ),
                                    )
                                  ),
                                  SizedBox(height: 40,),
                                  ConstrainedBox(
                                    child: CupertinoButton(
                                      color: Colors.pinkAccent,
                                      onPressed: () {},
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    constraints: BoxConstraints(maxWidth: 350, minWidth: 350),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'New in friendly desi?',
                                        style: TextStyle(fontSize: 16, color: Colors.black54),
                                      ),
                                      CupertinoButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        )
    );
  }
}
