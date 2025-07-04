import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../export.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.image,
    this.radius,
    this.onUpdate,
    this.onRemove,
  });
  final Uint8List? image;
  final double? radius;
  final Function(XFile? file)? onUpdate;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorPallet.lightGrey,
      radius: radius ?? Scale.screenHeight * 0.06,
      backgroundImage:
          image != null
              ? MemoryImage(image!)
              : const CachedNetworkImageProvider(
                "https://picsum.photos/200/300",
              ),
    );
  }
}
