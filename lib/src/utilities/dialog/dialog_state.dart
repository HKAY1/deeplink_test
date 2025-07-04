part of 'dialog_service.dart';

abstract class DialogState extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}

class _InitialDialogState extends DialogState {}

class _ShowDialogState extends DialogState {
  final String message;
  final Color? textColor;
  final VoidCallback? onConfirmTap;
  final VoidCallback? onCancel;
  final bool showActions;
  final String? icon;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? iconBackGroundColor;

  _ShowDialogState({
    required this.message,
    this.textColor,
    this.onConfirmTap,
    this.onCancel,
    this.icon,
    this.iconSize,
    this.backgroundColor,
    this.iconBackGroundColor,
    this.iconColor,
    this.showActions = false,
  });

  @override
  List<Object?> get props {
    return <Object?>[
      message,
      textColor,
      onConfirmTap,
      onCancel,
      showActions,
      icon,
      iconSize,
      backgroundColor,
      iconColor,
      iconBackGroundColor,
    ];
  }
}
