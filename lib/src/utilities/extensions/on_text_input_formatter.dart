import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class IndianCurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _numberFormat = NumberFormat.decimalPattern('en_IN');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String rawText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    if (rawText == '.') rawText = '0.';
    if ('.'.allMatches(rawText).length > 1) return oldValue;

    if (rawText.contains('.')) {
      final parts = rawText.split('.');
      if (parts.length > 2) return oldValue;
      if (parts[1].length > 2) return oldValue;
      if (parts[0].length > 8) {
        return oldValue; // Prevent more than 8 digits before decimal
      }
    } else {
      if (rawText.length > 8) {
        return oldValue; // Prevent more than 8 digits if no decimal
      }
    }

    // Remove unnecessary leading zeros (but preserve "0." case)
    if (rawText.length > 1 &&
        rawText.startsWith('0') &&
        !rawText.startsWith('0.')) {
      rawText = rawText.replaceFirst(RegExp(r'^0+'), '');
      if (rawText.isEmpty) rawText = '0';
    }

    if (rawText.isEmpty) return newValue.copyWith(text: '');

    double? numericValue = double.tryParse(rawText);
    if (numericValue == null) return oldValue;

    String formattedText;

    if (rawText.contains('.')) {
      final parts = rawText.split('.');
      final intPart = parts[0].isEmpty ? '0' : parts[0];
      final formattedInt = _numberFormat.format(int.parse(intPart));
      formattedText = '$formattedInt.${parts[1]}';
    } else {
      formattedText = _numberFormat.format(int.parse(rawText));
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
