import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class Bucket extends HookWidget {
  const Bucket(this.context, this.step, {required this.text, super.key});
  final BuildContext context;
  final int step;
  final String text;

  void listenToStepChanges(
    ValueNotifier<bool> showWater,
    AnimationController animationController,
  ) {
    if (step == 2) {
      showWater.value = true;
      animationController.forward();
    } else {
      showWater.value = false;
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    final showWater = useState<bool>(false);
    final animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 4),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInQuad,
      ),
    );

    listenToStepChanges(showWater, animationController);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: showWater.value ? 1 : 0,
              child: Transform.translate(
                offset: const Offset(0, 110),
                child: Animate(
                  effects: [
                    if (showWater.value) ...[
                      const ScaleEffect(
                        end: Offset(1, 2.5),
                        curve: Curves.easeInOutBack,
                        duration: Duration(milliseconds: 500),
                      ),
                    ],
                  ],
                  child: Assets.images.bucket.water.svg(
                    height: 80,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: step == 1 || showWater.value ? 1 : 0,
              child: SlideTransition(
                position: animation,
                child: Animate(
                  effects: [
                    if (showWater.value) ...[
                      const ScaleEffect(
                        end: Offset.zero,
                        curve: Curves.easeInOutBack,
                        duration: Duration(milliseconds: 500),
                      ),
                    ],
                  ],
                  child: Text(
                    text,
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalMargin32,
        Column(
          children: [
            Assets.images.bucket.cup.svg(height: 160),
            verticalMargin16,
            if (text == context.l10n.applicationInformation)
              AnimatedFadeAtStep(
                step: 3,
                currentStep: step,
                child: Text(
                  context.l10n.rootBucket,
                  style: context.textTheme.bodyLarge,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
