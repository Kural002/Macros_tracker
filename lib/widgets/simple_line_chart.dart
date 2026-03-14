import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<double> values; // 7 values, one per day, in range 0..1
  final List<String> xLabels; // e.g., ['Sun', 'Mon', ...]

  const SimpleLineChart({Key? key, required this.values, required this.xLabels})
    : assert(values.length == xLabels.length),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 120),
      painter: _LineChartPainter(values, xLabels),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> xLabels;

  _LineChartPainter(this.values, this.xLabels);

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paintPoint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final paintAxis = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    final textStyle = TextStyle(color: Colors.grey[600], fontSize: 10);

    const leftPadding = 30.0;
    const rightPadding = 10.0;
    const topPadding = 10.0;
    const bottomPadding = 20.0;

    final graphWidth = size.width - leftPadding - rightPadding;
    final graphHeight = size.height - topPadding - bottomPadding;

    // Draw Y-axis labels (0.0, 0.5, 1.0)
    for (int i = 0; i <= 2; i++) {
      double y = topPadding + graphHeight * (1 - i * 0.5);
      canvas.drawLine(
        Offset(leftPadding - 5, y),
        Offset(leftPadding, y),
        paintAxis,
      );

      final textSpan = TextSpan(
        text: '${(i * 0.5).toStringAsFixed(1)}',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(leftPadding - 5 - textPainter.width, y - textPainter.height / 2),
      );
    }

    // Draw X-axis labels (days)
    for (int i = 0; i < xLabels.length; i++) {
      double x = leftPadding + (i / (xLabels.length - 1)) * graphWidth;
      canvas.drawLine(
        Offset(x, size.height - bottomPadding),
        Offset(x, size.height - bottomPadding + 5),
        paintAxis,
      );

      final textSpan = TextSpan(text: xLabels[i], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height - bottomPadding + 8),
      );
    }

    // Draw the line
    final path = Path();
    for (int i = 0; i < values.length; i++) {
      double x = leftPadding + (i / (values.length - 1)) * graphWidth;
      double y = topPadding + graphHeight * (1 - values[i]);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paintLine);

    // Draw points
    for (int i = 0; i < values.length; i++) {
      double x = leftPadding + (i / (values.length - 1)) * graphWidth;
      double y = topPadding + graphHeight * (1 - values[i]);
      canvas.drawCircle(Offset(x, y), 3, paintPoint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
