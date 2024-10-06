import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/util/format_code.dart';
import 'package:state_restoration_presentation/core/widgets.dart';

class RestorationMixinSlide extends FlutterDeckSlideWidget {
  const RestorationMixinSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/restorationMixin',
            header: FlutterDeckHeaderConfiguration(
              title: 'RestorationMixin使い方',
            ),
            steps: 6,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    const codeSnippet = r'''
class _RestorableCounterState extends State<RestorableCounter>
    with RestorationMixin {
  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => "restorableCounter";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'count');
  }

  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restorable Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              $'{_counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}''';

    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) => SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlutterDeckCodeHighlight(
                code: formatCode(codeSnippet),
              ),
              horizontalMargin12,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalMargin32,
                    AnimatedFadeAtStep(
                      step: 2,
                      currentStep: step,
                      child: Text(
                        context.l10n.addRestorationMixin,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalMargin16,
                    AnimatedFadeAtStep(
                      step: 3,
                      currentStep: step,
                      child: Text(
                        context.l10n.overrideRestorationId,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalMargin16,
                    AnimatedFadeAtStep(
                      step: 4,
                      currentStep: step,
                      child: Text(
                        context.l10n.registerRestoration,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalMargin48,
                    verticalMargin32,
                    AnimatedFadeAtStep(
                      step: 5,
                      currentStep: step,
                      child: Text(
                        context.l10n.callsCounterValueProperty,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalMargin48,
                    verticalMargin32,
                    AnimatedFadeAtStep(
                      step: 6,
                      currentStep: step,
                      child: Text(
                        context.l10n.disposeReminder,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
