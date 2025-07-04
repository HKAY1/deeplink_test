import '../export.dart';

class IconFromImage extends StatelessWidget {
  const IconFromImage(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  final String icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: (size ?? 22).toScale,
      width: (size ?? 22).toScale,
      color: color,
      fit: BoxFit.fitHeight,
    );
  }
}
