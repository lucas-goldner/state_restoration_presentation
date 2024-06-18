import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class OutroSlide extends FlutterDeckSlideWidget {
  const OutroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/outro-slide',
            title: 'Outro slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.qr.image(height: 400, width: 400),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      context.l10n.thanks,
                      style: context.textTheme.title,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 12),
                      child: Assets.images.youtrustFullLogo.svg(
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalMargin32,
            Text(
              context.l10n.letsConntect,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            verticalMargin32,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.madeWith,
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                horizontalMargin12,
                Assets.images.flutterDeckLogo.image(),
              ],
            ),
          ],
        );
      },
    );
  }
}
