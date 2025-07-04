import 'package:package_info_plus/package_info_plus.dart';

import '../utilities/export.dart';

class AppInfoService {
  AppInfoService._();
  static final AppInfoService _instance = AppInfoService._();
  static AppInfoService get instance => _instance;

  Future<void> initialize() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _packageName = packageInfo.packageName;
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _baseUrl = 'https://api.themoviedb.org/3/';
    _currency = 'INR';
    _currencySymbol = '₹';
    _genders = <String>['Male', 'Female', 'Others'];

    Log.info('''
    appName: ${packageInfo.appName};
    packageName: ${packageInfo.packageName};
    version: ${packageInfo.version};
    buildNumber: ${packageInfo.buildNumber};
    baseUrl $_baseUrl;
    ''');
  }

  late String _appName;
  String get appName => _appName;

  late String _packageName;
  String get packageName => _packageName;

  late String _version;
  String get version => _version;

  late String _buildNumber;
  String get buildNumber => _buildNumber;

  late String _currency;
  String get currency => _currency;

  late String _currencySymbol;
  String get currencySymbol => _currencySymbol;

  late String _baseUrl;
  String get baseUrl => _baseUrl;

  late List<String> _genders;
  List<String> get genders => _genders;

  late String _mapApiKey;
  String get mapApiKey => _mapApiKey;
}
