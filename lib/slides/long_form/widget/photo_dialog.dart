import 'package:flutter/material.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/core/widgets/paddings.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

class PhotoDialog extends StatelessWidget {
  const PhotoDialog({required this.formKey, super.key});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final fotoWidget = Container(
      color: Colors.grey,
      width: 200,
      height: 200,
      child: Assets.images.lucas.image(
        fit: BoxFit.cover,
      ),
    );

    return GestureDetector(
      onTap: () => {
        formKey.currentState?.reset(),
        Navigator.of(context).pop(),
      },
      child: Padding(
        padding: allPadding48,
        child: ColoredBox(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalMargin16,
                for (int i = 0; i < 50; i++)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fotoWidget,
                          horizontalMargin12,
                          fotoWidget,
                          horizontalMargin12,
                          fotoWidget,
                        ],
                      ),
                      verticalMargin16,
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
