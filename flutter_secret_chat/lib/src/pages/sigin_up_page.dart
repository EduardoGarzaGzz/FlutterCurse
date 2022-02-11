import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secret_chat/src/widgets/circule_widgets.dart';
import 'package:flutter_secret_chat/src/widgets/input_text.dart';

class SingnUpPage extends StatefulWidget {
  @override
  _SingnUpPageState createState() => _SingnUpPageState();
}

class _SingnUpPageState extends State<SingnUpPage> {
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
                                          label: 'USERNAME',
                                          inputType: TextInputType.text,
                                          validator: (val) {
                                            if (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(val))
                                              return null;
                                            else
                                              return 'Invalid username';
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
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
                                          height: 20,
                                        ),
                                        InputText(
                                          label: 'PASSWORD',
                                          isObscure: true,
                                          validator: (val) {
                                            if (val.isNotEmpty && val.length > 5)
                                              return null;
                                            else
                                              return 'Invalid password';
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
                                    'Already have an account?',
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
                          SizedBox(
                            height: size.height * 0.08,
                          )
                        ],
                      ),
                    ))),
            Positioned(
              left: 15,
              top: 5,
              child: SafeArea(
                child: CupertinoButton(
                  color: Colors.black12,
                  padding: EdgeInsets.all(10),
                  borderRadius: BorderRadius.circular(30),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
