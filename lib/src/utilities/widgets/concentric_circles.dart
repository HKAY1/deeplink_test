import '../export.dart';

class ConcentricCircles extends StatelessWidget {
  const ConcentricCircles({
    super.key,
    this.child,
    this.innerCircleColor,
    this.outerCircleColor,
    this.height,
    this.width,
    this.gapBetweenOuterAndInnerCircle,
  });

  final Widget? child;
  final double? height;
  final double? width;
  final Color? innerCircleColor;
  final Color? outerCircleColor;
  final double? gapBetweenOuterAndInnerCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? Scale.screenWidth * 0.13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: innerCircleColor ?? ColorPallet.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: outerCircleColor ?? ColorPallet.primaryBlue,
          width: gapBetweenOuterAndInnerCircle ?? 1.5,
        ),
      ),
      child: child,
    );
  }
}
