import 'package:inshort_test/src/repository/homepage/model/video_model.dart';

abstract class HomePageContract {
  Future<void> fetchVideos();
  Future<List<VideoModel>> fetchTrending();
  Future<List<VideoModel>> fetchNowPlaying();
  Future<void> addBookMark({required int id, required bool isBookMarked});
}
