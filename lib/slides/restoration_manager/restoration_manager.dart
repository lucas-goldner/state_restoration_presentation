import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/animated_step_at_fade.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:state_restoration_presentation/slides/restoration_manager/widgets/bucket.dart';

class RestorationManagerSlide extends FlutterDeckSlideWidget {
  const RestorationManagerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/restorationManager',
            title: 'Restoration Manager',
            steps: 6,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return const FlutterDeckSlideStepsBuilder(
          builder: _RestorationManagerContent.new,
        );
      },
    );
  }
}

class _RestorationManagerContent extends HookWidget {
  const _RestorationManagerContent(this.context, this.step);
  final BuildContext context;
  final int step;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  context.l10n.restorationManager,
                  style: context.textTheme.title,
                ),
              ),
              Row(
                children: [
                  const Spacer(flex: 2),
                  Bucket(
                    context,
                    step,
                    text: context.l10n.applicationInformation,
                  ),
                  Visibility(
                    visible: step >= 5,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedFadeAtStep(
                      step: step,
                      currentStep: step,
                      child: Row(
                        children: [
                          Text(
                            '{ key: value }',
                            style: context.textTheme.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          horizontalMargin48,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'null',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'bool',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'num',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'String',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Uint8Lists...',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'List',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Map',
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              AnimatedFadeAtStep(
                step: 4,
                currentStep: step,
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        Assets.images.bucket.cup.svg(height: 160),
                        verticalMargin16,
                        Text(
                          context.l10n.childBucket,
                          style: context.textTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Assets.images.bucket.cup.svg(height: 160),
                        verticalMargin16,
                        Text(
                          '${context.l10n.childBucket} 2',
                          style: context.textTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              verticalMargin32,
              verticalMargin32,
              verticalMargin32,
              AnimatedFadeAtStep(
                step: 6,
                currentStep: step,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    Text(
                      context.l10n.androidLimit,
                      style: context.textTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
