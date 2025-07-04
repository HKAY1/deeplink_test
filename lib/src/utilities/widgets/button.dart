import '../../services/services_export.dart';
import '../export.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    required this.text,
    this.color = ColorPallet.primaryBlue,
    this.radius = 1000.0,
    this.padding,
    this.width,
    this.height,
    this.textStyle,
    this.isLoading = false,
    this.shadowColor,
    this.iconColor,
    this.showShadow = false,
    this.icon,
    this.iconSize = 20,
  });

  final VoidCallback? onTap;
  final Color color;
  final String text;
  final String? icon;
  final double? width;
  final double? height;
  final double iconSize;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool showShadow;
  final Color? shadowColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isLoading
          ? SizedBox(
              height: height,
              width: width,
              child: const LineLoader(),
            )
          : Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                boxShadow: showShadow
                    ? ColorPallet.buttonShadow(color: shadowColor)
                    : null,
              ),
              child: TextButton.icon(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  padding: padding,
                ),
                label: FittedBox(
                    child: Text(text,
                        style: textStyle ?? ThemeService.buttonText)),
                icon: icon != null
                    ? IconFromImage(
                        icon!,
                        color: iconColor,
                        size: iconSize,
                      )
                    : null,
              ),
            ),
    );
  }
}
