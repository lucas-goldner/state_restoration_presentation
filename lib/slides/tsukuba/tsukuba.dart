import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:state_restoration_presentation/slides/tsukuba/widgets/chatbubble.dart';

class TsukubaSlide extends FlutterDeckSlideWidget {
  const TsukubaSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/bother',
            title: 'Why it bothered me',
            steps: 5,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const FlutterDeckSlideStepsBuilder(
          builder: TsukubaContent.new,
        ),
      );
}

class TsukubaContent extends StatefulHookWidget {
  const TsukubaContent(this.context, this.step, {super.key});
  final BuildContext context;
  final int step;

  @override
  State<TsukubaContent> createState() => _TsukubaContentState();
}

class _TsukubaContentState extends State<TsukubaContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.tsukuba.image(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          top: 40,
          left: 40,
          child: Text(
            context.l10n.bothering,
            style: context.textTheme.title.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Positioned.fill(
          bottom: -20,
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Visibility(
                    visible: widget.step == 2 || widget.step == 3,
                    child: Assets.images.whyItBothered.phoneEnjoyer
                        .image(
                          width: 250,
                          height: 250,
                        )
                        .animate()
                        .moveX(
                          begin: -200,
                          end: 300,
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 2),
                        ),
                  ),
                  Visibility(
                    visible: widget.step == 4,
                    child: AnimatedFadeAtStep(
                      step: 4,
                      currentStep: widget.step,
                      child: Assets.images.whyItBothered.walkingWithPhone
                          .image(
                            width: 250,
                            height: 250,
                          )
                          .animate()
                          .moveX(
                            begin: 300,
                            end: 900,
                            curve: Curves.easeInOut,
                            duration: const Duration(seconds: 2),
                          ),
                    ),
                  ),
                  Visibility(
                    visible: widget.step == 5,
                    child: AnimatedFadeAtStep(
                      step: 5,
                      currentStep: widget.step,
                      child: Assets.images.whyItBothered.disappointed
                          .image(
                            width: 250,
                            height: 250,
                          )
                          .animate()
                          .moveX(
                            begin: 900,
                            end: 900,
                          )
                          .shake(
                            hz: 20,
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 500,
          bottom: 50,
          child: Visibility(
            visible: widget.step == 3,
            child: AnimatedFadeAtStep(
              step: 3,
              currentStep: 3,
              child: ChatBubble(
                tailPosition: 280,
                child: Assets.images.whyItBothered.smartphone.image(
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
