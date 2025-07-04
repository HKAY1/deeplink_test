import 'package:flutter/services.dart';

import '../../services/services_export.dart';
import '../export.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.suffixWidth,
      this.prefixWidth,
      required this.controller,
      required this.fillColor,
      this.obsecure = false,
      this.autofocus = false,
      this.hintText,
      this.validator,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconPadding,
      this.prefixWidget,
      this.focusNode,
      this.radius,
      this.suffix,
      this.validationText,
      this.maxLength,
      this.keyboardType,
      this.contentPadding,
      this.onTap,
      this.digitsOnly = false,
      this.isObscured = false,
      this.enabled = true,
      this.maxLines = 1,
      this.minLines = 1,
      this.borderColor,
      this.onTapOutside,
      this.inputFormatter});

  final TextEditingController controller;
  final double? suffixWidth;
  final double? prefixWidth;
  final String? hintText;
  final bool obsecure;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? prefixIcon;
  final String? suffixIcon;
  final EdgeInsetsGeometry? prefixIconPadding;
  final Widget? prefixWidget;
  final FocusNode? focusNode;
  final bool autofocus;
  final double? radius;
  final Widget? suffix;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final String? validationText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool digitsOnly;
  final Color fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final bool isObscured;
  final Color? borderColor;
  final TapRegionCallback? onTapOutside;
  final List<TextInputFormatter>? inputFormatter;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled ? 1 : 0.8,
      child: TextFormField(
        onTapOutside: widget.onTapOutside,
        controller: widget.controller,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        style: ThemeService.hintText.copyWith(
          color: ColorPallet.textColor1,
        ),
        obscureText: widget.isObscured,
        validator: widget.validator ??
            (String? value) {
              if (value == null || value.isEmpty) return widget.validationText;
              return null;
            },
        onChanged: widget.onChanged,
        cursorColor: ColorPallet.primaryBlue,
        autofocus: widget.autofocus,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        keyboardType:
            widget.digitsOnly ? TextInputType.number : widget.keyboardType,
        inputFormatters: widget.inputFormatter != null
            ? widget.inputFormatter!
            : <TextInputFormatter>[
                LengthLimitingTextInputFormatter(widget.maxLength),
                if (widget.digitsOnly) FilteringTextInputFormatter.digitsOnly,
              ],
        decoration: InputDecoration(
          hintText: widget.hintText,
          isDense: false,
          contentPadding: widget.contentPadding ?? EdgeInsets.zero,
          hintStyle: ThemeService.hintText.copyWith(
            color: ColorPallet.black.withValues(alpha: 0.3),
            fontStyle: FontStyle.italic,
          ),
          filled: true,
          fillColor: widget.fillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorPallet.grey300,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorPallet.grey300,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorPallet.grey300,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          prefixIcon: _getPrefixIcon(),
          suffixIcon: _getSuffixIcon(),
        ),
      ),
    );
  }

  Widget? _getPrefixIcon() {
    if (widget.prefixIcon != null || widget.prefixWidget != null) {
      return Container(
        margin: EdgeInsets.only(right: 10.toScale),
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          // color: widget.fillColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          border: Border(
            //   top: BorderSide(color: ColorPallet.grey300, width: 1),
            left: BorderSide(color: ColorPallet.grey300, width: 1),
            //   bottom: BorderSide(color: ColorPallet.grey300, width: 1),
          ),
        ),
        width: widget.prefixWidth ?? 12.toScale,
        height: widget.minLines * 19.6,
        alignment: (widget.maxLines > 1 && widget.minLines > 1)
            ? Alignment.topCenter
            : Alignment.center,
        child: widget.prefixWidget ??
            IconFromImage(
              widget.prefixIcon!,
              color: ColorPallet.primaryBlue,
              size: 22.toScale,
            ),
      );
    }
    return null;
  }

  Widget? _getSuffixIcon() {
    if (widget.suffix != null || widget.suffixIcon != null) {
      return Container(
        width: widget.suffixWidth ?? 120.toScale,
        height: widget.minLines * 19.6,
        padding: EdgeInsets.only(right: 16.toScale),
        alignment: (widget.maxLines > 1 && widget.minLines > 1)
            ? Alignment.topRight
            : Alignment.centerRight,
        child: widget.suffix ??
            IconFromImage(
              widget.suffixIcon!,
              color: ColorPallet.primaryBlue,
              size: 22.toScale,
            ),
      );
    }
    return null;
  }
}
