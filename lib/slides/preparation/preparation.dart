import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/util/format_code.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:state_restoration_presentation/slides/restoration_manager/widgets/bucket.dart';

class PreparationSlide extends FlutterDeckSlideWidget {
  const PreparationSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/preparation',
            title: 'Preparations',
            steps: 9,
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
          Visibility(
            visible: step <= 6,
            child: Column(
              children: [
                const Spacer(),
                AnimatedFadeAtStep(
                  step: 1,
                  currentStep: step,
                  child: Text(
                    context.l10n.restorationIdRestorationScopeId,
                    style: context.textTheme.title.copyWith(
                      fontSize: 40,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    AnimatedFadeAtStep(
                      step: 2,
                      currentStep: step,
                      child: Column(
                        children: [
                          Text(
                            context.l10n.widgetWithRestorationId,
                            style: context.textTheme.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Bucket(
                            context,
                            step - 3,
                            text: context.l10n.dataIntoSurroundingChildBucket,
                          ),
                        ],
                      ),
                    ),
                    if (5 <= step) const Spacer(),
                    AnimatedFadeAtStep(
                      step: 5,
                      currentStep: step,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                context.l10n.widgetWithRestorationScopeId,
                                style: context.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              verticalMargin48,
                              verticalMargin48,
                              verticalMargin32,
                              Row(
                                children: [
                                  Text(
                                    context.l10n.wordNew,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                  Assets.images.bucket.cup.svg(height: 160),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          AnimatedFadeAtStep(
            step: 6,
            currentStep: step,
            child: Center(
              child: FlutterDeckCodeHighlight(
                code: formatCode('''
               class MyApp extends StatelessWidget {
                @override
                Widget build(BuildContext context) {
                  return MaterialApp(
                    restorationScopeId: 'rootId', // Here 
                    home: HomePage(),
                  );
                }
              }'''),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: AnimatedFadeAtStep(
              step: 7,
              currentStep: step,
              child: Icon(
                Icons.cloud_outlined,
                size: 1000,
                color: context
                    .flutterDeckTheme.materialTheme.colorScheme.onSurface,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: AnimatedFadeAtStep(
              step: 7,
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
            step: 8,
            currentStep: step,
            child: Center(
              child: FlutterDeckCodeHighlight(
                code: formatCode('''
               class MyApp extends StatelessWidget {
                @override
                Widget build(BuildContext context) {
                  return RootRestorationScope(
                    restorationScopeId: 'rootId', // Here 
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
            step: 9,
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
                    'Enter it here',
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
