import 'dart:math';

import '../export.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.icon,
    this.elevation,
    this.iconSize,
    this.color,
    this.iconColor,
    this.onTap,
    this.tag,
    this.mini = false,
  });
  final String icon;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final bool mini;
  final VoidCallback? onTap;
  final String? tag;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      highlightElevation: elevation ?? 0,
      heroTag: tag ?? Random().nextInt(1000000),
      elevation: elevation ?? 0,
      mini: mini,
      backgroundColor: color ?? ColorPallet.lightGrey,
      shape: const CircleBorder(),
      child: IconFromImage(
        icon,
        size: iconSize ?? 22.toScale,
        color: iconColor ?? ColorPallet.darkBlueGrey,
      ),
    );
  }
}
