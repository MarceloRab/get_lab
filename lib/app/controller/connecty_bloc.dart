import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectyBloc extends DisposableInterface {
  final StreamController<bool> _connecTyController =
      StreamController.broadcast();

  Connectivity connectivity;

  Sink get connectySink => _connecTyController.sink;

  Stream<bool> get connectyStream => _connecTyController.stream;

  ConnectyBloc() {
    connectivity = Connectivity();
    initialiseTestInterGeral();
  }

  Future<void> initialiseTestInterGeral() async {
    //final ConnectivityResult result = await connectivity.checkConnectivity();
    //_checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  Future<void> _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }

    _connecTyController.add(isOnline);
  }

  @override
  onClose() {
    _connecTyController.close();
    return super.onClose();
  }
}
