// ignore_for_file: missing_whitespace_between_adjacent_strings, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:graphite/graphite.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/style/breakpoint.dart';
import 'package:state_restoration_presentation/core/widgets/animated_step_at_fade.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';

class DifferentStatesSlide extends FlutterDeckSlideWidget {
  const DifferentStatesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/different-states',
            title: 'Different States',
            steps: 3,
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
    '{"id":"データ","next":[{"outcome":"誰に大事?"}]},'
    '{"id":"誰に大事?","next":[{"outcome":"一つのWidget"},{"outcome":"いくつかのwidget"},{"outcome":"ほとんどのWidget"}]},'
    '{"id":"一つのWidget","next":[{"outcome":"Instance state 儚い状態"}]},'
    '{"id":"いくつかのwidget","next":[{"outcome":"App State アプリ状態"}]},{"id":"ほとんどのWidget","next":[{"outcome":"App State アプリ状態"}]},'
    '{"id":"App State アプリ状態","next":[]},'
    '{"id":"Instance state 儚い状態","next":[]}'
    ']';

// Restoration\nManager in Katakana
// リストアリングマネージャー

class _DifferentStatesContent extends StatelessWidget {
  const _DifferentStatesContent(this.context, this.step);
  final BuildContext context;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeAtStep(
            step: 2,
            currentStep: step,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  context.l10n.instanceStateTitle,
                  style: context.textTheme.title.copyWith(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.scrollViewPosition,
                  style: context.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.navigationStack,
                  style: context.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.selectedTab,
                  style: context.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          horizontalMargin32,
          horizontalMargin32,
          DirectGraph(
            list: nodeInputFromJson(list),
            nodeBuilder: (context, node) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  node.id,
                  style: BreakPoint.of(context) == BreakPoint.big
                      ? context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                      : context.textTheme.bodySmall,
                ),
              ),
            ),
            defaultCellSize: BreakPoint.of(context) == BreakPoint.big
                ? const Size(300, 120)
                : const Size(180, 160),
            cellPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            orientation: MatrixOrientation.Vertical,
          ),
          horizontalMargin32,
          horizontalMargin32,
          AnimatedFadeAtStep(
            step: 3,
            currentStep: step,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  context.l10n.appStateTitle,
                  style: context.textTheme.title.copyWith(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.amountOfMoney,
                  style: context.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
