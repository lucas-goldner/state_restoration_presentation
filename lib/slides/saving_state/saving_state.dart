import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shader_snap/flutter_shader_snap.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/slides/saving_state/model/possible_options.dart';

class SavingStateSlide extends FlutterDeckSlideWidget {
  const SavingStateSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/saving-state',
            title: 'Saving State!',
            steps: 7,
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
              steps == 1
                  ? context.l10n.appStateHappy
                  : context.l10n.appStateSad,
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
                    context.l10n.howToSaveIt,
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
                    AnimatedFadeAtStep(
                      step: 5,
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
                      step: 6,
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
                  visible: 7 <= steps,
                  child: Row(
                    children: [
                      Text(
                        context.l10n.longLivedStates,
                        style: context.flutterDeckTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.vsText,
                        style: context.flutterDeckTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.instanceStates,
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
