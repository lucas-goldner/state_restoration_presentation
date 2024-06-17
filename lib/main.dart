import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:state_restoration_presentation/core/style/colors.dart';
import 'package:state_restoration_presentation/core/style/theme.dart';
import 'package:state_restoration_presentation/slides/app_showcase/app_showcase.dart';
import 'package:state_restoration_presentation/slides/dev_tips/dev_tips.dart';
import 'package:state_restoration_presentation/slides/fixing_my_japanana/fixing_japanana.dart';
import 'package:state_restoration_presentation/slides/long_form/long_form.dart';
import 'package:state_restoration_presentation/slides/preparation/preparation.dart';
import 'package:state_restoration_presentation/slides/restoration_ids/restorationids.dart';
import 'package:state_restoration_presentation/slides/restoration_manager/restoration_manager.dart';
import 'package:state_restoration_presentation/slides/saving_state/saving_state.dart';
import 'package:state_restoration_presentation/slides/seats/seats.dart';
import 'package:state_restoration_presentation/slides/speaker/speaker.dart';
import 'package:state_restoration_presentation/slides/states_difference/different_states_slide.dart';
import 'package:state_restoration_presentation/slides/title/title.dart';
import 'package:state_restoration_presentation/slides/tsukuba/tsukuba.dart';
import 'package:state_restoration_presentation/slides/restorationmixin/restorablemixin.dart';
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
        configuration: FlutterDeckConfiguration(
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
          marker: const FlutterDeckMarkerConfiguration(
            color: Color(0xFF3FE4C5),
            strokeWidth: 8,
          ),
          progressIndicator: const FlutterDeckProgressIndicator.gradient(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                flutterconBlue,
                flutterconGreen,
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
          SpeakerSlide(),
          TitleSlide(),
          SeatsSlide(),
          AppShowCaseSlide(),
          WhatHappenedSlide(),
          TsukubaSlide(),
          LongFormSlide(),
          SavingStateSlide(),
          DifferentStatesSlide(),
          RestorationManagerSlide(),
          PreparationSlide(),
          RestorationIds(),
          RestorationMixinSlide(),
          FixingJapananaSlide(),
          DevTipsSlide(),
        ],
      );
}
