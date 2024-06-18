import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class WhatHappenedSlide extends FlutterDeckSlideWidget {
  const WhatHappenedSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/what-happened',
            title: 'What Happened?',
            steps: 4,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const FlutterDeckSlideStepsBuilder(
          builder: _WhatHappenedContent.new,
        ),
      );
}

class _WhatHappenedContent extends HookWidget {
  const _WhatHappenedContent(
    this.context,
    this.steps,
  );

  final BuildContext context;
  final int steps;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Spacer(),
          Builder(
            builder: (context) => switch (steps) {
              1 => FadeAnimation(
                  delay: 1,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 500,
                        child: Assets.images.whatHappenedImages.first
                            .image(width: 500, height: 700),
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.whatHappened,
                        style: context.textTheme.title,
                      ),
                      horizontalMargin48,
                    ],
                  ),
                ),
              2 => FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Assets.images.whatHappenedImages.second
                            .image(width: 500, height: 700),
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.backgrounded,
                        style: context.textTheme.title,
                      ),
                      horizontalMargin48,
                    ],
                  ),
                ),
              3 => FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Assets.images.whatHappenedImages.third
                            .image(width: 500, height: 700),
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.memoryCleared,
                        style: context.textTheme.title,
                      ),
                      horizontalMargin48,
                    ],
                  ),
                ),
              4 => FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Assets.images.whatHappenedImages.fourth
                            .image(width: 500, height: 700),
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.stateVanished,
                        style: context.textTheme.title,
                      ),
                      horizontalMargin48,
                    ],
                  ),
                ),
              _ => const SizedBox(),
            },
          ),
          const Spacer(),
        ],
      );
}
