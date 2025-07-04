import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/observer.dart';
import 'package:inshort_test/src/services/local_server_service.dart';

import 'app.dart';

import 'src/services/services_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundIsolateBinaryMessenger.ensureInitialized(
    ServicesBinding.rootIsolateToken!,
  );

  // Initializing StorageService which will populate all the Preferences.
  await StorageService.instance.initialize();
  // Populating all the necessary requirements of app. Like:  base url  app version, buildNumber and all.
  // Note that this should be done at the start because rest of the services depend on this.
  await AppInfoService.instance.initialize();
  await LocalServerService.instance.initDatabase();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ProviderScope(observers: [RiverPodObserver()], child: const App()));
}
