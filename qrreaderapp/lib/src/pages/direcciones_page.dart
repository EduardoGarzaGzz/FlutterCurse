import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/utils/utils.dart';

class DireccionesPage extends StatelessWidget {
  final scansBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
    this.scansBloc.getScans();

    return StreamBuilder<List<ScanModel>>(
      stream: this.scansBloc.scansStreamHttp,
      builder: (BuildContext ctx, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No hay scans'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, i) =>
                  Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (dir) =>
                        this.scansBloc.deleteScans(snapshot.data[i].id),
                    child: ListTile(
                      leading: Icon(
                        Icons.cloud_queue,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                      title: Text(snapshot.data[i].valor),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                      onTap: () => abrirScan(context, snapshot.data[i]),
                    ),
                  ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}