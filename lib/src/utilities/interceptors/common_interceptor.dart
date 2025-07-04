import 'dart:io';
import 'package:dio/dio.dart';
import '../export.dart';

class CommonInterceptor extends Interceptor {
  final BuildContext? context = Keys.navigatorKey.currentContext;
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is SocketException) {
      _showErrorDialog(Strings.internetError);
    } else if (err.response?.data['message'] == 'Invalid Token') {
      if (context != null) {
        _showErrorDialog(Strings.sessionExpired);
        // Logout implementation
        return;
      }
    }
    final AppError error = AppError.createError(err);
    super.onError(error, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final Map<String, dynamic> headers = options.headers;
    // headers['accessToken'] = StorageService.instance.accessToken;
    super.onRequest(options, handler);
  }

  void _showErrorDialog(String message) {
    DialogService.instance.showDialog(
      message: message,
      textColor: ColorPallet.darkRed,
      iconBackGroundColor: ColorPallet.darkRed,
      autoHide: false,
    );
  }
}
