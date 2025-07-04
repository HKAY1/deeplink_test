import '../export.dart';

bool isKeyboardVisible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom != 0;
}

void hideKeyboard() {
  final BuildContext? context = Keys.navigatorKey.currentContext;
  if (context == null) return;
  if (!isKeyboardVisible(context)) return;
  FocusScope.of(context).unfocus();
}
