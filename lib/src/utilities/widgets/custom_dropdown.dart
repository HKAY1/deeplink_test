import '../../services/services_export.dart';
import '../export.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.controller,
    required this.items,
    this.leadingIcon,
    this.hintText,
    this.value,
    this.validationText,
    this.onChanged,
    this.enabled = true,
    this.fillColor = ColorPallet.white,
    this.borderColor,
  });

  final TextEditingController controller;
  final List<DropdownMenuItem<T>>? items;
  final String? leadingIcon;
  final String? hintText;
  final T? value;
  final String? validationText;
  final bool enabled;
  final Color fillColor;
  final Color? borderColor;
  final Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        padding: EdgeInsets.zero,
        value: value,
        onChanged: onChanged,
        style: ThemeService.hintText.copyWith(
          color: ColorPallet.primaryBlue,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: ColorPallet.black,
        ),
        validator: (T? value) {
          if (value == null) return validationText;
          return null;
        },
        alignment: Alignment.centerLeft,
        borderRadius: BorderRadius.circular(10.toScale),
        decoration: InputDecoration(
          enabled: enabled,
          prefixIcon: leadingIcon != null
              ? Container(
                  width: 42.toScale,
                  alignment: Alignment.center,
                  child: IconFromImage(
                    leadingIcon!,
                    color: ColorPallet.black,
                  ),
                )
              : null,
          isDense: true,
          contentPadding: EdgeInsets.only(
            top: 12.toScale,
            bottom: 12.toScale,
            right: 12.toScale,
            left: 12.toScale,
          ),
          hintStyle: ThemeService.hintText.copyWith(
            color: ColorPallet.black.withValues(alpha: 0.3),
          ),
          hintText: hintText,
          fillColor: fillColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(10.toScale),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(10.toScale),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(10.toScale),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(10.toScale),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(10.toScale),
          ),
        ),
        menuMaxHeight: Scale.screenHeight * 0.24,
        items: items,
      ),
    );
  }
}
