import 'dart:ui';

import 'package:shimmer/shimmer.dart';

import '../export.dart';

extension WidgetExtensions on Widget {
  Widget glassMorphism({
    double frostValue = 16.0,
    Color? frostColor,
    double radiusCurve = 8.0,
    BorderRadiusGeometry? radius,
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(radiusCurve),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: frostValue, sigmaY: frostValue),
        child: Container(
          color: frostColor ?? Colors.grey.shade600.withValues(alpha: 0.2),
          child: this,
        ),
      ),
    );
  }

  Widget shimmer({double? radius, BoxDecoration? decoration}) {
    return Shimmer.fromColors(
      baseColor: ColorPallet.grey200,
      highlightColor: ColorPallet.shimmerHighlight,
      child: Container(
        decoration:
            decoration ??
            BoxDecoration(
              color: ColorPallet.white,
              borderRadius: BorderRadius.circular(radius ?? 20.toScale),
            ),
        child: this,
      ),
    );
  }
}
