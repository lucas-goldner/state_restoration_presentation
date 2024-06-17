import 'package:flutter/material.dart';

class OutlinedBorderWidget extends StatelessWidget {
  const OutlinedBorderWidget({
    required this.size,
    required this.borderWidth,
    required this.borderColor,
    this.width,
    this.height,
    super.key,
  });

  final double size;
  final double? width;
  final double? height;
  final double borderWidth;
  final Color borderColor;

  @override
  Widget build(BuildContext context) => Container(
        width: width ?? size,
        height: height ?? size,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: Container(
            width: (width ?? size) - 2 * borderWidth,
            height: (height ?? size) - 2 * borderWidth,
            color: Colors.transparent,
          ),
        ),
      );
}
