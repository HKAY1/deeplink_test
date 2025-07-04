import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/providers/homepage_provider.dart';
import 'package:inshort_test/src/view/homepage/homepage.dart';

import 'utilities/export.dart';

class AppPage extends ConsumerStatefulWidget {
  const AppPage({super.key});

  @override
  ConsumerState<AppPage> createState() => _AppPageState();
}

class _AppPageState extends ConsumerState<AppPage> {
  final AppLinks _appLinks = AppLinks();
  @override
  void initState() {
    // Initializing screen scale so that the screen layout can be adjusted according to screen size.
    // This will let us use .screenHeight .screenWidth .toScale extensions.
    Scale.initialize();

    super.initState();
    _appLinks.uriLinkStream.listen((Uri? uri) {
      final movieId = uri!.queryParameters['id'];
      if (movieId!.isNotEmpty) {
        // Now fetch or match this ID with your local list/database
        final movie = ref
            .read(homepageProvider.notifier)
            .getMovieById(int.tryParse(movieId) ?? 0);

        Keys.navigatorKey.currentState!.pushNamed(
          Navigation.videoDetails,
          arguments: {'video': movie},
        );
      } else {
        Log.error('Invalid movie ID in deep link');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Keeping the whole app on stack gives us lots of benifits. Like showing an overlay.
    // Easier way to control inApp Notificaiton UI and many more
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[const Homepage(), DialogService.instance.widget],
        ),
      ),
    );
  }
}
