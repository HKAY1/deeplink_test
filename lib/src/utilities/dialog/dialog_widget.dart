part of 'dialog_service.dart';

class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, ch) {
        final state = ref.watch(dialogServiceProvider);
        if (state is! _ShowDialogState) return const SizedBox.shrink();

        return SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(16.toScale),
            padding: EdgeInsets.symmetric(
              vertical: state.showActions ? 16.toScale : 10.toScale,
              horizontal: 16.toScale,
            ),
            decoration: BoxDecoration(
              color: state.backgroundColor ?? ColorPallet.lightGrey,
              borderRadius: BorderRadius.circular(14.toScale),
              boxShadow: ColorPallet.topDialogShadow,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (state.icon != null) ...<Widget>[
                      CircularButton(
                        icon: state.icon!,
                        mini: true,
                        iconSize: state.iconSize ?? 20.toScale,
                        iconColor: state.iconColor ?? ColorPallet.white,
                        color: state.iconBackGroundColor,
                      ),
                      SizedBox(width: 10.toScale),
                    ],
                    Expanded(
                      child: LazyLoadingText(
                        state.message.capitalize(),
                        style: ThemeService.bodyText1.copyWith(
                          fontSize: 16.toScale,
                          color: state.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.showActions) ...<Widget>[
                  SizedBox(height: Scale.screenHeight * 0.015),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Button(
                          onTap: () {
                            DialogService.instance.hideDialog();
                            if (state.onCancel != null) state.onCancel!();
                          },
                          width: double.maxFinite,
                          radius: 8.toScale,
                          color: ColorPallet.white,
                          showShadow: true,
                          text: Strings.cancel,
                          textStyle: ThemeService.bodyText2.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.toScale),
                      Expanded(
                        child: Button(
                          onTap: () {
                            DialogService.instance.hideDialog();
                            if (state.onConfirmTap != null) {
                              state.onConfirmTap!();
                            }
                          },
                          width: double.maxFinite,
                          radius: 8.toScale,
                          showShadow: true,
                          shadowColor: ColorPallet.blueGrey,
                          color: ColorPallet.blueGrey,
                          text: Strings.confirm,
                          textStyle: ThemeService.bodyText2.copyWith(
                            color: ColorPallet.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
