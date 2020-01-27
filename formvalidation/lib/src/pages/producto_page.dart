import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductosProvider provider = ProductosProvider();
  ProductoModel producto;
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel tmp = ModalRoute.of(context).settings.arguments;

    if (tmp != null)
      this.producto = tmp;
    else
      this.producto = ProductoModel();

    return Scaffold(
      key: this.scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: this._selecionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: this._tomarFoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: this.formKey,
            child: Column(
              children: <Widget>[
                this._mostrarForo(),
                this._crearNombre(),
                this._crearPrecio(),
                this._crearDisponible(),
                this._crearBoton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: this.producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (val) => this.producto.titulo = val,
      validator: (val) {
        if (val.length < 3)
          return 'Ingrese el nombre del producto';
        else
          return null;
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: this.producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (val) => this.producto.valor = double.parse(val),
      validator: (val) {
        if (utils.isNumeric(val))
          return null;
        else
          return 'Solo numeros';
      },
    );
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: (this._guardando) ? null : () => this._submit(context),
        icon: Icon(Icons.save),
        label: Text('Guardar'));
  }

  void _submit(BuildContext context) async {
    if (!this.formKey.currentState.validate())
      return;
    else
      this.formKey.currentState.save();

    setState(() {
      this._guardando = true;
    });

    if (this.foto != null) {
      producto.fotoUrl = await this.provider.subirImagen(this.foto);
    }

    if (this.producto.id == null)
      this.provider.crearProducto(this.producto);
    else
      this.provider.editarProducto(this.producto);

    this.mostrarSnackbar('Registro guardado');
    Navigator.of(context).pop();
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: this.producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (val) => setState(() {
        this.producto.disponible = val;
      }),
    );
  }

  Widget _mostrarForo() {
    if (producto.fotoUrl != null) {
      return FadeInImage(
        image: NetworkImage(producto.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      if (foto != null) {
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
  }

  void mostrarSnackbar(String msg) {
    final snack = SnackBar(
      content: Text(msg),
      duration: Duration(milliseconds: 1500),
    );

    this.scaffoldKey.currentState.showSnackBar(snack);
  }

  void _selecionarFoto() async {
    this._procesarFoto(ImageSource.gallery);
  }

  void _tomarFoto() async {
    this._procesarFoto(ImageSource.camera);
  }

  _procesarFoto(ImageSource tipo) async {
    this.foto = await ImagePicker.pickImage(source: tipo);

    if (this.foto != null) {
      producto.fotoUrl = null;
    }

    setState(() {});
  }
}
