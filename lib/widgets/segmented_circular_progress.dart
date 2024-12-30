import 'package:flutter/material.dart';

class SegmentedCircularProgress extends StatelessWidget {
  final double progress; // نسبة التقدم

  const SegmentedCircularProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(35, 35), // حجم الدائرة
      painter: _SegmentedProgressPainter(progress),
    );
  }
}

class _SegmentedProgressPainter extends CustomPainter {
  final double progress;

  _SegmentedProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    // رسم الخلفية (الدائرة الكاملة مقسمة إلى 8 أجزاء)
    for (int i = 0; i < 8; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        (i * 45) * (3.14159 / 180), // بداية القوس
        25 * (3.14159 / 180), // طول القوس (تم تقليله إلى 25 درجة)
        false,
        backgroundPaint,
      );
    }

    // رسم التقدم
    double totalProgress = progress * 360; // التقدم بالدائرة (360 درجة)
    double segmentAngle = 45; // زاوية كل جزء
    double progressPerSegment = totalProgress / segmentAngle; // تقدم لكل جزء

    for (int i = 0; i < 8; i++) {
      if (totalProgress <= i * segmentAngle) break;

      double startAngle = (i * segmentAngle) * (3.14159 / 180);
      double sweepAngle = (totalProgress >= (i + 1) * segmentAngle
              ? 25
              : progressPerSegment * 25) *
          (3.14159 / 180);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
