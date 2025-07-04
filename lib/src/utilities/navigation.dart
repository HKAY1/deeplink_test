import 'package:inshort_test/src/app_page.dart';
import 'package:inshort_test/src/repository/homepage/model/video_model.dart';
import 'package:inshort_test/src/view/splash/splash_screen.dart';
import 'package:inshort_test/src/view/video_details/video_details.dart';

import 'export.dart';

class Navigation extends NavigatorObserver {
  static List<Route<dynamic>> routeStack = <Route<dynamic>>[];

  static const String splashScreen = '/';
  static const String appPage = '/app-page';
  static const String videoDetails = '/video-details/.*';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _GenerateRoute(
          child: const SplashScreen(),
          routeName: settings.name!,
        );

      case appPage:
        return _GenerateRoute(
          child: const AppPage(),
          routeName: settings.name!,
        );
      case videoDetails:
        final video = settings.arguments as Map<String, dynamic>;
        return _GenerateRoute(
          child: VideoDetailsPage(video: video['video'] as VideoModel),
          routeName: settings.name!,
        );

      default:
        return _GenerateRoute(child: NoRoute(), routeName: settings.name!);
    }
  }

  // static String getInitialRoute() {
  //   if (StorageService.instance.isLoggedIn) {
  //     return appPage;
  //   }
  //   return login;
  // }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    routeStack.removeLast();
    if (newRoute != null) {
      routeStack.add(newRoute);
    }
  }
}

class _GenerateRoute extends PageRouteBuilder<RouteSettings> {
  final Widget child;
  final String routeName;
  _GenerateRoute({required this.child, required this.routeName})
    : super(
        settings: RouteSettings(name: routeName),
        transitionDuration: const Duration(milliseconds: 100),
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> primary,
          Animation<double> secondary,
          Widget child,
        ) {
          return SlideTransition(
            position: primary.drive(_offset),
            child: child,
          );
        },
        pageBuilder: (
          BuildContext context,
          Animation<double> primary,
          Animation<double> secondary,
        ) {
          return child;
        },
      );

  static final Tween<Offset> _offset = Tween<Offset>(
    begin: const Offset(1.0, 0),
    end: Offset.zero,
  );
}

class NoRoute extends StatefulWidget {
  const NoRoute({super.key});

  @override
  State<NoRoute> createState() => _NoRouteState();
}

class _NoRouteState extends State<NoRoute> {
  @override
  void initState() {
    // This is a fallback route when no route is defined.
    // It will pop the current route and return to the previous one.
    // This is useful for handling deep links or unexpected routes.
    // Don't know why it is navigating to this route.
    Navigator.pop(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('No route defined ')));
  }
}
