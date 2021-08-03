import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> get isConnectedV2;
  Future<bool> get isHostReachable;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  // TODO: implement isConnectedV2
  Future<bool> get isConnectedV2 async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> get isHostReachable async {
    final result = await connectionChecker.isHostReachable(
      AddressCheckOptions(
        InternetAddress('1.1.1.1'),
        timeout: const Duration(
          milliseconds: 3000,
        ),
      ),
    );

    return result.isSuccess;
  }
}
