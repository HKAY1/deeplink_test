import 'package:dio/dio.dart';
import '../utilities/export.dart';
import 'services_export.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient _instance = ApiClient._();
  static ApiClient get instance => _instance;

  late Dio _dio;
  Dio get getClient => _dio;

  late Dio _syncDio;
  Dio get getSyncClient => _syncDio;

  void initialize() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 25000),
      receiveTimeout: const Duration(milliseconds: 25000),
      contentType: 'application/json',
      baseUrl: AppInfoService.instance.baseUrl,
    );

    _dio = Dio(baseOptions);
    _syncDio = Dio(baseOptions);

    // Adding Interceptors
    _dio.interceptors.add(CommonInterceptor());
  }
}
