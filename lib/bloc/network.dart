import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

import './bloc.dart';

class NetworkBloc implements Bloc {
  Connectivity connectivity = Connectivity();
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  Stream<bool> get connection => _controller.stream;

  NetworkBloc() {
    _checkConnection();
  }
  _checkConnection() async {
    ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        String wifiName, wifiBSSID, wifiIP;
        try {
          print(wifiBSSID);
          print(wifiName);
          print(wifiIP);
          if (Platform.isIOS) {
            LocationAuthorizationStatus status =
                await connectivity.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status = await connectivity.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiName = await connectivity.getWifiName();
            } else {
              wifiName = await connectivity.getWifiName();
            }
          } else {
            wifiName = await connectivity.getWifiName();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          _controller.sink.add(false);
        }

        try {
          if (Platform.isIOS) {
            LocationAuthorizationStatus status =
                await connectivity.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status = await connectivity.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiBSSID = await connectivity.getWifiBSSID();
            } else {
              wifiBSSID = await connectivity.getWifiBSSID();
            }
          } else {
            wifiBSSID = await connectivity.getWifiBSSID();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          _controller.sink.add(false);
        }

        try {
          wifiIP = await connectivity.getWifiIP();
        } on PlatformException catch (e) {
          print(e.toString());
          _controller.sink.add(false);
        }

        _controller.sink.add(true);
        break;
      case ConnectivityResult.mobile:
        print("mobile");
        _controller.sink.add(true);
        break;
      case ConnectivityResult.none:
        _controller.sink.add(false);
        break;
      default:
        _controller.sink.add(false);
        break;
    }
  }

  @override
  void dispose() {
    _controller.close();
  }
}
