
import 'dart:io';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductosBloc {
  final _productoController = BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = BehaviorSubject<bool>();
  final _productosProvider = ProductosProvider();

  Stream<List<ProductoModel>> get productosStream => this._productoController.stream;
  Stream<bool> get cargandoStream => this._cargandoController.stream;

  void cargandoProductos() async {
    final productos = await this._productosProvider.cargarProductos();
    this._productoController.sink.add(productos);
  }

  void agregarProducto(ProductoModel producto) async {
    this._cargandoController.sink.add(true);
    await this._productosProvider.crearProducto(producto);
    this._cargandoController.sink.add(false);
  }

  Future<String> subirFoto(File foto) async {
    this._cargandoController.sink.add(true);
    final urlFoto = await this._productosProvider.subirImagen(foto);
    this._cargandoController.sink.add(false);
    return urlFoto;
  }

  void editarProducto(ProductoModel producto) async {
    this._cargandoController.sink.add(true);
    await this._productosProvider.editarProducto(producto);
    this._cargandoController.sink.add(false);
  }

  void borrarProducto(String id) async {
    await this._productosProvider.borrarProducto(id);
  }

  dispose() {
    this._productoController?.close();
    this._cargandoController?.close();
  }
}
