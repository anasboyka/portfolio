import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection {
  Stream<NetworkStatus> get networkStatus =>
      Connectivity().onConnectivityChanged.map((event) {
        //print(event);
        if (event == ConnectivityResult.none) {
          return NetworkStatus(isOnline: false, result: event);
        } else {
          return NetworkStatus(isOnline: true, result: event);
        }
      });
}

class NetworkStatus {
  bool isOnline;
  ConnectivityResult? result;
  NetworkStatus({
    this.isOnline = true,
    this.result,
  });
}
