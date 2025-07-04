import 'package:flutter/services.dart';

import '../export.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle(this.image,
      {super.key, this.height, this.outerCircleColor = ColorPallet.grey});
  final Uint8List? image;
  final double? height;
  final Color outerCircleColor;

  @override
  Widget build(BuildContext context) {
    return ConcentricCircles(
      height: height,
      outerCircleColor: outerCircleColor,
      child: Padding(
        padding: EdgeInsets.all(2.toScale),
        child: ProfileImage(image: image),
      ),
    );
  }
}
