import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    initConnectivity();

    super.onInit();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on PlatformException catch (_e) {
      Future.delayed(const Duration(seconds: 1));
      print(_e.toString());
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.mobile:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.wifi:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 3;
        break;

      default:
        print('dmncbn');
        break;
    }
  }
}
