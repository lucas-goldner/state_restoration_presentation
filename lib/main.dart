import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/slides/title/title.dart';
import 'package:state_restoration_presentation/styles.dart';

void main() => runApp(const FlutterDeckExample());

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) => FlutterDeckApp(
        themeMode: ThemeMode.light,
        configuration: FlutterDeckConfiguration(
          background: const FlutterDeckBackgroundConfiguration(
            light: FlutterDeckBackground.gradient(
              backgroundPrimary,
            ),
            dark: FlutterDeckBackground.gradient(
              backgroundDark,
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
            color: Color(0xFF3FE4C5),
            strokeWidth: 8,
          ),
          progressIndicator: const FlutterDeckProgressIndicator.gradient(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0F1BCE),
                Color(0xFF3FE4C5),
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
