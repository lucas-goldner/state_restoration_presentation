import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:state_restoration_presentation/slides/speaker/widgets/folder_file.dart';

class SpeakerSlide extends FlutterDeckSlideWidget {
  const SpeakerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/speaker',
            title: 'Speaker Info',
            steps: 5,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const FlutterDeckSlideStepsBuilder(
          builder: _SlideFolderContent.new,
        ),
      );
}

class _SlideFolderContent extends HookWidget {
  const _SlideFolderContent(
    this.context,
    this.steps,
  );

  final BuildContext context;
  final int steps;

  void listenToAnimationIndexChanges(
    ValueNotifier<SimpleAnimation> openAnimationController,
    int steps,
  ) {
    if (steps >= 1) {
      activateAnimation(openAnimationController);
    }
  }

  void activateAnimation(ValueNotifier<SimpleAnimation> animationController) {
    animationController.value.isActive = true;
  }

  @override
  Widget build(BuildContext context) {
    final openAnimationController = useState(
      SimpleAnimation('Open', autoplay: false),
    );
    listenToAnimationIndexChanges(openAnimationController, steps);

    return Stack(
      children: [
        Column(
          children: [
            verticalMargin32,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 112,
                  backgroundImage: Assets.images.lucas.provider(),
                ),
                horizontalMargin32,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalMargin16,
                    Text(
                      context.l10n.hiIam,
                      style: context.textTheme.bodyMedium.copyWith(
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      context.l10n.lucasGoldner,
                      style: context.textTheme.title.copyWith(
                        fontSize: 80,
                      ),
                    ),
                    Text(
                      'X: @LucasGoldner',
                      style: context.textTheme.bodyMedium.copyWith(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            FadeAnimation(
              delay: 1,
              child: Center(
                child: SizedBox.square(
                  dimension: 600,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: RiveAnimation.asset(
                      'assets/rive/folder.riv',
                      artboard: 'fold_er.svg',
                      controllers: [
                        openAnimationController.value,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Visibility(
                visible: steps >= 3,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                        offset: Offset.zero,
                        child: Animate(
                          effects: [
                            if (steps >= 2) ...[
                              const ScaleEffect(
                                begin: Offset(0, 0.01),
                                end: Offset(1, 1),
                                curve: Curves.easeInOutBack,
                                duration: Duration(milliseconds: 500),
                              ),
                            ],
                          ],
                          child: FolderFile(
                            text: context.l10n.fileOne,
                            animationIndex: 6,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: steps >= 4,
                        child: Transform.translate(
                          offset: Offset.zero,
                          child: Animate(
                            effects: [
                              if (steps >= 3) ...[
                                const ScaleEffect(
                                  begin: Offset(0, 0.01),
                                  end: Offset(1, 1),
                                  curve: Curves.easeInOutBack,
                                  duration: Duration(milliseconds: 500),
                                ),
                                const MoveEffect(
                                  begin: Offset(-100, -20),
                                  end: Offset(1, 1),
                                  curve: Curves.easeInOutBack,
                                  duration: Duration(milliseconds: 1250),
                                ),
                              ],
                            ],
                            child: FolderFile(
                              text: '',
                              animationIndex: 5,
                              textReplacement: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    context.l10n.fileTwo,
                                    textAlign: TextAlign.center,
                                    style:
                                        context.textTheme.bodyMedium.copyWith(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: steps >= 5,
                        child: Transform.translate(
                          offset: Offset.zero,
                          child: Animate(
                            effects: [
                              if (steps >= 4) ...[
                                const ScaleEffect(
                                  begin: Offset(0, 0.01),
                                  end: Offset(1, 1),
                                  curve: Curves.easeInOutBack,
                                  duration: Duration(milliseconds: 500),
                                ),
                                const MoveEffect(
                                  begin: Offset(-100, -20),
                                  end: Offset(1, 1),
                                  curve: Curves.easeInOutBack,
                                  duration: Duration(milliseconds: 1250),
                                ),
                              ],
                            ],
                            child: FolderFile(
                              text: context.l10n.fileThree,
                              animationIndex: 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
