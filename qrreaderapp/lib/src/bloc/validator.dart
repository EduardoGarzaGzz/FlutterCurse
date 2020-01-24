import 'dart:async';

import 'package:qrreaderapp/src/models/scan_model.dart';

class Validators {
  final validatorGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    sink.add(scans.where((s) => s.tipo == 'geo').toList());
  });

  final validatorHttp =
  StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
      handleData: (scans, sink) {
        sink.add(scans.where((s) => s.tipo == 'http').toList());
      });
}
