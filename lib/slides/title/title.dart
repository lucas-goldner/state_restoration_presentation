import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/style/colors.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/title-slide',
            title: 'Title',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => Stack(
          children: [
            Positioned(
              left: 20,
              top: 20,
              child:
                  Assets.images.youtrustFullLogo.svg(width: 100, height: 100),
            ),
            const Positioned(
              top: 22,
              right: 328,
              child: FlutterLogo(size: 80),
            ),
            Positioned(
              top: 42,
              right: 40,
              child: Assets.images.flutterconLogo.svg(
                width: 40,
                height: 40,
              ),
            ),
            Positioned(
              bottom: -60,
              child: RotatedBox(
                quarterTurns: 3,
                child: Transform.rotate(
                  angle: 0.2,
                  child: Assets.images.flutterconTowerBase.svg(
                    height: 480,
                    width: 480,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              bottom: 0,
              child: Assets.images.flutterconTower.svg(
                height: 420,
                width: 420,
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .moveY(
                  begin: 0,
                  end: 20,
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 12),
                ),
            Positioned(
              left: 160,
              bottom: 100,
              child: Assets.images.flutterconParticleCircle
                  .svg(
                    height: 100,
                    width: 100,
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .rotate(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 12),
                  ),
            ),
            Center(
              child: Text(
                context.l10n.presentationTitle,
                style: context.textTheme.title.copyWith(
                  fontSize: 54,
                ),
              )
                  .animate(
                    autoPlay: true,
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    duration: 3.seconds,
                    colors: [
                      flutterconBlue,
                      flutterconGreen,
                      flutterconBlue,
                    ],
                    stops: [0, 0.8, 1],
                    curve: Curves.easeInQuad,
                  ),
            ),
          ],
        ),
      );
}
