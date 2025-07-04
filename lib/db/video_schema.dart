class VideoSchema {
  // Table Name
  static const String tableName = 'video';

  // Column Names
  static const String id = 'id';
  static const String adult = 'adult';
  static const String backdropPath = 'backdrop_path';
  static const String genreIds = 'genre_ids';
  static const String originalLanguage = 'original_language';
  static const String originalTitle = 'original_title';
  static const String overview = 'overview';
  static const String popularity = 'popularity';
  static const String posterPath = 'poster_path';
  static const String releaseDate = 'release_date';
  static const String title = 'title';
  static const String video = 'video';
  static const String voteAverage = 'vote_average';
  static const String voteCount = 'vote_count';
  static const String isBookMarked = 'is_bookmarked';

  // DataTypes
  static const String idType = 'INTEGER ';
  static const String adultType = 'BOOLEAN NOT NULL DEFAULT 0';
  static const String backdropPathType = 'TEXT';
  static const String genreIdsType = '';
  static const String originalLanguageType = 'TEXT NOT NULL';
  static const String originalTitleType = 'TEXT NOT NULL';
  static const String overviewType = 'TEXT NOT NULL';
  static const String popularityType = 'REAL NOT NULL';
  static const String posterPathType = 'TEXT NOT NULL';
  static const String releaseDateType = 'TEXT NOT NULL';
  static const String titleType = 'TEXT NOT NULL';
  static const String videoType = 'BOOLEAN NOT NULL DEFAULT 0';
  static const String voteAverageType = 'REAL NOT NULL';
  static const String voteCountType = 'REAL NOT NULL';
  static const String isBookMarkedType = 'BOOLEAN NOT NULL DEFAULT 0';

  //List of columns
  static const List<String> columns = [
    id,
    adult,
    backdropPath,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
    isBookMarked,
  ];

  static final String createTable = '''CREATE TABLE $tableName (
      $id $idType, 
      $adult $adultType, 
      $backdropPath $backdropPathType, 
      $originalLanguage $originalLanguageType,
      $originalTitle $originalTitleType,
      $overview $overviewType,
      $popularity $popularityType,
      $posterPath $posterPathType,
      $releaseDate $releaseDateType,
      $title $titleType,
      $video $videoType,
      $voteAverage $voteAverageType,
      $voteCount $voteCountType,
      $isBookMarked $isBookMarkedType
      )''';
}
