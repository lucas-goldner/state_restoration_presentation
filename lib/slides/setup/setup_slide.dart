import 'package:flutter/cupertino.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/util/format_code.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class SetupSlide extends FlutterDeckSlideWidget {
  const SetupSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/setup',
            title: 'Setup',
            steps: 4,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) => const FlutterDeckSlideStepsBuilder(
        builder: _PreparationsContent.new,
      ),
    );
  }
}

class _PreparationsContent extends HookWidget {
  const _PreparationsContent(this.context, this.step);
  final BuildContext context;
  final int step;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedFadeAtStep(
            step: 1,
            currentStep: step,
            child: Center(
              child: FlutterDeckCodeHighlight(
                code: formatCode('''
               class MyApp extends StatelessWidget {
                @override
                Widget build(BuildContext context) {
                  return MaterialApp(
                    restorationScopeId: 'rootId', // ここ 
                    home: HomePage(),
                  );
                }
              }'''),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: AnimatedFadeAtStep(
              step: 2,
              currentStep: step,
              child: Center(
                child: Text(
                  'RootRestorationScope',
                  style: context.textTheme.title,
                ),
              ),
            ),
          ),
          AnimatedFadeAtStep(
            step: 3,
            currentStep: step,
            child: Center(
              child: FlutterDeckCodeHighlight(
                code: formatCode('''
               class MyApp extends StatelessWidget {
                @override
                Widget build(BuildContext context) {
                  return RootRestorationScope(
                    restorationScopeId: 'rootId', // ここ 
                    child: MaterialApp(                    
                      home: HomePage(),
                    ),
                  );
                }
              }'''),
              ),
            ),
          ),
          AnimatedFadeAtStep(
            step: 4,
            currentStep: step,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Assets.images.xcodeRestoration.image(
                    width: 600,
                    height: 600,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.32,
                  right: 180,
                  child: Text(
                    'Enter it ここ',
                    style: context.textTheme.bodyLarge.copyWith(
                      color: CupertinoColors.systemRed,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
