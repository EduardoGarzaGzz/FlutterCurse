import 'dart:async';

import 'package:qrreaderapp/src/bloc/validator.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _scansBloc = new ScansBloc._();

  factory ScansBloc() {
    return _scansBloc;
  }

  ScansBloc._() {
    this.getScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream =>
      this._scansController.stream.transform(validatorGeo);

  Stream<List<ScanModel>> get scansStreamHttp =>
      this._scansController.stream.transform(validatorHttp);

  dispose() {
    this._scansController?.close();
  }

  getScans() async {
    this._scansController.sink.add(await DBProvider.db.getScans());
  }

  addScan(ScanModel model) async {
    await DBProvider.db.nuevoScan(model);
    this.getScans();
  }

  deleteScans(int id) async {
    await DBProvider.db.deleteScan(id);
    this.getScans();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.getScans();
  }
}
