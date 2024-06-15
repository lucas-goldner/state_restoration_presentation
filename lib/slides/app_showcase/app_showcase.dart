import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/slides/app_showcase/widgets/screen_dialog.dart';

class AppShowCaseSlide extends FlutterDeckSlideWidget {
  const AppShowCaseSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/_AppShowCase-slide',
            title: 'App Showcase',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  static String tag = 'get_display_media_sample';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const _AppShowCase(),
      );
}

class _AppShowCase extends StatefulWidget {
  const _AppShowCase();

  @override
  State<_AppShowCase> createState() => _AppShowCaseState();
}

class _AppShowCaseState extends State<_AppShowCase> {
  MediaStream? _localStream;
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  DesktopCapturerSource? selectedSource;

  @override
  void initState() {
    super.initState();
    initRenderers();
  }

  @override
  void deactivate() {
    super.deactivate();
    _localRenderer.dispose();
  }

  Future<void> initRenderers() async {
    await _localRenderer.initialize();
  }

  Future<void> selectScreenSourceDialog(BuildContext context) async {
    if (WebRTC.platformIsDesktop) {
      final source = await showDialog<DesktopCapturerSource>(
        context: context,
        builder: (context) => ScreenSelectDialog(),
      );

      setState(() {
        selectedSource = source;
      });

      try {
        final stream =
            await navigator.mediaDevices.getDisplayMedia(<String, dynamic>{
          'video': selectedSource == null
              ? true
              : {
                  'deviceId': {'exact': selectedSource!.id},
                  'mandatory': {'frameRate': 60.0},
                },
        });
        stream.getVideoTracks()[0].onEnded = () {};

        _localStream = stream;
        _localRenderer.srcObject = _localStream;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      if (!mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Japanana App\n Showcase',
            style: context.textTheme.title,
          ),
          horizontalMargin48,
          Column(
            children: [
              const Spacer(),
              Container(
                width: 350,
                height: 700,
                decoration: BoxDecoration(
                  color: context
                      .flutterDeckTheme.materialTheme.colorScheme.onSurface,
                ),
                child: RTCVideoView(_localRenderer),
              ),
              CupertinoButton(
                onPressed: () {
                  selectScreenSourceDialog(context);
                },
                child: const Text('Open App Showcase'),
              ),
              const Spacer(),
            ],
          ),
        ],
      );
}
