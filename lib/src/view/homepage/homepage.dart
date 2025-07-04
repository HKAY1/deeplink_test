import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/services/services_export.dart';
import 'package:inshort_test/src/utilities/export.dart';
import 'package:inshort_test/src/view/homepage/widgets/banner.dart';
import 'package:inshort_test/src/providers/homepage_provider.dart';
import 'package:inshort_test/src/view/homepage/widgets/movie_card.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final notifier = ref.watch(homepageProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.black,
        appBar: AppBar(
          backgroundColor: ColorPallet.black,
          elevation: 0,
          title: Text(
            Strings.homePagetitle,
            style: ThemeService.headline5.copyWith(
              color: ColorPallet.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () {
            ref.read(homepageProvider.notifier).fetchTrending();
            return ref.read(homepageProvider.notifier).fetchPlaying();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  child: CustomTextField(
                    controller: searchController,
                    fillColor: ColorPallet.primaryBackgroundColor,
                    hintText: "Search for movies",

                    prefixWidget: Icon(Icons.search, color: ColorPallet.black),
                  ),
                ),
                SizedBox(height: 8.toScale),
                // Hero Banner
                if (notifier.nowPlayingVideos.isNotEmpty &&
                    notifier.isNowPlayingLoading == false)
                  HomeBanner(video: notifier.nowPlayingVideos[0]),
                const SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Strings.nowPlaying,
                    style: ThemeService.headline5.copyWith(
                      color: ColorPallet.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(height: 14.toScale),
                Consumer(
                  builder: (context, ref, child) {
                    if (notifier.isNowPlayingLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorPallet.white,
                        ),
                      );
                    }
                    if (notifier.nowPlayingVideos.isEmpty) {
                      return Center(
                        child: Text(
                          Strings.noMovie,
                          style: ThemeService.bodyText1.copyWith(
                            color: ColorPallet.white,
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 220.toScale,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: notifier.nowPlayingVideos.length,
                        itemBuilder: (context, index) {
                          final video = notifier.nowPlayingVideos[index];
                          return MovieCard(video: video);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 32.toScale),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Strings.trending,
                    style: ThemeService.headline5.copyWith(
                      color: ColorPallet.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(height: 14.toScale),
                Consumer(
                  builder: (context, ref, child) {
                    final notifier = ref.watch(homepageProvider);
                    if (notifier.isTrendingLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorPallet.white,
                        ),
                      );
                    }
                    if (notifier.trendingVideos.isEmpty) {
                      return Center(
                        child: Text(
                          Strings.noMovie,
                          style: ThemeService.bodyText1.copyWith(
                            color: ColorPallet.white,
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 220.toScale,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: notifier.trendingVideos.length,
                        itemBuilder: (context, index) {
                          final video = notifier.trendingVideos[index];
                          return MovieCard(video: video);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
