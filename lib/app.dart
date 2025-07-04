import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/services/services_export.dart';
import 'src/utilities/export.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(themeService);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeService.light,
      darkTheme: ThemeService.dark,
      themeMode: state,
      navigatorObservers: <NavigatorObserver>[Navigation()],
      navigatorKey: Keys.navigatorKey,
      onGenerateRoute: Navigation.generateRoute,
      initialRoute: Navigation.splashScreen,
    );
  }
}
