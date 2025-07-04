import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/providers/homepage_provider.dart';
import 'package:inshort_test/src/repository/homepage/model/video_model.dart';
import 'package:inshort_test/src/services/theme_service.dart';
import 'package:inshort_test/src/utilities/export.dart';

class MovieCard extends StatelessWidget {
  final VideoModel video;
  const MovieCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Navigation.videoDetails,
          arguments: {'video': video},
        );
      },
      child: Container(
        width: 150.toScale,
        margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorPallet.black.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF2D5A3D), Color(0xFF1A3D2E)],
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w780${video.posterPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      video.title,
                      style: ThemeService.bodyText1.copyWith(
                        color: ColorPallet.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(blurRadius: 6, color: ColorPallet.black),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: ColorPallet.rating,
                          size: 15,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          video.voteAverage.toStringAsFixed(1),
                          style: ThemeService.bodyText2.copyWith(
                            color: ColorPallet.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.calendar_today,
                          color: ColorPallet.white,
                          size: 13,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          video.releaseDate.split('-').first,
                          style: ThemeService.bodyText2.copyWith(
                            color: ColorPallet.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Bookmark icon at top right
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorPallet.black.withValues(alpha: 0.7),
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
        ),
      ),
    );
  }
}
