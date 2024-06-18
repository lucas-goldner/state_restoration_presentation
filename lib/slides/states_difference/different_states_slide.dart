// ignore_for_file: missing_whitespace_between_adjacent_strings, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:graphite/graphite.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/animated_step_at_fade.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/core/widgets/paddings.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class DifferentStatesSlide extends FlutterDeckSlideWidget {
  const DifferentStatesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/different-states',
            title: 'Different States',
            steps: 4,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const FlutterDeckSlideStepsBuilder(
          builder: _DifferentStatesContent.new,
        ),
      );
}

const list = '['
    '{"id":"Data","next":[{"outcome":"Who needs it?"}]},'
    '{"id":"Who needs it?","next":[{"outcome":"Single Widget"},{"outcome":"Some widgets"},{"outcome":"Most Widgets"}]},'
    '{"id":"Single Widget","next":[{"outcome":"Ephermal State"}]},'
    '{"id":"Some widgets","next":[{"outcome":"App State"}]},{"id":"Most Widgets","next":[{"outcome":"App State"}]},'
    '{"id":"App State","next":[]},'
    '{"id":"Ephermal State","next":[]}'
    ']';

class _DifferentStatesContent extends StatelessWidget {
  const _DifferentStatesContent(this.context, this.step);
  final BuildContext context;
  final int step;

  @override
  Widget build(BuildContext context) => switch (step) {
        1 => Padding(
            padding: allPadding48 + allPadding48,
            child: Assets.images.confusion.image(),
          ),
        2 || 3 || 4 => Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeAtStep(
                  step: 3,
                  currentStep: step,
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        context.l10n.instanceStateTitle,
                        style: context.textTheme.title.copyWith(
                          fontSize: 44,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.l10n.scrollViewPosition,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.l10n.navigationStack,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.l10n.selectedTab,
                        style: context.textTheme.bodyLarge,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                horizontalMargin32,
                horizontalMargin32,
                DirectGraph(
                  list: nodeInputFromJson(list),
                  defaultCellSize: const Size(140, 50),
                  cellPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  orientation: MatrixOrientation.Vertical,
                ),
                horizontalMargin32,
                horizontalMargin32,
                AnimatedFadeAtStep(
                  step: 4,
                  currentStep: step,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        context.l10n.appStateTitle,
                        style: context.textTheme.title.copyWith(
                          fontSize: 44,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.l10n.amountOfMoney,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.l10n.flashcards,
                        style: context.textTheme.bodyLarge,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        _ => Text(context.l10n.differentStates),
      };
}
