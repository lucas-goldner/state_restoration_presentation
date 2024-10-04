import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:state_restoration_presentation/core/style/colors.dart';
import 'package:state_restoration_presentation/core/style/theme.dart';
import 'package:state_restoration_presentation/slides/app_showcase/app_showcase.dart';
import 'package:state_restoration_presentation/slides/dev_tips/dev_tips.dart';
import 'package:state_restoration_presentation/slides/fix_showcase/fix_showcase.dart';
import 'package:state_restoration_presentation/slides/long_form/long_form.dart';
import 'package:state_restoration_presentation/slides/outro/outro.dart';
import 'package:state_restoration_presentation/slides/restoration_ids/restorationids.dart';
import 'package:state_restoration_presentation/slides/restoration_manager/restoration_manager.dart';
import 'package:state_restoration_presentation/slides/restorationmixin/restorablemixin.dart';
import 'package:state_restoration_presentation/slides/saving_state/saving_state.dart';
import 'package:state_restoration_presentation/slides/speaker/speaker.dart';
import 'package:state_restoration_presentation/slides/states_difference/different_states_slide.dart';
import 'package:state_restoration_presentation/slides/title/title.dart';
import 'package:state_restoration_presentation/slides/what_happened/what_happened.dart';

void main() => runApp(const FlutterDeckExample());

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) => FlutterDeckApp(
        lightTheme: flutterDeckThemeLight,
        darkTheme: flutterDeckThemeDark,
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        configuration: const FlutterDeckConfiguration(
          controls: FlutterDeckControlsConfiguration(
            shortcuts: FlutterDeckShortcutsConfiguration(
              nextSlide: SingleActivator(LogicalKeyboardKey.arrowUp),
              previousSlide: SingleActivator(LogicalKeyboardKey.arrowDown),
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
          marker: FlutterDeckMarkerConfiguration(
            color: flutterkaigiPink,
            strokeWidth: 8,
          ),
          progressIndicator: FlutterDeckProgressIndicator.gradient(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                flutterkaigiPink,
                flutterkaigiPurple,
                flutterkaigiTurquoise,
              ],
            ),
            backgroundColor: Colors.black,
          ),
          transition: FlutterDeckTransition.fade(),
        ),
        slides: const [
          SpeakerSlide(),
          TitleSlide(),
          AppShowCaseSlide(),
          WhatHappenedSlide(),
          LongFormSlide(),
          SavingStateSlide(),
          DifferentStatesSlide(),
          RestorationManagerSlide(),
          RestorationIds(),
          RestorationMixinSlide(),
          DevTipsSlide(),
          FixedAppShowCaseSlide(),
          OutroSlide(),
        ],
      );
}
