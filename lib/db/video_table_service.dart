import 'package:inshort_test/db/video_schema.dart';
import 'package:inshort_test/src/repository/homepage/model/video_model.dart';
import 'package:inshort_test/src/services/local_server_service.dart';

import 'package:sqflite/sqflite.dart';

import '../src/utilities/export.dart';

class VideoTableService {
  // Singleton object of the class
  VideoTableService._();

  static final VideoTableService instance = VideoTableService._();

  Future<void> initialize(Database db) async {
    await _createTable(db);
  }

  // Function for creating a Table
  Future<void> _createTable(Database db) async {
    return await db.execute(VideoSchema.createTable);
  }

  // Insert
  Future<int> insertMovie({required VideoModel video}) async {
    try {
      Database db = await LocalServerService.instance.database;
      final data = video.toMap();
      data['out_of_sync'] = 1;

      var result = await db.insert(VideoSchema.tableName, data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Bulk Insert Operation
  Future<void> bulkInsertMovies({
    required List<Map<String, dynamic>> videos,
  }) async {
    try {
      Log.log(videos.length);
      Database db = await LocalServerService.instance.database;
      Batch batch = db.batch();

      for (var e in videos) {
        batch.insert(VideoSchema.tableName, e);
      }
      await batch.commit();
    } on AppError catch (_) {
      rethrow;
    }
  }

  Future<List<VideoModel>> getAllNowPlayingMovies() async {
    try {
      Database db = await LocalServerService.instance.database;
      String query =
          'SELECT * FROM ${VideoSchema.tableName} WHERE ${VideoSchema.releaseDate}  BETWEEN "2025-03-26" AND "2025-05-07"';

      var result = await db.rawQuery(query);
      final List<VideoModel> videos =
          result.isNotEmpty
              ? result.map((item) => VideoModel.fromMap(item)).toList()
              : [];
      Log.log('Nowplaying table: ${videos.length}');
      return videos;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VideoModel>> getAllTrendingMovies() async {
    try {
      Database db = await LocalServerService.instance.database;
      String query =
          'SELECT * FROM ${VideoSchema.tableName} WHERE ${VideoSchema.popularity} >= 10.00000 ORDER BY ${VideoSchema.popularity} DESC';

      var result = await db.rawQuery(query);
      Log.warning(result);
      final List<VideoModel> videos =
          result.isNotEmpty
              ? result.map((item) => VideoModel.fromMap(item)).toList()
              : [];
      Log.log('Trending table: ${videos.length}');
      return videos;
    } catch (e) {
      Log.error('Error fetching trending movies: $e');
      rethrow;
    }
  }

  /// Delete Operation
  Future<int> deleteMovie({required int id}) async {
    try {
      Database db = await LocalServerService.instance.database;
      final result = await db.delete(
        VideoSchema.tableName,
        where: '${VideoSchema.id} = ?',
        whereArgs: [id],
      );
      return result;
    } on AppError catch (_) {
      rethrow;
    }
  }

  Future<void> bookMarkMovie({
    required int id,
    required bool isBookMarked,
  }) async {
    try {
      Database db = await LocalServerService.instance.database;
      await db.update(
        VideoSchema.tableName,
        {VideoSchema.isBookMarked: isBookMarked ? 0 : 1},
        where: '${VideoSchema.id} = ?',
        whereArgs: [id],
      );
      return;
    } on AppError catch (_) {
      rethrow;
    }
  }

  // Truncate table
  Future<void> truncate() async {
    Log.log('Truncating table: ${VideoSchema.tableName}');
    Database db = await LocalServerService.instance.database;
    await db.rawQuery('DELETE FROM ${VideoSchema.tableName}');
  }
}
