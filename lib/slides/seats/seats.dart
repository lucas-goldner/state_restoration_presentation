import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/core/widgets/paddings.dart';

const _seatsCountPerRow = 12;
const _totalSeatsCount = _seatsCountPerRow * 10;
const _animationSpeed = 50;
const _seatToSelect = 127;

class SeatsSlide extends FlutterDeckSlideWidget {
  const SeatsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/seats-slide',
            title: 'Seats Selector',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const FlutterDeckSlideStepsBuilder(
          builder: _Seats.new,
        ),
      );
}

class _Seats extends HookWidget {
  const _Seats(this.context, this.stepNumber);
  final BuildContext context;
  final int stepNumber;

  void listenForStepChanges(
    int step,
    ValueNotifier<List<Color>> colors,
    ValueNotifier<bool> hasPlayed,
  ) {
    if (step == 2 && !hasPlayed.value) {
      hasPlayed.value = true;
      triggerSeatSelection(colors);
    }
  }

  void triggerSeatSelection(ValueNotifier<List<Color>> colors) {
    for (final (index, _) in colors.value.indexed.take(_seatToSelect)) {
      Future.delayed(Duration(milliseconds: _animationSpeed + (index * 100)),
          () {
        final newColors = [...colors.value]
          ..replaceRange(index, index + 1, [Colors.red]);
        colors.value = newColors;

        if (_seatToSelect - 1 != index) {
          Future.delayed(const Duration(milliseconds: _animationSpeed), () {
            final revertedColors = [...colors.value]..replaceRange(
                index,
                index + 1,
                [context.flutterDeckTheme.materialTheme.colorScheme.onSurface],
              );
            colors.value = revertedColors;
          }).ignore();
        }
      }).ignore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final initialColorList = List<Color>.generate(
      _totalSeatsCount * 2,
      (_) => context.flutterDeckTheme.materialTheme.colorScheme.onSurface,
    );
    final colors = useState(initialColorList);
    final hasPlayedAnimation = useState(false);

    listenForStepChanges(stepNumber, colors, hasPlayedAnimation);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          verticalMargin12,
          Text(
            context.l10n.oneOfYouIsGoing,
            style: context.textTheme.title,
          ),
          verticalMargin48,
          Flexible(
            child: Padding(
              padding: horizontalPadding16,
              child: Row(
                children: [
                  Flexible(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _seatsCountPerRow,
                      ),
                      itemCount: _totalSeatsCount,
                      itemBuilder: (context, index) => _SeatIcon(
                        colors.value[index],
                      ),
                    ),
                  ),
                  horizontalMargin48,
                  Flexible(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _seatsCountPerRow,
                      ),
                      itemCount: _totalSeatsCount,
                      itemBuilder: (context, index) => _SeatIcon(
                        colors.value[index + _totalSeatsCount],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeatIcon extends StatelessWidget {
  const _SeatIcon(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 4,
            height: 8,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            width: 4,
            height: 8,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      );
}
