import '../export.dart';

class CircularBackButton extends StatelessWidget {
  const CircularBackButton({
    super.key,
    this.color,
    this.margin,
    this.customCallback,
    this.tag,
  });

  final Color? color;
  final EdgeInsetsGeometry? margin;
  final String? tag;

  // Note that the default Navigator.pop() will not work if you pass this value
  final VoidCallback? customCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: Alignment.topLeft,
      child: FloatingActionButton(
        onPressed: customCallback ?? () => Navigator.pop(context),
        heroTag: HeroTags.circularBackButton,
        elevation: 0,
        backgroundColor: color ?? ColorPallet.lightGrey.withValues(alpha: 0.8),
        shape: const CircleBorder(),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18.toScale,
          color: ColorPallet.darkBlueGrey,
        ),
      ),
    );
  }
}
