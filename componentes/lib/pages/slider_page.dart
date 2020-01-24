import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquerCehck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              this._crearSlider(),
              this._checkBox(),
              this._crearSwitch(),
              Expanded(
                child: this._crearImage(),
              ),
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      min: 10.0,
      max: 400.0,
      value: this._valorSlider,
      onChanged: (this._bloquerCehck)
          ? null
          : (valor) {
        setState(() {
          this._valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage(
          'https://p7.hiclipart.com/preview/992/97/208/batman-superhero-legion-of-super-heroes-character-breakfast.jpg'),
      width: this._valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: this._bloquerCehck,
        onChanged: (val) {
          setState(() {
            this._bloquerCehck = val;
          });
        }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: this._bloquerCehck,
        onChanged: (val) {
          setState(() {
            this._bloquerCehck = val;
          });
        }
    );
  }
}
