import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';
import 'package:video_player/video_player.dart';

class FixedAppShowCaseSlide extends FlutterDeckSlideWidget {
  const FixedAppShowCaseSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/fix-slide',
            title: 'Fixed App Showcase',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const _FixedAppShowCase(),
      );
}

class _FixedAppShowCase extends StatefulWidget {
  const _FixedAppShowCase();

  @override
  State<_FixedAppShowCase> createState() => _FixedAppShowCaseState();
}

class _FixedAppShowCaseState extends State<_FixedAppShowCase> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    super.initState();
    _controller = VideoPlayerController.asset(Assets.videos.stateRestored)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FlutterDeckSlideStepsListener(
        listener: (context, stepNumber) {
          if (stepNumber == 2) {
            _controller.play();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.appShowcase,
              style: context.textTheme.title,
            ),
            horizontalMargin48,
            horizontalMargin48,
            Column(
              children: [
                const Spacer(),
                Container(
                  width: 340,
                  height: 700,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context
                        .flutterDeckTheme.materialTheme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: !_controller.value.isPlaying
                      ? Center(
                          child: Text(
                            context.l10n.bootingAndroid,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        )
                      : Center(
                          child: VideoPlayer(_controller),
                        ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      );
}
