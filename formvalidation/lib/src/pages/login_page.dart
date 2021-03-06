import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/models/usuario_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class LoginPage extends StatelessWidget {
  final userProvider = UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          this._crearFondo(context),
          this._loginForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );

    final circulo = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          child: circulo,
          top: 90,
          left: 30,
        ),
        Positioned(
          child: circulo,
          top: -40,
          right: -30,
        ),
        Positioned(
          child: circulo,
          bottom: -40,
          right: -10,
        ),
        Positioned(
          child: circulo,
          bottom: 120,
          right: 20,
        ),
        Positioned(
          child: circulo,
          top: -50,
          left: -20,
        ),
        Container(
            child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.person_pin_circle,
                  size: 100.0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ),
                Text(
                  'Fernando Herrera',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0), boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black26, blurRadius: 3.0, offset: Offset(0.0, 5.0), spreadRadius: 3.0),
            ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 60.0,
                ),
                this._crearEmail(bloc),
                SizedBox(
                  height: 30.0,
                ),
                this._crearPassword(bloc),
                SizedBox(
                  height: 30.0,
                ),
                this._crearBoton(bloc),
              ],
            ),
          ),
          FlatButton(
            child: Text('Crear cuenta'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'registro'),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext ctx, AsyncSnapshot<String> snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electronico',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.deepPurple,
              ),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: (!snapshot.hasData) ? null : () => this._login(bloc, context),
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    final info = await this.userProvider.login(bloc.email, bloc.password);

    if(info['ok']) Navigator.pushReplacementNamed(context, 'home');
    else utils.mostrarAlerta(context, info['mensaje']);

  }
}
