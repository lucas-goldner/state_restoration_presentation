import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/core/widgets/outlined_border.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class DevTipsSlide extends FlutterDeckSlideWidget {
  const DevTipsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            steps: 5,
            route: '/dev-tips-slide',
            header: FlutterDeckHeaderConfiguration(
              title: 'Development Tips',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedFadeAtStep(
              step: 1,
              currentStep: step,
              child: Text(
                '- Develop on Android 🤖',
                style: context.textTheme.bodyMedium,
              ),
            ),
            AnimatedFadeAtStep(
              step: 2,
              currentStep: step,
              child: Text(
                '- PLEASE 🙏 turn that setting on ➡',
                style: context.textTheme.bodyMedium,
              ),
            ),
            AnimatedFadeAtStep(
              step: 3,
              currentStep: step,
              child: Text(
                '- Rerun your app when you do changes 🔄',
                style: context.textTheme.bodyMedium,
              ),
            ),
            AnimatedFadeAtStep(
              step: 3,
              currentStep: step,
              child: Text(
                '=> Changes are not persisted on device😔',
                style: context.textTheme.bodyMedium,
              ),
            ),
            AnimatedFadeAtStep(
              step: 4,
              currentStep: step,
              child: Text(
                '- Only test iOS if you must!',
                style: context.textTheme.bodyMedium,
              ),
            ),
            AnimatedFadeAtStep(
              step: 5,
              currentStep: step,
              child: Text(
                '- For tests use: tester.restartAndRestore()',
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      rightBuilder: (context) => Center(
        child: Stack(
          children: [
            Assets.images.androidDevSetting.image(),
            const Positioned(
              top: 180,
              left: 0,
              child: OutlinedBorderWidget(
                size: 100,
                width: 340,
                height: 140,
                borderWidth: 20,
                borderColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
