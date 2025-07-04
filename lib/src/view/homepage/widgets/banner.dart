import 'package:inshort_test/src/repository/homepage/model/video_model.dart';
import 'package:inshort_test/src/services/services_export.dart';
import 'package:inshort_test/src/utilities/export.dart';

class HomeBanner extends StatelessWidget {
  final VideoModel video;
  const HomeBanner({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220.toScale,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
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
        Positioned(
          left: 24,
          bottom: 32,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.title,
                style: ThemeService.headline4.copyWith(
                  color: ColorPallet.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 8, color: ColorPallet.black)],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.toScale),
              Row(
                children: [
                  const Icon(Icons.star, color: ColorPallet.rating, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    video.voteAverage.toStringAsFixed(1),
                    style: ThemeService.bodyText1.copyWith(
                      color: ColorPallet.white,
                    ),
                  ),
                  SizedBox(width: 20.toScale),
                  const Icon(
                    Icons.calendar_today,
                    color: ColorPallet.white,
                    size: 15,
                  ),
                  const SizedBox(width: 4),
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
      ],
    );
  }
}
