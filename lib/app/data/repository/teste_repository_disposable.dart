import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TesteDisposable extends DisposableInterface {
  final StreamController<int> _streamConsumer = StreamController.broadcast();

  //RxInt intController = 0.obs;

  Sink testeSink;

  Stream testeStream;

  RxInt _rxInt = 0.obs;

  int testeInt = 0;

  int intRx() => _rxInt.value;

  void changeInt(int value) => _rxInt.value = value;

  StreamSubscription subscription;

  TesteDisposable() {
    testeSink = _streamConsumer.sink;
    testeStream = _streamConsumer.stream;

    subscription = testeStream.listen((event) {
      testeInt++;
      changeInt(testeInt);
    });

    //faz o listen e já adiciona valor ao fluxo
    // _rxInt.bindStream(testeStream);
  }

  @override
  onClose() {
    _streamConsumer.close();
    testeSink.close();
    subscription.cancel();

    debugPrint('############');
    debugPrint('StreamController == Close');
    debugPrint('-----------------');
    return super.onClose();
  }
}
