import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/export.dart';

class InternetConnectivity extends StateNotifier<bool> {
  InternetConnectivity._() : super(false);
  static final InternetConnectivity instance = InternetConnectivity._();
  bool isConnected = false;

  void initialize() {
    startListeningForInternetConnectivity();
  }

  final Connectivity _connectivity = Connectivity();
  // final BuildContext context = Keys.navigatorKey.currentContext!;

  List<ConnectivityResult>? _previousConnectivity;

  Future<void> startListeningForInternetConnectivity() async {
    final List<ConnectivityResult> result =
        await _connectivity.checkConnectivity();
    _showDialog(result);
    _connectivity.onConnectivityChanged.listen(_showDialog);
  }

  void _showDialog(List<ConnectivityResult> result) {
    if (_isConnected(result)) {
      state = true;
      if (_previousConnectivity == null) return;
      if (_isConnected(_previousConnectivity!)) return;
      DialogService.instance.showDialog(
        message: Strings.backOnline,
        textColor: ColorPallet.darkGreen,

        iconBackGroundColor: ColorPallet.darkGreen,
        duration: const Duration(seconds: 2),
      );
    } else {
      state = false;
      DialogService.instance.showDialog(
        message: Strings.internetError,
        textColor: ColorPallet.darkRed,

        iconBackGroundColor: ColorPallet.darkRed,
        duration: const Duration(seconds: 2),
      );
    }

    _previousConnectivity = result;
  }

  bool _isConnected(List<ConnectivityResult> result) {
    isConnected =
        result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
    return isConnected;
  }

  Future<bool> checkConnection() async {
    final List<ConnectivityResult> result =
        await _connectivity.checkConnectivity();
    return _isConnected(result);
  }
}

final internetConnectivityProvider =
    StateNotifierProvider<InternetConnectivity, bool>(
      (ref) => InternetConnectivity.instance,
    );
