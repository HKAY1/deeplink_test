import '../export.dart';

class LineLoader extends StatefulWidget {
  const LineLoader({
    super.key,
    this.lineColor = ColorPallet.skyBlue,
    this.strokeWidth = 3.5,
    this.height = 20,
  });

  final Color? lineColor;
  final double strokeWidth;
  final double height;

  @override
  State<StatefulWidget> createState() => _LineLoaderState();
}

class _LineLoaderState extends State<LineLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final double _lowerBound = 0.0;
  final double _upperBound = 0.9;
  bool showTransLine = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      upperBound: _upperBound,
      lowerBound: _lowerBound,
    )
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          showTransLine = true;
          controller.forward(from: _lowerBound);
        }
      })
      ..forward(from: _lowerBound);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: widget.height,
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, _) {
            return CustomPaint(
              painter: LinePainter(
                transLineProgress: showTransLine
                    ? _lowerBound
                    : _upperBound - controller.value,
                progress: _upperBound - controller.value,
                lineColor: widget.lineColor,
                strokeWidth: widget.strokeWidth,
              ),
            );
          },
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  late Paint _paint;
  final double? progress;
  final Color? lineColor;
  final double? strokeWidth;
  late Paint _paintTrans;
  final double? transLineProgress;

  LinePainter({
    this.progress,
    this.lineColor,
    this.strokeWidth,
    this.transLineProgress,
  }) {
    _paint = Paint()
      ..color = lineColor!
          .withValues(alpha: progress! * 3 < 0.9 ? 1 * progress! * 3 : 1)
      ..strokeWidth = strokeWidth!;

    _paintTrans = Paint()
      ..color = lineColor!.withValues(alpha: 0.2)
      ..strokeWidth = strokeWidth!;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // LHS of line
    canvas.drawLine(Offset(size.width / 2, size.height / 2),
        Offset(0 + size.width * (progress! / 2), size.height / 2), _paint);
    // RHS of line
    canvas.drawLine(
        Offset(size.width / 2, size.height / 2),
        Offset(size.width - size.width * (progress! / 2), size.height / 2),
        _paint);

    // Trans line
    canvas.drawLine(
        Offset(size.width / 2, size.height / 2),
        Offset(0 + size.width * (transLineProgress! / 2), size.height / 2),
        _paintTrans);
    canvas.drawLine(
        Offset(size.width / 2, size.height / 2),
        Offset(size.width - size.width * (transLineProgress! / 2),
            size.height / 2),
        _paintTrans);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
