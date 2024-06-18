import 'package:flutter/material.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/margins.dart';
import 'package:state_restoration_presentation/core/widgets/paddings.dart';

class PhotoDialog extends StatelessWidget {
  const PhotoDialog({required this.formKey, super.key});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => {
          formKey.currentState?.reset(),
          Navigator.of(context).pop(),
        },
        child: Padding(
          padding: allPadding48,
          child: ColoredBox(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                    horizontalMargin12,
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                    horizontalMargin12,
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                  ],
                ),
                verticalMargin12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                    horizontalMargin12,
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                    horizontalMargin12,
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                  ],
                ),
                verticalMargin12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                    horizontalMargin12,
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                    horizontalMargin12,
                    Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(context.l10n.photo),
                      ),
                    ),
                  ],
                ),
                verticalMargin16,
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.reset();
                    Navigator.of(context).pop();
                  },
                  child: Text(context.l10n.closeMe),
                ),
              ],
            ),
          ),
        ),
      );
}
