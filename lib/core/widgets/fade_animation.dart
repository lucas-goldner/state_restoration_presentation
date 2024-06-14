import 'dart:async';
import 'package:flutter/material.dart';

/// A widget that performs a fade animation on its child widget.
class FadeAnimation extends StatefulWidget {
  /// Constructs a FadeAnimation widget.
  ///
  /// [child] is the widget to be animated.
  ///
  /// [delay] is the delay (in milliseconds) before starting the animation.
  const FadeAnimation({
    required this.child,
    required this.delay,
    super.key,
  });

  /// The widget to be animated.
  final Widget child;

  /// The delay (in milliseconds) before starting the animation.
  final int delay;

  @override
  FadeAnimState createState() => FadeAnimState();
}

/// The state class for the FadeAnimation widget.
class FadeAnimState extends State<FadeAnimation> with TickerProviderStateMixin {
  late AnimationController _animController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    final animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animController = animationController;
    _timer = Timer(Duration(milliseconds: widget.delay), _animate);
  }

  /// Starts the animation.
  void _animate() {
    _animController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _animController,
        child: widget.child,
      );
}
