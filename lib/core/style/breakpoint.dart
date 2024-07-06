import 'package:flutter/material.dart';

enum BreakPoint {
  big(1900),
  mid(1400),
  small(800);

  const BreakPoint(this.screenSize);

  factory BreakPoint.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        final double x when x >= BreakPoint.big.screenSize => BreakPoint.big,
        final double x when x >= BreakPoint.mid.screenSize => BreakPoint.mid,
        final double x when x >= BreakPoint.small.screenSize =>
          BreakPoint.small,
        _ => BreakPoint.big
      };

  final double screenSize;
}
