import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/slides/title/title.dart';

void main() => runApp(const FlutterDeckExample());

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) => FlutterDeckApp(
        configuration: FlutterDeckConfiguration(
          background: const FlutterDeckBackgroundConfiguration(
            light: FlutterDeckBackground.solid(
              Color(0xFFB5FFFC),
            ),
            dark: FlutterDeckBackground.solid(
              Color(0xFF16222A),
            ),
          ),
          controls: const FlutterDeckControlsConfiguration(
            shortcuts: FlutterDeckShortcutsConfiguration(
              toggleMarker: SingleActivator(
                LogicalKeyboardKey.keyM,
                control: true,
                meta: true,
              ),
              toggleNavigationDrawer: SingleActivator(
                LogicalKeyboardKey.period,
                control: true,
                meta: true,
              ),
            ),
          ),
          footer: const FlutterDeckFooterConfiguration(
            showSlideNumbers: true,
            widget: FlutterLogo(),
          ),
          marker: const FlutterDeckMarkerConfiguration(
            color: Colors.cyan,
            strokeWidth: 8,
          ),
          progressIndicator: const FlutterDeckProgressIndicator.gradient(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink,
                Colors.purple,
              ],
            ),
            backgroundColor: Colors.black,
          ),
          slideSize: FlutterDeckSlideSize.fromAspectRatio(
            aspectRatio: const FlutterDeckAspectRatio.ratio16x10(),
            resolution: const FlutterDeckResolution.fromWidth(1440),
          ),
          transition: const FlutterDeckTransition.fade(),
        ),
        slides: const [
          TitleSlide(),
        ],
      );
}
