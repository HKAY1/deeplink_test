import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/repository/homepage/homepage_repo.dart';
import 'package:inshort_test/src/repository/homepage/model/video_model.dart';
import 'package:inshort_test/src/utilities/export.dart';
import 'package:share_plus/share_plus.dart';

class HomepageNotifier extends ChangeNotifier {
  HomepageNotifier() : super();

  bool isTrendingLoading = false;
  bool isNowPlayingLoading = false;
  final List<VideoModel> trendingVideos = [];
  final List<VideoModel> nowPlayingVideos = [];
  final repo = HomepageRepo.instance;

  Future<void> fetchHomePage() async {
    try {
      isTrendingLoading = true;
      isNowPlayingLoading = true;
      notifyListeners();
      await repo.fetchVideos().then((v) {
        fetchTrending();
        fetchPlaying();
      });
    } catch (e) {
      Log.error(e);
      DialogService.instance.showDialog(
        message: 'Something went wrong while fetching homepage data',
      );
    }
  }

  Future<void> fetchTrending() async {
    try {
      isTrendingLoading = true;
      notifyListeners();
      final response = await repo.fetchTrending();
      Log.info('Trending videos fetched: ${response.length}');
      trendingVideos.clear();
      trendingVideos.addAll(response);
      isTrendingLoading = false;
      notifyListeners();
    } catch (e) {
      DialogService.instance.showDialog(
        message: 'Failed to fetch trending videos',
      );
    }
  }

  Future<void> fetchPlaying() async {
    try {
      isNowPlayingLoading = true;
      notifyListeners();
      final response = await repo.fetchNowPlaying();
      nowPlayingVideos.clear();
      nowPlayingVideos.addAll(response);
      isNowPlayingLoading = false;
      notifyListeners();
    } catch (e) {
      DialogService.instance.showDialog(
        message: 'Failed to fetch trending videos',
      );
    }
  }

  Future<void> addBookMark({
    required int id,
    required bool isBookMarked,
  }) async {
    try {
      final video = nowPlayingVideos.firstWhere(
        (video) => video.id == id,
        orElse:
            () => trendingVideos.firstWhere(
              (video) => video.id == id,
              orElse: () => throw Exception('Video not found'),
            ),
      );
      await repo.addBookMark(id: id, isBookMarked: isBookMarked);
      final updatedVideo = video.copyWith(isBookMarked: !isBookMarked);
      if (nowPlayingVideos.contains(video)) {
        final index = nowPlayingVideos.indexOf(video);
        nowPlayingVideos[index] = updatedVideo;
      }
      if (trendingVideos.contains(video)) {
        final index = trendingVideos.indexOf(video);
        trendingVideos[index] = updatedVideo;
      }
      notifyListeners();
    } catch (e) {
      DialogService.instance.showDialog(message: 'Failed to bookmark video');
    }
  }

  void shareMovie(VideoModel movie) {
    final deepLink = 'yourapp://movie/video-details/?id=${movie.id}';
    Share.share('Check out this movie: $deepLink');
  }

  VideoModel getMovieById(int id) {
    final video = nowPlayingVideos.firstWhere(
      (video) => video.id == id,
      orElse:
          () => trendingVideos.firstWhere(
            (video) => video.id == id,
            orElse: () => throw Exception('Video not found'),
          ),
    );
    return video;
  }
}

final homepageProvider = ChangeNotifierProvider((ref) {
  return HomepageNotifier();
});
