import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shader_snap/flutter_shader_snap.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:state_restoration_presentation/slides/saving_state/model/possible_options.dart';

class SavingStateSlide extends FlutterDeckSlideWidget {
  const SavingStateSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/saving-state',
            title: 'Saving State!',
            steps: 9,
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
              steps == 1 ? 'Our App State 😃' : 'Our App State 😨',
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
                    AnimatedFadeAtStep(
                      step: 4,
                      currentStep: steps,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PossibleOptions.database.asset.image(
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            PossibleOptions.database.getLocalizedName(context),
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
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
                        AnimatedFadeAtStep(
                          step: 5,
                          currentStep: steps,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PossibleOptions.package.asset.image(
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                PossibleOptions.package
                                    .getLocalizedName(context),
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AnimatedFadeAtStep(
                      step: 7,
                      currentStep: steps,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PossibleOptions.file.asset.image(
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            PossibleOptions.file.getLocalizedName(context),
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    AnimatedFadeAtStep(
                      step: 8,
                      currentStep: steps,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PossibleOptions.restorationManager.asset.image(
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            PossibleOptions.restorationManager
                                .getLocalizedName(context),
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
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
