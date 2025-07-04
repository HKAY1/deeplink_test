import '../../services/services_export.dart';
import '../export.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? buttonText;
  final String? closeButtonText;
  final Color? closeButtonColor;
  final Color? closeTextColor;
  final VoidCallback? onTap;
  final VoidCallback? onClose;
  final EdgeInsets? padding;
  final bool? centerContent;

  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    this.buttonText,
    this.onTap,
    this.closeButtonText,
    this.onClose,
    this.closeButtonColor,
    this.closeTextColor,
    this.padding,
    this.centerContent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.toScale),
      ),
      insetPadding: padding,
      elevation: 5,
      backgroundColor: ColorPallet.lightGrey,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.toScale,
        right: 18.toScale,
        bottom: 18.toScale,
        top: 22.toScale,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            centerContent!
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: ThemeService.headline5.copyWith(
              fontWeight: FontWeight.w500,
              // color: ColorPallet.white,
            ),
          ),
          SizedBox(height: 4.toScale),
          Text(
            textAlign: centerContent! ? TextAlign.center : TextAlign.start,
            description,
            style: ThemeService.headline6.copyWith(
              // color: ColorPallet.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12.toScale),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Button(
                  text: closeButtonText ?? Strings.close,
                  width: double.maxFinite,
                  color: closeButtonColor ?? ColorPallet.white,
                  showShadow: true,
                  textStyle: ThemeService.bodyText2.copyWith(
                    color: closeTextColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (onClose != null) onClose!();
                  },
                ),
              ),
              SizedBox(width: 10.toScale),
              buttonText != null
                  ? Expanded(
                    child: Button(
                      text: buttonText!,
                      width: double.maxFinite,
                      color: ColorPallet.blueGrey,
                      shadowColor: ColorPallet.blueGrey,
                      showShadow: true,
                      textStyle: ThemeService.bodyText2.copyWith(
                        color: ColorPallet.white,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        if (onTap != null) {
                          onTap!();
                        }
                      },
                    ),
                  )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
