import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shader_snap/flutter_shader_snap.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:state_restoration_presentation/slides/saving_state/model/possible_options.dart';
import 'package:state_restoration_presentation/slides/saving_state/widgets/saving_option.dart';

class SavingStateSlide extends FlutterDeckSlideWidget {
  const SavingStateSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/saving-state',
            title: 'Saving State!',
            steps: 10,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const FlutterDeckSlideStepsBuilder(
          builder: _SavingStateContent.new,
        ),
      );
}

class _SavingStateContent extends HookWidget {
  const _SavingStateContent(this.context, this.steps, {super.key});
  final BuildContext context;
  final int steps;

  void stepListener(AnimationController controller) {
    if (steps == 2) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 5),
    );

    stepListener(controller);

    return switch (steps) {
      1 || 2 => SnapShader(
          controller: controller,
          child: Center(
            child: Text(
              'Our App State',
              style: context.flutterDeckTheme.textTheme.title.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
      3 || 4 || 5 || 6 || 7 || 8 || 9 => FadeAnimation(
          delay: 1,
          child: Padding(
            padding: horizontalPadding48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'How to save it 🥺?',
                    style: context.flutterDeckTheme.textTheme.title,
                  ),
                ),
                verticalMargin32,
                verticalMargin32,
                verticalMargin32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SavingOption(
                      step: 4,
                      currentStep: steps,
                      option: PossibleOptions.database,
                    ),
                    Column(
                      children: [
                        Visibility(
                          visible: 6 == steps,
                          child: FadeAnimation(
                            delay: 1,
                            child: Column(
                              children: [
                                Assets.images.hiddenDatabase.image(
                                  width: 100,
                                  height: 100,
                                ),
                                verticalMargin16,
                              ],
                            ),
                          ),
                        ),
                        SavingOption(
                          step: 5,
                          currentStep: steps,
                          option: PossibleOptions.package,
                        ),
                      ],
                    ),
                    SavingOption(
                      step: 7,
                      currentStep: steps,
                      option: PossibleOptions.file,
                    ),
                    SavingOption(
                      step: 8,
                      currentStep: steps,
                      option: PossibleOptions.restorationManager,
                    ),
                  ],
                ),
                const Spacer(),
                Visibility(
                  visible: 9 <= steps,
                  child: Row(
                    children: [
                      Text(
                        'Long lived states\nApp State',
                        style: context.flutterDeckTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        'VS',
                        style: context.flutterDeckTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        'Instance States\nEmphermal',
                        style: context.flutterDeckTheme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      _ => const SizedBox(),
    };
  }
}
