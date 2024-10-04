import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class SpeakerSlide extends FlutterDeckSlideWidget {
  const SpeakerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/speaker',
            title: 'Speaker Info',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => Center(
          child: Assets.images.charactercardTemplate.image(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
        ),
      );
}
