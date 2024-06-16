import 'package:flutter/material.dart';
import 'package:state_restoration_presentation/core/widgets/fade_animation.dart';

class AppearAtStepWithFade extends StatelessWidget {
  const AppearAtStepWithFade({
    required this.step,
    required this.currentStep,
    required this.child,
    super.key,
  });

  final int step;
  final int currentStep;
  final Widget child;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: currentStep >= step,
        child: FadeAnimation(
          delay: 1,
          child: child,
        ),
      );
}
