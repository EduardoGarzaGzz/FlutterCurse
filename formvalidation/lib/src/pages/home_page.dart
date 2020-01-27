import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargandoProductos();

    return Scaffold(
        appBar: AppBar(title: Text('Home page')),
        body: this._crearListado(productosBloc),
        floatingActionButton: this._crearBoton(context));
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado(ProductosBloc bloc) {
    return StreamBuilder(
      stream: bloc.productosStream,
      builder: (BuildContext ctx, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (ctx, idx) {
              return this._crearItem(ctx, bloc, snapshot.data[idx]);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc bloc, ProductoModel data) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (dir) {
          bloc.borrarProducto(data.id);
        },
        child: Card(
          child: Column(
            children: <Widget>[
              (data.fotoUrl == null)
                  ? Image(
                      image: AssetImage('assets/no-image.png'),
                    )
                  : FadeInImage(
                      image: NetworkImage(data.fotoUrl),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                title: Text('${data.titulo}  -  ${data.valor}'),
                subtitle: Text(data.id),
                onTap: () => Navigator.pushNamed(context, 'producto', arguments: data),
              )
            ],
          ),
        ));
  }
}
