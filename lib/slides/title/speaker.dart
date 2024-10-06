import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/speaker',
            title: 'Speaker Info',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => Center(
          child: Stack(
            children: [
              Assets.images.charactercardTemplate.image(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 40,
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Assets.images.youtrustFullLogo.svg(
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
