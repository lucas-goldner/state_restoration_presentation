import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';

class AppShowCaseSlide extends FlutterDeckSlideWidget {
  const AppShowCaseSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/appshowcase-slide',
            title: 'App Showcase',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
            steps: 2,
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
  final SourceType _sourceType = SourceType.Window;

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
      final source = await _getBezelSoftwareSource();
      if (source == null) return;

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

  Future<DesktopCapturerSource?> _getBezelSoftwareSource() async {
    final sources = await desktopCapturer.getSources(types: [_sourceType]);
    const softwareWindowName = 'Lucas’s iPhone';
    final source = sources.firstWhere(
      (source) => source.name == softwareWindowName,
    );

    return source;
  }

  @override
  Widget build(BuildContext context) => FlutterDeckSlideStepsListener(
        listener: (context, stepNumber) {
          if (stepNumber == 2) {
            selectScreenSourceDialog(context);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Japanana App\n Showcase',
              style: context.textTheme.title,
            ),
            horizontalMargin48,
            horizontalMargin48,
            Column(
              children: [
                const Spacer(),
                Container(
                  width: 340,
                  height: 700,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context
                        .flutterDeckTheme.materialTheme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: _localStream == null
                      ? const Center(
                          child: Text(
                            'Booting up iPhone...',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Center(
                          child: RTCVideoView(
                            _localRenderer,
                          ),
                        ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      );
}
