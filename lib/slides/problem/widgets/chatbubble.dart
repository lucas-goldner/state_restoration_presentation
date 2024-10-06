import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.child, super.key, this.tailPosition = 20.0});
  final Widget child;
  final double tailPosition;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _ChatBubblePainter(tailPosition: tailPosition),
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: child,
        ),
      );
}

class _ChatBubblePainter extends CustomPainter {
  _ChatBubblePainter({required this.tailPosition});
  final double tailPosition;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final bubblePath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 10, 0)
      ..arcToPoint(Offset(size.width, 10), radius: const Radius.circular(10))
      ..lineTo(size.width, size.height - 10)
      ..arcToPoint(
        Offset(size.width - 10, size.height),
        radius: const Radius.circular(10),
      )
      ..lineTo(10, size.height)
      ..arcToPoint(
        Offset(0, size.height - 10),
        radius: const Radius.circular(10),
      )
      ..lineTo(0, tailPosition + 10)
      ..lineTo(-10, tailPosition)
      ..lineTo(0, tailPosition - 10)
      ..close();

    canvas.drawPath(bubblePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
