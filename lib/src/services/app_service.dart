// This class is used to initialize every required dependency in the app
// For ex: 1. Shared Preferences 2. Any startup dependencies etc.
// import 'database/local_server_service.dart';
import 'services_export.dart';

class AppService {
  AppService._();
  factory AppService() => _instance;
  static final AppService _instance = AppService._();
  static AppService get instance => _instance;

  // There is a reason that all the repositories are nullable.
  // OtherWise for the test cases we have to initialize each and every repo and that is not feasible.
  Future<void> initialize() async {
    // Initializing repositories
    // _authenticationRepository = authenticationRepo;

    // Initializing internet Connectivity stream which will automatically show an overlay based on connectivity.
    InternetConnectivity.instance.initialize();

    await Future.wait(<Future<void>>[
      // Initializing DeviceInfoService so that this can get the data of current device and thus it can be used in logging service.
      // [ Note: This is a dependency for signUp since we need to send device info to backend. ]
      DeviceInfoService.getInstacne.initialize(),
      IsolateService.instance.initialize(),
    ]);
  }

  // Defining all the repositories required with in the app.
  // [ Note: Make sure to check for null value while sending any repo. OtherWise throw an Exception. ]
  // AuthRepo? _authenticationRepository;
  // AuthRepo get authenticationRepo {
  //   if (_authenticationRepository != null) return _authenticationRepository!;
  //   throw Exception('AuthenticationRepo not initialized');
  // }
}
