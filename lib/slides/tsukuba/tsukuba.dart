import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class TsukubaSlide extends FlutterDeckSlideWidget {
  const TsukubaSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/bother',
            title: 'Why it bothered me',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const TsukubaContent(),
      );
}

class TsukubaContent extends StatefulWidget {
  const TsukubaContent({super.key});

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
            'Why it bothered me...',
            style: context.textTheme.title.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
