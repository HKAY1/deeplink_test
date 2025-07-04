import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/providers/homepage_provider.dart';
import 'package:inshort_test/src/repository/homepage/model/video_model.dart';
import 'package:inshort_test/src/services/services_export.dart';
import 'package:inshort_test/src/utilities/export.dart';

class VideoDetailsPage extends StatelessWidget {
  final VideoModel video;

  const VideoDetailsPage({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallet.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with backdrop
              Stack(
                children: [
                  Container(
                    height: 300.toScale,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF2D5A3D), Color(0xFF1A3D2E)],
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w780${video.backdropPath}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 300.toScale,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorPallet.transparent,
                          ColorPallet.black.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40.toScale,
                        height: 40.toScale,
                        decoration: BoxDecoration(
                          color: ColorPallet.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: ColorPallet.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorPallet.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Consumer(
                        builder: (context, ref, ch) {
                          return IconButton(
                            icon: Icon(
                              video.isBookMarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: ColorPallet.white,
                              size: 20,
                            ),
                            onPressed: () {
                              ref
                                  .read(homepageProvider.notifier)
                                  .addBookMark(
                                    id: video.id,
                                    isBookMarked: video.isBookMarked,
                                  );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              // Movie details
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.originalTitle,
                      style: ThemeService.headline5.copyWith(
                        color: ColorPallet.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      video.title,
                      style: ThemeService.bodyText1.copyWith(
                        color: ColorPallet.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: ColorPallet.rating,
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          video.voteAverage.toStringAsFixed(1),
                          style: ThemeService.bodyText1.copyWith(
                            color: ColorPallet.white,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.calendar_today,
                          color: ColorPallet.white,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          video.releaseDate.split('-')[0],
                          style: ThemeService.bodyText1.copyWith(
                            color: ColorPallet.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.access_time,
                          color: ColorPallet.white,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '2h 15m',
                          style: ThemeService.bodyText1.copyWith(
                            color: ColorPallet.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Watch movie button
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: ColorPallet.white,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            Strings.watchMovie,
                            style: ThemeService.bodyText1.copyWith(
                              color: ColorPallet.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Action buttons
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorPallet.grey,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.download,
                            color: ColorPallet.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorPallet.grey,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Consumer(
                            builder: (context, ref, ch) {
                              return IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: ColorPallet.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  ref
                                      .read(homepageProvider.notifier)
                                      .shareMovie(video);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Overview
                    Text(
                      Strings.overview,
                      style: ThemeService.headline6.copyWith(
                        color: ColorPallet.white,

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      video.overview,
                      style: ThemeService.bodyText1.copyWith(
                        color: ColorPallet.white,

                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Additional info
                    Text(
                      Strings.details,
                      style: ThemeService.headline6.copyWith(
                        color: ColorPallet.white,

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Language',
                      video.originalLanguage.toUpperCase(),
                    ),
                    _buildDetailRow(
                      'Popularity',
                      video.popularity.toStringAsFixed(1),
                    ),
                    _buildDetailRow('Vote Count', video.voteCount.toString()),
                    _buildDetailRow('Release Date', video.releaseDate),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: ThemeService.bodyText1.copyWith(
                color: ColorPallet.white,

                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            ': ',
            style: ThemeService.bodyText1.copyWith(color: ColorPallet.white),
          ),
          Expanded(
            child: Text(
              value,
              style: ThemeService.bodyText1.copyWith(color: ColorPallet.white),
            ),
          ),
        ],
      ),
    );
  }
}
