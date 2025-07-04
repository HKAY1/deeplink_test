import 'package:equatable/equatable.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inshort_test/src/services/services_export.dart'
    show ThemeService;

import '../export.dart';

part 'dialog_state.dart';
part 'dialog_widget.dart';

class DialogService extends StateNotifier<DialogState> {
  DialogService._() : super(_InitialDialogState());
  static final DialogService instance = DialogService._();

  Widget get widget => const _Dialog();

  void showDialog({
    required String message,
    Color? textColor,
    bool autoHide = true,
    VoidCallback? onConfirmTap,
    VoidCallback? onCancel,
    bool showActions = false,
    String? icon,
    double? iconSize,
    Color? backgroundColor,
    Color? iconColor,
    Color? iconBackGroundColor,
    Duration duration = const Duration(seconds: 5),
    bool? isSnackbar = true,
  }) {
    hideDialog();
    ScaffoldMessenger.of(Keys.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: ThemeService.bodyText1.copyWith(
            color: textColor ?? ColorPallet.white,
          ),
        ),
      ),
    );
    state =
        isSnackbar == true
            ? _InitialDialogState()
            : _ShowDialogState(
              message: message,
              textColor: textColor,
              onConfirmTap: onConfirmTap,
              onCancel: onCancel,
              showActions: showActions,
              iconSize: iconSize,
              backgroundColor: backgroundColor,
              icon: icon,
              iconBackGroundColor: iconBackGroundColor,
              iconColor: iconColor,
            );

    Future<void>.delayed(duration, () {
      if (autoHide) hideDialog();
    });
  }

  void hideDialog() {
    ScaffoldMessenger.of(Keys.navigatorKey.currentContext!).clearSnackBars();
    state = _InitialDialogState();
  }
}

final dialogServiceProvider = StateNotifierProvider<DialogService, DialogState>(
  (ref) => DialogService.instance,
);
