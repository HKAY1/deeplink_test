// ignore_for_file: use_build_context_synchronously

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/providers/homepage_provider.dart';
import '../../services/services_export.dart';
import '../../utilities/export.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late bool isOnBoardingCompleted;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    // Initializing screen scale so that the screen layout can be adjusted according to screen size.
    // This will let us use .toHeight .toWidth .toFont extensions.Scale.initialize();
    Scale.initialize();

    isOnBoardingCompleted = StorageService.instance.readBool(
      PrefKeys.onBoardingCompleted,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Initializing dio and adding interceptors.
      // [ Note: This is done before repo initialization because we need to initilaze each and every repo clients. ]
      // Initializing ApiClient [ Dio ], This will also add interceptors.
      ApiClient.instance.initialize();

      // Passing all the repos that are going to be used in the app
      await AppService.instance.initialize();

      // if (isOnBoardingCompleted) _navigate();
      ref.read(homepageProvider.notifier).fetchHomePage();
      if (true) _navigate();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Scale.screenWidth,
        child: SizedBox(
          height: Scale.screenHeight,
          width: Scale.screenWidth,
          child: ScaleTransition(scale: _animation, child: FlutterLogo()),
        ),
      ),
    );
  }

  void _navigate() {
    Future<void>.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, Navigation.appPage);
    });
  }
}
