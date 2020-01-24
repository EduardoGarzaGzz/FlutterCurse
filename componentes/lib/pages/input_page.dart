import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  _InputPageState createState() => new _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '', _email = '', _password = '', _fecha = '';
  List<String> _poderes = ['Volar', 'Rayos x', 'Super aliento', 'Super fuerza'];
  String _optSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          this._crearInput(),
          Divider(),
          this._crearEmail(),
          Divider(),
          this._createPassword(),
          Divider(),
          this._createFecha(context),
          Divider(),
          this._createDropdown(),
          Divider(),
          this._crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text("Letras: ${this._nombre.length}"),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (val) {
        setState(() {
          this._nombre = val;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras: ${this._email.length}'),
          hintText: 'Email de la persona',
          labelText: 'Email',
          helperText: 'Solo es el email',
          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.email)),
      onChanged: (val) {
        setState(() {
          this._email = val;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras: ${this._password.length}'),
          hintText: 'Tu contraseña',
          labelText: 'Contraseña',
          helperText: 'Solo tu contraseña',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock)),
      onChanged: (val) {
        setState(() {
          this._password = val;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Correo es: $_email'),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        this._fecha = picked.toString();
        this._inputFieldDateController.text = this._fecha;
      });
    }
  }

  Widget _createFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      autofocus: false,
      controller: this._inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          helperText: 'Solo tu fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        this._selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> _getOptionsDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    this._poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: this._optSeleccionada,
            items: this._getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                this._optSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }
}
