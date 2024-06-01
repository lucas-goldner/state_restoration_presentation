import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Japanana extends FlutterDeckSlideWidget {
  const Japanana()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/big-fact',
            header: FlutterDeckHeaderConfiguration(
              title: 'Big fact slide template',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: '100%',
      subtitle: 'The test coverage value that flutter_deck will probably never',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
