import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/title-slide',
            title: 'Title slide',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => Stack(
          children: [
            Positioned(
              left: 20,
              child: Assets.images.youtrust.image(width: 120, height: 120),
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
          ],
        ),
      );
}
