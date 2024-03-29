import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secret_chat/src/widgets/circule_widgets.dart';
import 'package:flutter_secret_chat/src/widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() {
    this._formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
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
                                    key: this._formKey,
                                    child: Column(
                                      children: <Widget>[
                                        InputText(
                                          label: 'EMAIL ADDRESS',
                                          inputType: TextInputType.emailAddress,
                                          validator: (val) {
                                            if (val.contains("@"))
                                              return null;
                                            else
                                              return 'Invalid email';
                                          },
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        InputText(
                                          label: 'PASSWORD',
                                          isObscure: true,
                                          validator: (val) {
                                            if(val.isNotEmpty && val.length > 5) return null;
                                            else return 'Invalid password';
                                          },
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 40,
                              ),
                              ConstrainedBox(
                                child: CupertinoButton(
                                  color: Colors.pinkAccent,
                                  onPressed: () => this._submit(),
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
                                    onPressed: () => Navigator.pushReplacementNamed(context, 'singup'),
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    ));
  }
}
