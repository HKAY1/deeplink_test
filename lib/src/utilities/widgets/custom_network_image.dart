import 'package:cached_network_image/cached_network_image.dart';

import '../export.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      color: color,
      placeholder: (BuildContext context, String url) {
        return const SnakeLoader();
      },
      errorWidget: (BuildContext context, String url, Object error) {
        return const Icon(
          Icons.error,
          color: ColorPallet.primaryBlue,
        );
      },
    );
  }
}
