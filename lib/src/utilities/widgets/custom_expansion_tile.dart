import '../export.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title;
  final Function(bool)? onExpansionChanged;
  final List<Widget> children;
  final Color? iconColor;
  const CustomExpansionTile(
      {super.key,
      required this.title,
      this.iconColor,
      this.onExpansionChanged,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.toScale),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPallet.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        leading: null,
        tilePadding: EdgeInsets.zero,
        iconColor: iconColor ?? ColorPallet.transparent,
        title: title,
        collapsedIconColor: iconColor ?? ColorPallet.transparent,
        shape: Border.all(
          color: ColorPallet.transparent,
        ),
        children: children,
      ),
    );
  }
}
